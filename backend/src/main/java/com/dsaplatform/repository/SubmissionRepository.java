package com.dsaplatform.repository;

import com.dsaplatform.model.Submission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SubmissionRepository extends JpaRepository<Submission, UUID> {

    @Query("SELECT s FROM Submission s WHERE s.user.id = :userId ORDER BY s.submittedAt DESC")
    List<Submission> findByUserIdOrderBySubmittedAtDesc(UUID userId);

    @Query("SELECT s FROM Submission s WHERE s.problem.id = :problemId ORDER BY s.submittedAt DESC")
    List<Submission> findByProblemIdOrderBySubmittedAtDesc(UUID problemId);

    @Query("SELECT s FROM Submission s WHERE s.user.id = :userId AND s.problem.id = :problemId ORDER BY s.submittedAt DESC")
    List<Submission> findByUserIdAndProblemIdOrderBySubmittedAtDesc(UUID userId, UUID problemId);

    @Query("SELECT s FROM Submission s WHERE s.status = 'PENDING' ORDER BY s.submittedAt ASC")
    List<Submission> findPendingSubmissions();

    @Query("SELECT COUNT(s) FROM Submission s WHERE s.user.id = :userId AND s.status = 'ACCEPTED'")
    long countAcceptedByUserId(UUID userId);
}
