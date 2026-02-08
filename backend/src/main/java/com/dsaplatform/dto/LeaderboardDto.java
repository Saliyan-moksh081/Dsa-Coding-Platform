package com.dsaplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

public class LeaderboardDto {

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class LeaderboardResponse {
        private List<LeaderboardEntry> entries;
        private Integer totalUsers;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class LeaderboardEntry {
        private Integer rank;
        private String userId;
        private String name;
        private String email;
        private Integer totalScore;
        private Integer problemsSolved;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class StatsResponse {
        private Integer totalProblems;
        private Integer easyProblems;
        private Integer mediumProblems;
        private Integer hardProblems;
        private Integer totalUsers;
        private Integer totalSubmissions;
    }
}
