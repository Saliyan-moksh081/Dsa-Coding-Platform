package com.dsaplatform.service;

import com.dsaplatform.dto.LeaderboardDto;
import com.dsaplatform.model.Problem;
import com.dsaplatform.model.User;
import com.dsaplatform.repository.ProblemRepository;
import com.dsaplatform.repository.SubmissionRepository;
import com.dsaplatform.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class LeaderboardService {

    private final UserRepository userRepository;
    private final ProblemRepository problemRepository;
    private final SubmissionRepository submissionRepository;

    public LeaderboardDto.LeaderboardResponse getLeaderboard() {
        List<User> users = userRepository.findAllOrderByScoreDesc();

        AtomicInteger rank = new AtomicInteger(1);
        List<LeaderboardDto.LeaderboardEntry> entries = users.stream()
                .map(user -> LeaderboardDto.LeaderboardEntry.builder()
                        .rank(rank.getAndIncrement())
                        .userId(user.getId().toString())
                        .name(user.getName())
                        .email(user.getEmail())
                        .totalScore(user.getTotalScore())
                        .problemsSolved(user.getProblemsSolved())
                        .build())
                .collect(Collectors.toList());

        return LeaderboardDto.LeaderboardResponse.builder()
                .entries(entries)
                .totalUsers(users.size())
                .build();
    }

    public LeaderboardDto.LeaderboardResponse getTopUsers(int limit) {
        List<User> users = userRepository.findTopByScore(limit);

        AtomicInteger rank = new AtomicInteger(1);
        List<LeaderboardDto.LeaderboardEntry> entries = users.stream()
                .map(user -> LeaderboardDto.LeaderboardEntry.builder()
                        .rank(rank.getAndIncrement())
                        .userId(user.getId().toString())
                        .name(user.getName())
                        .email(user.getEmail())
                        .totalScore(user.getTotalScore())
                        .problemsSolved(user.getProblemsSolved())
                        .build())
                .collect(Collectors.toList());

        return LeaderboardDto.LeaderboardResponse.builder()
                .entries(entries)
                .totalUsers((int) userRepository.count())
                .build();
    }

    public LeaderboardDto.StatsResponse getStats() {
        return LeaderboardDto.StatsResponse.builder()
                .totalProblems((int) problemRepository.count())
                .easyProblems((int) problemRepository.countByDifficulty(Problem.Difficulty.EASY))
                .mediumProblems((int) problemRepository.countByDifficulty(Problem.Difficulty.MEDIUM))
                .hardProblems((int) problemRepository.countByDifficulty(Problem.Difficulty.HARD))
                .totalUsers((int) userRepository.count())
                .totalSubmissions((int) submissionRepository.count())
                .build();
    }
}
