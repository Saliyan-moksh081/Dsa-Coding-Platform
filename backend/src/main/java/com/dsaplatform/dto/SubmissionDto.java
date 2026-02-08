package com.dsaplatform.dto;

import com.dsaplatform.model.Submission;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

public class SubmissionDto {

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SubmitRequest {
        @NotBlank(message = "Problem ID is required")
        private String problemId;

        @NotBlank(message = "Code is required")
        private String code;

        @NotNull(message = "Language is required")
        private Submission.Language language;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class RunRequest {
        @NotBlank(message = "Problem ID is required")
        private String problemId;

        @NotBlank(message = "Code is required")
        private String code;

        @NotNull(message = "Language is required")
        private Submission.Language language;

        // Optional custom input for testing
        private String customInput;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SubmissionResponse {
        private String id;
        private String problemId;
        private String problemTitle;
        private String language;
        private String status;
        private Integer passedTests;
        private Integer totalTests;
        private Integer executionTimeMs;
        private String errorMessage;
        private LocalDateTime submittedAt;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class RunResponse {
        private String status;
        private List<TestCaseResult> testResults;
        private String errorMessage;
        private Integer executionTimeMs;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class TestCaseResult {
        private Integer testNumber;
        private String input;
        private String expectedOutput;
        private String actualOutput;
        private Boolean passed;
        private Integer executionTimeMs;
    }
}
