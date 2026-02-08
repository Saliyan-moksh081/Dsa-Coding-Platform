package com.dsaplatform.service;

import com.dsaplatform.dto.SubmissionDto;
import com.dsaplatform.model.Submission;
import com.dsaplatform.model.TestCase;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class CodeExecutionService {

    @Value("${judge.timeout-seconds:5}")
    private int timeoutSeconds;

    @Value("${judge.memory-limit-mb:256}")
    private int memoryLimitMb;

    public static class ExecutionResult {
        public String output;
        public String error;
        public int exitCode;
        public long executionTimeMs;
        public boolean timedOut;
    }

    public List<SubmissionDto.TestCaseResult> runTestCases(String code, Submission.Language language,
            List<TestCase> testCases) {
        List<SubmissionDto.TestCaseResult> results = new ArrayList<>();

        int testNum = 1;
        for (TestCase testCase : testCases) {
            SubmissionDto.TestCaseResult result = runSingleTestCase(
                    code, language, testCase.getInput(), testCase.getExpectedOutput(), testNum++);
            results.add(result);
        }

        return results;
    }

    public SubmissionDto.TestCaseResult runSingleTestCase(String code, Submission.Language language,
            String input, String expectedOutput, int testNum) {
        Path tempDir = null;
        try {
            tempDir = Files.createTempDirectory("dsa-judge-");

            // Write source code to file
            String fileName = language.getFileName();
            Path sourceFile = tempDir.resolve(fileName);
            Files.writeString(sourceFile, code);

            // Compile if needed
            if (needsCompilation(language)) {
                ExecutionResult compileResult = compile(tempDir, language, fileName);
                if (compileResult.exitCode != 0) {
                    return SubmissionDto.TestCaseResult.builder()
                            .testNumber(testNum)
                            .input(truncate(input, 200))
                            .expectedOutput(truncate(expectedOutput, 200))
                            .actualOutput("")
                            .passed(false)
                            .executionTimeMs(0)
                            .build();
                }
            }

            // Run with input
            ExecutionResult runResult = execute(tempDir, language, input);

            if (runResult.timedOut) {
                return SubmissionDto.TestCaseResult.builder()
                        .testNumber(testNum)
                        .input(truncate(input, 200))
                        .expectedOutput(truncate(expectedOutput, 200))
                        .actualOutput("Time Limit Exceeded")
                        .passed(false)
                        .executionTimeMs((int) runResult.executionTimeMs)
                        .build();
            }

            String actualOutput = runResult.output.trim();
            String expected = expectedOutput.trim();
            boolean passed = actualOutput.equals(expected);

            return SubmissionDto.TestCaseResult.builder()
                    .testNumber(testNum)
                    .input(truncate(input, 200))
                    .expectedOutput(truncate(expectedOutput, 200))
                    .actualOutput(truncate(actualOutput, 200))
                    .passed(passed)
                    .executionTimeMs((int) runResult.executionTimeMs)
                    .build();

        } catch (Exception e) {
            log.error("Error executing code", e);
            return SubmissionDto.TestCaseResult.builder()
                    .testNumber(testNum)
                    .input(truncate(input, 200))
                    .expectedOutput(truncate(expectedOutput, 200))
                    .actualOutput("Runtime Error: " + e.getMessage())
                    .passed(false)
                    .executionTimeMs(0)
                    .build();
        } finally {
            if (tempDir != null) {
                cleanupDirectory(tempDir);
            }
        }
    }

    private boolean needsCompilation(Submission.Language language) {
        return language == Submission.Language.JAVA ||
                language == Submission.Language.CPP ||
                language == Submission.Language.GO;
    }

    private ExecutionResult compile(Path workDir, Submission.Language language, String fileName) throws Exception {
        List<String> command = new ArrayList<>();

        switch (language) {
            case JAVA:
                command.add("javac");
                command.add(fileName);
                break;
            case CPP:
                command.add("g++");
                command.add("-o");
                command.add("main");
                command.add(fileName);
                command.add("-std=c++17");
                break;
            case GO:
                command.add("go");
                command.add("build");
                command.add("-o");
                command.add("main");
                command.add(fileName);
                break;
            default:
                return new ExecutionResult();
        }

        return runProcess(workDir, command, "", 30); // 30 second compile timeout
    }

    private ExecutionResult execute(Path workDir, Submission.Language language, String input) throws Exception {
        List<String> command = new ArrayList<>();

        switch (language) {
            case JAVA:
                command.add("java");
                command.add("-Xmx" + memoryLimitMb + "m");
                command.add("Main");
                break;
            case CPP:
                command.add("./main");
                break;
            case PYTHON:
                command.add("python3");
                command.add("main.py");
                break;
            case GO:
                command.add("./main");
                break;
        }

        return runProcess(workDir, command, input, timeoutSeconds);
    }

    private ExecutionResult runProcess(Path workDir, List<String> command, String input, int timeout) throws Exception {
        ExecutionResult result = new ExecutionResult();

        ProcessBuilder pb = new ProcessBuilder(command);
        pb.directory(workDir.toFile());
        pb.redirectErrorStream(true);

        long startTime = System.currentTimeMillis();
        Process process = pb.start();

        // Write input
        if (input != null && !input.isEmpty()) {
            try (OutputStream os = process.getOutputStream()) {
                os.write(input.getBytes());
                os.flush();
            }
        }

        // Read output with timeout
        StringBuilder output = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
            boolean completed = process.waitFor(timeout, TimeUnit.SECONDS);

            if (!completed) {
                process.destroyForcibly();
                result.timedOut = true;
                result.executionTimeMs = timeout * 1000L;
                return result;
            }

            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
        }

        result.executionTimeMs = System.currentTimeMillis() - startTime;
        result.exitCode = process.exitValue();
        result.output = output.toString();

        return result;
    }

    private void cleanupDirectory(Path dir) {
        try {
            Files.walk(dir)
                    .sorted((a, b) -> -a.compareTo(b))
                    .forEach(path -> {
                        try {
                            Files.deleteIfExists(path);
                        } catch (IOException e) {
                            log.warn("Failed to delete: " + path, e);
                        }
                    });
        } catch (IOException e) {
            log.warn("Failed to cleanup directory: " + dir, e);
        }
    }

    private String truncate(String str, int maxLen) {
        if (str == null)
            return "";
        return str.length() > maxLen ? str.substring(0, maxLen) + "..." : str;
    }
}
