package com.dsaplatform.repository;

import com.dsaplatform.model.UserSolvedProblem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserSolvedProblemRepository extends JpaRepository<UserSolvedProblem, UUID> {

    boolean existsByUserIdAndProblemId(UUID userId, UUID problemId);

    Optional<UserSolvedProblem> findByUserIdAndProblemId(UUID userId, UUID problemId);

    long countByUserId(UUID userId);
}
