package com.dsaplatform.controller;

import com.dsaplatform.dto.ProblemDto;
import com.dsaplatform.model.Problem;
import com.dsaplatform.service.ProblemService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/problems")
@RequiredArgsConstructor
public class ProblemController {

    private final ProblemService problemService;

    @GetMapping
    public ResponseEntity<List<ProblemDto.ProblemResponse>> getAllProblems(
            @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails != null ? userDetails.getUsername() : null;
        return ResponseEntity.ok(problemService.getAllProblems(email));
    }

    @GetMapping("/difficulty/{difficulty}")
    public ResponseEntity<List<ProblemDto.ProblemResponse>> getProblemsByDifficulty(
            @PathVariable Problem.Difficulty difficulty,
            @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails != null ? userDetails.getUsername() : null;
        return ResponseEntity.ok(problemService.getProblemsByDifficulty(difficulty, email));
    }

    @GetMapping("/{slug}")
    public ResponseEntity<ProblemDto.ProblemDetailResponse> getProblemBySlug(
            @PathVariable String slug,
            @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails != null ? userDetails.getUsername() : null;
        return ResponseEntity.ok(problemService.getProblemBySlug(slug, email));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ProblemDto.ProblemDetailResponse> createProblem(
            @Valid @RequestBody ProblemDto.CreateRequest request,
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(problemService.createProblem(request, userDetails.getUsername()));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> deleteProblem(@PathVariable UUID id) {
        problemService.deleteProblem(id);
        return ResponseEntity.noContent().build();
    }
}
