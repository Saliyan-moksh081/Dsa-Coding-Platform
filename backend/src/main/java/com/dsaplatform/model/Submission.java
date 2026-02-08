package com.dsaplatform.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "submissions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Submission {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "problem_id", nullable = false)
    private Problem problem;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String code;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Language language;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @Builder.Default
    private Status status = Status.PENDING;

    @Column(name = "passed_tests", nullable = false)
    @Builder.Default
    private Integer passedTests = 0;

    @Column(name = "total_tests", nullable = false)
    @Builder.Default
    private Integer totalTests = 0;

    @Column(name = "execution_time_ms")
    private Integer executionTimeMs;

    @Column(name = "memory_used_kb")
    private Integer memoryUsedKb;

    @Column(name = "error_message", columnDefinition = "TEXT")
    private String errorMessage;

    @CreationTimestamp
    @Column(name = "submitted_at", nullable = false, updatable = false)
    private LocalDateTime submittedAt;

    public enum Language {
        JAVA("java", "java", "Main.java"),
        CPP("cpp", "g++", "main.cpp"),
        PYTHON("python3", "python3", "main.py"),
        GO("go", "go", "main.go");

        private final String name;
        private final String compiler;
        private final String fileName;

        Language(String name, String compiler, String fileName) {
            this.name = name;
            this.compiler = compiler;
            this.fileName = fileName;
        }

        public String getDisplayName() {
            return name;
        }

        public String getCompiler() {
            return compiler;
        }

        public String getFileName() {
            return fileName;
        }
    }

    public enum Status {
        PENDING,
        RUNNING,
        ACCEPTED,
        WRONG_ANSWER,
        COMPILATION_ERROR,
        RUNTIME_ERROR,
        TIME_LIMIT_EXCEEDED,
        MEMORY_LIMIT_EXCEEDED
    }
}
