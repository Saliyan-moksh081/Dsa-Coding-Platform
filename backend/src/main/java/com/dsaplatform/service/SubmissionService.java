package com.dsaplatform.service;

import com.dsaplatform.dto.SubmissionDto;
import com.dsaplatform.model.*;
import com.dsaplatform.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class SubmissionService {

    private final SubmissionRepository submissionRepository;
    private final ProblemRepository problemRepository;
    private final UserRepository userRepository;
    private final TestCaseRepository testCaseRepository;
    private final UserSolvedProblemRepository userSolvedProblemRepository;
    private final CodeExecutionService codeExecutionService;

    @Transactional
    public SubmissionDto.SubmissionResponse submit(SubmissionDto.SubmitRequest request, String userEmail) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Problem problem = problemRepository.findById(UUID.fromString(request.getProblemId()))
                .orElseThrow(() -> new RuntimeException("Problem not found"));

        // Create submission record
        Submission submission = Submission.builder()
                .user(user)
                .problem(problem)
                .code(request.getCode())
                .language(request.getLanguage())
                .status(Submission.Status.PENDING)
                .build();

        submissionRepository.save(submission);

        // Execute asynchronously
        processSubmissionAsync(submission.getId());

        return mapToSubmissionResponse(submission);
    }

    @Async
    @Transactional
    public void processSubmissionAsync(UUID submissionId) {
        try {
            Submission submission = submissionRepository.findById(submissionId)
                    .orElseThrow(() -> new RuntimeException("Submission not found"));

            submission.setStatus(Submission.Status.RUNNING);
            submissionRepository.save(submission);

            List<TestCase> testCases = testCaseRepository.findByProblemIdOrderByOrderNum(
                    submission.getProblem().getId());

            submission.setTotalTests(testCases.size());

            // Run all test cases
            List<SubmissionDto.TestCaseResult> results = codeExecutionService.runTestCases(
                    submission.getCode(),
                    submission.getLanguage(),
                    testCases);

            int passedCount = (int) results.stream().filter(SubmissionDto.TestCaseResult::getPassed).count();
            submission.setPassedTests(passedCount);

            // Calculate total execution time
            int totalTime = results.stream()
                    .mapToInt(r -> r.getExecutionTimeMs() != null ? r.getExecutionTimeMs() : 0)
                    .sum();
            submission.setExecutionTimeMs(totalTime);

            // Determine status
            if (passedCount == testCases.size()) {
                submission.setStatus(Submission.Status.ACCEPTED);
                handleAcceptedSubmission(submission);
            } else {
                // Check for specific error types
                boolean hasRuntimeError = results.stream()
                        .anyMatch(r -> r.getActualOutput() != null && r.getActualOutput().startsWith("Runtime Error"));
                boolean hasTLE = results.stream()
                        .anyMatch(r -> r.getActualOutput() != null && r.getActualOutput().contains("Time Limit"));

                if (hasTLE) {
                    submission.setStatus(Submission.Status.TIME_LIMIT_EXCEEDED);
                } else if (hasRuntimeError) {
                    submission.setStatus(Submission.Status.RUNTIME_ERROR);
                } else {
                    submission.setStatus(Submission.Status.WRONG_ANSWER);
                }
            }

            submissionRepository.save(submission);

        } catch (Exception e) {
            log.error("Error processing submission: " + submissionId, e);
            Submission submission = submissionRepository.findById(submissionId).orElse(null);
            if (submission != null) {
                submission.setStatus(Submission.Status.RUNTIME_ERROR);
                submission.setErrorMessage(e.getMessage());
                submissionRepository.save(submission);
            }
        }
    }

    @Transactional
    public SubmissionDto.RunResponse run(SubmissionDto.RunRequest request, String userEmail) {
        Problem problem = problemRepository.findById(UUID.fromString(request.getProblemId()))
                .orElseThrow(() -> new RuntimeException("Problem not found"));

        // Only run sample test cases for "Run" (not full submit)
        List<TestCase> sampleTestCases = testCaseRepository.findSampleTestCasesByProblemId(problem.getId());

        if (sampleTestCases.isEmpty()) {
            return SubmissionDto.RunResponse.builder()
                    .status("NO_TEST_CASES")
                    .errorMessage("No sample test cases available")
                    .build();
        }

        List<SubmissionDto.TestCaseResult> results = codeExecutionService.runTestCases(
                request.getCode(),
                request.getLanguage(),
                sampleTestCases);

        int passedCount = (int) results.stream().filter(SubmissionDto.TestCaseResult::getPassed).count();
        int totalTime = results.stream()
                .mapToInt(r -> r.getExecutionTimeMs() != null ? r.getExecutionTimeMs() : 0)
                .sum();

        String status = passedCount == sampleTestCases.size() ? "ALL_PASSED" : "SOME_FAILED";

        return SubmissionDto.RunResponse.builder()
                .status(status)
                .testResults(results)
                .executionTimeMs(totalTime)
                .build();
    }

    public SubmissionDto.SubmissionResponse getSubmission(UUID id) {
        Submission submission = submissionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Submission not found"));
        return mapToSubmissionResponse(submission);
    }

    public List<SubmissionDto.SubmissionResponse> getUserSubmissions(String userEmail) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new RuntimeException("User not found"));

        return submissionRepository.findByUserIdOrderBySubmittedAtDesc(user.getId()).stream()
                .map(this::mapToSubmissionResponse)
                .collect(Collectors.toList());
    }

    public List<SubmissionDto.SubmissionResponse> getProblemSubmissions(UUID problemId, String userEmail) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new RuntimeException("User not found"));

        return submissionRepository.findByUserIdAndProblemIdOrderBySubmittedAtDesc(user.getId(), problemId).stream()
                .map(this::mapToSubmissionResponse)
                .collect(Collectors.toList());
    }

    private void handleAcceptedSubmission(Submission submission) {
        UUID userId = submission.getUser().getId();
        UUID problemId = submission.getProblem().getId();

        // Check if already solved
        if (!userSolvedProblemRepository.existsByUserIdAndProblemId(userId, problemId)) {
            // First time solving - award points
            UserSolvedProblem solved = UserSolvedProblem.builder()
                    .user(submission.getUser())
                    .problem(submission.getProblem())
                    .submission(submission)
                    .build();
            userSolvedProblemRepository.save(solved);

            // Update user score
            User user = submission.getUser();
            user.setTotalScore(user.getTotalScore() + submission.getProblem().getPoints());
            user.setProblemsSolved(user.getProblemsSolved() + 1);
            userRepository.save(user);
        }
    }

    private SubmissionDto.SubmissionResponse mapToSubmissionResponse(Submission submission) {
        return SubmissionDto.SubmissionResponse.builder()
                .id(submission.getId().toString())
                .problemId(submission.getProblem().getId().toString())
                .problemTitle(submission.getProblem().getTitle())
                .language(submission.getLanguage().getDisplayName())
                .status(submission.getStatus().name())
                .passedTests(submission.getPassedTests())
                .totalTests(submission.getTotalTests())
                .executionTimeMs(submission.getExecutionTimeMs())
                .errorMessage(submission.getErrorMessage())
                .submittedAt(submission.getSubmittedAt())
                .build();
    }
}
