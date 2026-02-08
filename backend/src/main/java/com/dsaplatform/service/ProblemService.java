package com.dsaplatform.service;

import com.dsaplatform.dto.ProblemDto;
import com.dsaplatform.model.Problem;
import com.dsaplatform.model.TestCase;
import com.dsaplatform.model.User;
import com.dsaplatform.repository.ProblemRepository;
import com.dsaplatform.repository.TestCaseRepository;
import com.dsaplatform.repository.UserRepository;
import com.dsaplatform.repository.UserSolvedProblemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Normalizer;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProblemService {

    private final ProblemRepository problemRepository;
    private final TestCaseRepository testCaseRepository;
    private final UserRepository userRepository;
    private final UserSolvedProblemRepository userSolvedProblemRepository;

    private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
    private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

    public List<ProblemDto.ProblemResponse> getAllProblems(String userEmail) {
        UUID userId = userEmail != null ? getUserId(userEmail) : null;

        return problemRepository.findAllOrderByCreatedAtDesc().stream()
                .map(problem -> mapToProblemResponse(problem, userId))
                .collect(Collectors.toList());
    }

    public List<ProblemDto.ProblemResponse> getProblemsByDifficulty(Problem.Difficulty difficulty, String userEmail) {
        UUID userId = userEmail != null ? getUserId(userEmail) : null;

        return problemRepository.findByDifficulty(difficulty).stream()
                .map(problem -> mapToProblemResponse(problem, userId))
                .collect(Collectors.toList());
    }

    public ProblemDto.ProblemDetailResponse getProblemBySlug(String slug, String userEmail) {
        UUID userId = userEmail != null ? getUserId(userEmail) : null;

        Problem problem = problemRepository.findBySlug(slug)
                .orElseThrow(() -> new RuntimeException("Problem not found"));

        List<TestCase> sampleTestCases = testCaseRepository.findSampleTestCasesByProblemId(problem.getId());

        boolean solved = userId != null &&
                userSolvedProblemRepository.existsByUserIdAndProblemId(userId, problem.getId());

        return ProblemDto.ProblemDetailResponse.builder()
                .id(problem.getId().toString())
                .title(problem.getTitle())
                .slug(problem.getSlug())
                .difficulty(problem.getDifficulty().name())
                .description(problem.getDescription())
                .constraints(problem.getConstraints())
                .inputFormat(problem.getInputFormat())
                .outputFormat(problem.getOutputFormat())
                .points(problem.getPoints())
                .solved(solved)
                .sampleTestCases(sampleTestCases.stream()
                        .map(tc -> ProblemDto.TestCaseResponse.builder()
                                .order(tc.getOrderNumber())
                                .input(tc.getInput())
                                .expectedOutput(tc.getExpectedOutput())
                                .build())
                        .collect(Collectors.toList()))
                .createdAt(problem.getCreatedAt())
                .build();
    }

    public ProblemDto.ProblemDetailResponse getProblemById(UUID id, String userEmail) {
        Problem problem = problemRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Problem not found"));
        return getProblemBySlug(problem.getSlug(), userEmail);
    }

    @Transactional
    public ProblemDto.ProblemDetailResponse createProblem(ProblemDto.CreateRequest request, String creatorEmail) {
        User creator = userRepository.findByEmail(creatorEmail)
                .orElseThrow(() -> new RuntimeException("User not found"));

        String slug = toSlug(request.getTitle());

        // Ensure unique slug
        int counter = 1;
        String originalSlug = slug;
        while (problemRepository.existsBySlug(slug)) {
            slug = originalSlug + "-" + counter++;
        }

        Problem problem = Problem.builder()
                .title(request.getTitle())
                .slug(slug)
                .difficulty(request.getDifficulty())
                .description(request.getDescription())
                .constraints(request.getConstraints())
                .inputFormat(request.getInputFormat())
                .outputFormat(request.getOutputFormat())
                .points(request.getDifficulty().getDefaultPoints())
                .createdBy(creator)
                .build();

        problemRepository.save(problem);

        // Add test cases
        if (request.getTestCases() != null) {
            int order = 0;
            for (ProblemDto.TestCaseRequest tcRequest : request.getTestCases()) {
                TestCase testCase = TestCase.builder()
                        .problem(problem)
                        .input(tcRequest.getInput())
                        .expectedOutput(tcRequest.getExpectedOutput())
                        .isSample(tcRequest.getIsSample() != null ? tcRequest.getIsSample() : false)
                        .orderNumber(order++)
                        .build();
                testCaseRepository.save(testCase);
            }
        }

        return getProblemBySlug(slug, creatorEmail);
    }

    @Transactional
    public void deleteProblem(UUID id) {
        if (!problemRepository.existsById(id)) {
            throw new RuntimeException("Problem not found");
        }
        problemRepository.deleteById(id);
    }

    private ProblemDto.ProblemResponse mapToProblemResponse(Problem problem, UUID userId) {
        boolean solved = userId != null &&
                userSolvedProblemRepository.existsByUserIdAndProblemId(userId, problem.getId());

        return ProblemDto.ProblemResponse.builder()
                .id(problem.getId().toString())
                .title(problem.getTitle())
                .slug(problem.getSlug())
                .difficulty(problem.getDifficulty().name())
                .points(problem.getPoints())
                .solved(solved)
                .createdAt(problem.getCreatedAt())
                .build();
    }

    private UUID getUserId(String email) {
        return userRepository.findByEmail(email)
                .map(User::getId)
                .orElse(null);
    }

    private String toSlug(String input) {
        String noWhitespace = WHITESPACE.matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(noWhitespace, Normalizer.Form.NFD);
        String slug = NONLATIN.matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH);
    }
}
