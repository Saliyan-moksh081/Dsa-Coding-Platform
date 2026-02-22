package com.dsaplatform.dto;

import com.dsaplatform.model.Problem;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

public class ProblemDto {

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class CreateRequest {
        @NotBlank(message = "Title is required")
        private String title;

        @NotNull(message = "Difficulty is required")
        private Problem.Difficulty difficulty;

        @NotBlank(message = "Description is required")
        private String description;

        private String constraints;
        private String inputFormat;
        private String outputFormat;

        @Valid
        private List<TestCaseRequest> testCases;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class TestCaseRequest {
        @NotBlank(message = "Input is required")
        private String input;

        @NotBlank(message = "Expected output is required")
        private String expectedOutput;

        private Boolean isSample;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ProblemResponse {
        private String id;
        private String title;
        private String slug;
        private String difficulty;
        private Integer points;
        private String topic;
        private LocalDateTime createdAt;
        private Boolean solved; // Whether current user has solved it
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ProblemDetailResponse {
        private String id;
        private String title;
        private String slug;
        private String difficulty;
        private String description;
        private String constraints;
        private String inputFormat;
        private String outputFormat;
        private Integer points;
        private List<TestCaseResponse> sampleTestCases;
        private Boolean solved;
        private String topic;
        private LocalDateTime createdAt;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class TestCaseResponse {
        private Integer order;
        private String input;
        private String expectedOutput;
    }
}
