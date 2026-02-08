package com.dsaplatform.repository;

import com.dsaplatform.model.TestCase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface TestCaseRepository extends JpaRepository<TestCase, UUID> {

    @Query("SELECT tc FROM TestCase tc WHERE tc.problem.id = :problemId ORDER BY tc.orderNumber")
    List<TestCase> findByProblemIdOrderByOrderNum(UUID problemId);

    @Query("SELECT tc FROM TestCase tc WHERE tc.problem.id = :problemId AND tc.isSample = true ORDER BY tc.orderNumber")
    List<TestCase> findSampleTestCasesByProblemId(UUID problemId);

    void deleteByProblemId(UUID problemId);
}
