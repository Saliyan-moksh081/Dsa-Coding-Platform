package com.dsaplatform.repository;

import com.dsaplatform.model.Problem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ProblemRepository extends JpaRepository<Problem, UUID> {

    Optional<Problem> findBySlug(String slug);

    boolean existsBySlug(String slug);

    List<Problem> findByDifficulty(Problem.Difficulty difficulty);

    @Query("SELECT p FROM Problem p ORDER BY p.createdAt DESC")
    List<Problem> findAllOrderByCreatedAtDesc();

    @Query("SELECT COUNT(p) FROM Problem p WHERE p.difficulty = :difficulty")
    long countByDifficulty(Problem.Difficulty difficulty);
}
