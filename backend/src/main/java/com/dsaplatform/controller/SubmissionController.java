package com.dsaplatform.controller;

import com.dsaplatform.dto.SubmissionDto;
import com.dsaplatform.service.SubmissionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/submissions")
@RequiredArgsConstructor
public class SubmissionController {

    private final SubmissionService submissionService;

    @PostMapping
    public ResponseEntity<SubmissionDto.SubmissionResponse> submit(
            @Valid @RequestBody SubmissionDto.SubmitRequest request,
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(submissionService.submit(request, userDetails.getUsername()));
    }

    @PostMapping("/run")
    public ResponseEntity<SubmissionDto.RunResponse> run(
            @Valid @RequestBody SubmissionDto.RunRequest request,
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(submissionService.run(request, userDetails.getUsername()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<SubmissionDto.SubmissionResponse> getSubmission(@PathVariable UUID id) {
        return ResponseEntity.ok(submissionService.getSubmission(id));
    }

    @GetMapping("/my")
    public ResponseEntity<List<SubmissionDto.SubmissionResponse>> getMySubmissions(
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(submissionService.getUserSubmissions(userDetails.getUsername()));
    }

    @GetMapping("/problem/{problemId}")
    public ResponseEntity<List<SubmissionDto.SubmissionResponse>> getProblemSubmissions(
            @PathVariable UUID problemId,
            @AuthenticationPrincipal UserDetails userDetails) {
        return ResponseEntity.ok(submissionService.getProblemSubmissions(problemId, userDetails.getUsername()));
    }
}
