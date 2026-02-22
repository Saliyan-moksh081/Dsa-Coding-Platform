package com.dsaplatform.service;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class LeetCodeService {

    private final RestClient restClient = RestClient.create("https://leetcode.com/graphql");

    @Data
    public static class LeetCodeStats {
        private int easySolved;
        private int mediumSolved;
        private int hardSolved;
        private int totalSolved;

        public int calculatePoints() {
            return (easySolved * 10) + (mediumSolved * 25) + (hardSolved * 50);
        }
    }

    public LeetCodeStats fetchUserStats(String username) {
        String query = """
                query userProblemsSolved($username: String!) {
                  allQuestionsCount {
                    difficulty
                    count
                  }
                  matchedUser(username: $username) {
                    problemsSolvedBeatsStats {
                      difficulty
                      percentage
                    }
                    submitStatsGlobal {
                      acSubmissionNum {
                        difficulty
                        count
                      }
                    }
                  }
                }
                """;

        Map<String, Object> body = Map.of(
                "query", query,
                "variables", Map.of("username", username));

        try {
            Map result = restClient.post()
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(body)
                    .retrieve()
                    .body(Map.class);

            if (result == null || !result.containsKey("data")) {
                throw new RuntimeException("Invalid response from LeetCode API");
            }

            Map data = (Map) result.get("data");
            Map matchedUser = (Map) data.get("matchedUser");
            if (matchedUser == null) {
                throw new RuntimeException("LeetCode user not found: " + username);
            }

            Map submitStats = (Map) matchedUser.get("submitStatsGlobal");
            List<Map> acSubmissions = (List<Map>) submitStats.get("acSubmissionNum");

            LeetCodeStats stats = new LeetCodeStats();
            for (Map submission : acSubmissions) {
                String difficulty = (String) submission.get("difficulty");
                int count = (int) submission.get("count");

                switch (difficulty) {
                    case "All" -> stats.setTotalSolved(count);
                    case "Easy" -> stats.setEasySolved(count);
                    case "Medium" -> stats.setMediumSolved(count);
                    case "Hard" -> stats.setHardSolved(count);
                }
            }

            return stats;
        } catch (Exception e) {
            log.error("Error fetching LeetCode stats for user {}: {}", username, e.getMessage());
            throw new RuntimeException("Failed to fetch LeetCode statistics", e);
        }
    }
}
