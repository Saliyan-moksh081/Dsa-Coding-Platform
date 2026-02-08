package com.dsaplatform.controller;

import com.dsaplatform.dto.LeaderboardDto;
import com.dsaplatform.service.LeaderboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/leaderboard")
@RequiredArgsConstructor
public class LeaderboardController {

    private final LeaderboardService leaderboardService;

    @GetMapping
    public ResponseEntity<LeaderboardDto.LeaderboardResponse> getLeaderboard() {
        return ResponseEntity.ok(leaderboardService.getLeaderboard());
    }

    @GetMapping("/top/{limit}")
    public ResponseEntity<LeaderboardDto.LeaderboardResponse> getTopUsers(@PathVariable int limit) {
        return ResponseEntity.ok(leaderboardService.getTopUsers(limit));
    }

    @GetMapping("/stats")
    public ResponseEntity<LeaderboardDto.StatsResponse> getStats() {
        return ResponseEntity.ok(leaderboardService.getStats());
    }
}
