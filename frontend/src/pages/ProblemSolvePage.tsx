import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import Editor from '@monaco-editor/react';
import { problemsApi, submissionsApi } from '../services/api';
import './ProblemSolvePage.css';

interface TestCase {
    order: number;
    input: string;
    expectedOutput: string;
}

interface Problem {
    id: string;
    title: string;
    slug: string;
    difficulty: string;
    description: string;
    constraints: string;
    inputFormat: string;
    outputFormat: string;
    points: number;
    sampleTestCases: TestCase[];
    solved: boolean;
}

interface TestResult {
    testNumber: number;
    input: string;
    expectedOutput: string;
    actualOutput: string;
    passed: boolean;
    executionTimeMs: number;
}

type Language = 'JAVA' | 'CPP' | 'PYTHON' | 'GO';

const LANGUAGE_CONFIG: Record<Language, { label: string; monacoLang: string; template: string }> = {
    JAVA: {
        label: 'Java',
        monacoLang: 'java',
        template: `import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // Your code here
        
    }
}`,
    },
    CPP: {
        label: 'C++',
        monacoLang: 'cpp',
        template: `#include <bits/stdc++.h>
using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    // Your code here
    
    return 0;
}`,
    },
    PYTHON: {
        label: 'Python 3',
        monacoLang: 'python',
        template: `# Your code here

`,
    },
    GO: {
        label: 'Go',
        monacoLang: 'go',
        template: `package main

import (
    "fmt"
)

func main() {
    // Your code here
    
}`,
    },
};

const ProblemSolvePage: React.FC = () => {
    const { slug } = useParams<{ slug: string }>();
    const navigate = useNavigate();

    const [problem, setProblem] = useState<Problem | null>(null);
    const [loading, setLoading] = useState(true);
    const [language, setLanguage] = useState<Language>('JAVA');
    const [code, setCode] = useState(LANGUAGE_CONFIG.JAVA.template);
    const [activeTab, setActiveTab] = useState<'description' | 'submissions'>('description');

    const [running, setRunning] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const [results, setResults] = useState<TestResult[] | null>(null);
    const [submitResult, setSubmitResult] = useState<any>(null);

    useEffect(() => {
        const fetchProblem = async () => {
            if (!slug) return;
            try {
                const response = await problemsApi.getBySlug(slug);
                setProblem(response.data);
            } catch (error) {
                console.error('Error fetching problem:', error);
                navigate('/problems');
            } finally {
                setLoading(false);
            }
        };

        fetchProblem();
    }, [slug, navigate]);

    const handleLanguageChange = (newLang: Language) => {
        setLanguage(newLang);
        setCode(LANGUAGE_CONFIG[newLang].template);
    };

    const handleRun = async () => {
        if (!problem) return;
        setRunning(true);
        setResults(null);
        setSubmitResult(null);

        try {
            const response = await submissionsApi.run(problem.id, code, language);
            setResults(response.data.testResults);
        } catch (error: any) {
            console.error('Error running code:', error);
            setResults([{
                testNumber: 0,
                input: '',
                expectedOutput: '',
                actualOutput: error.response?.data?.message || 'Error running code',
                passed: false,
                executionTimeMs: 0,
            }]);
        } finally {
            setRunning(false);
        }
    };

    const handleSubmit = async () => {
        if (!problem) return;
        setSubmitting(true);
        setResults(null);
        setSubmitResult(null);

        try {
            const response = await submissionsApi.submit(problem.id, code, language);
            setSubmitResult(response.data);

            // Poll for result (simplified - in production use WebSocket)
            const pollResult = async (id: string, attempts = 0) => {
                if (attempts > 20) return;

                const statusResponse = await submissionsApi.getById(id);
                const submission = statusResponse.data;

                if (submission.status === 'PENDING' || submission.status === 'RUNNING') {
                    setTimeout(() => pollResult(id, attempts + 1), 1000);
                } else {
                    setSubmitResult(submission);
                    if (submission.status === 'ACCEPTED') {
                        setProblem(prev => prev ? { ...prev, solved: true } : prev);
                    }
                }
            };

            setTimeout(() => pollResult(response.data.id), 1000);

        } catch (error: any) {
            console.error('Error submitting code:', error);
            setSubmitResult({
                status: 'ERROR',
                errorMessage: error.response?.data?.message || 'Error submitting code',
            });
        } finally {
            setSubmitting(false);
        }
    };

    if (loading) {
        return (
            <div className="solve-page loading">
                <div className="spinner"></div>
            </div>
        );
    }

    if (!problem) {
        return (
            <div className="solve-page">
                <div className="error-message">Problem not found</div>
            </div>
        );
    }

    return (
        <div className="solve-page">
            <div className="solve-container">
                {/* Left Panel - Problem Description */}
                <div className="problem-panel">
                    <div className="problem-header">
                        <div className="problem-title-section">
                            <h1>{problem.title}</h1>
                            <div className="problem-meta">
                                <span className={`badge badge-${problem.difficulty.toLowerCase()}`}>
                                    {problem.difficulty}
                                </span>
                                <span className="problem-points">{problem.points} pts</span>
                                {problem.solved && (
                                    <span className="solved-badge">✓ Solved</span>
                                )}
                            </div>
                        </div>
                    </div>

                    <div className="problem-tabs">
                        <button
                            className={`tab ${activeTab === 'description' ? 'active' : ''}`}
                            onClick={() => setActiveTab('description')}
                        >
                            Description
                        </button>
                        <button
                            className={`tab ${activeTab === 'submissions' ? 'active' : ''}`}
                            onClick={() => setActiveTab('submissions')}
                        >
                            Submissions
                        </button>
                    </div>

                    <div className="problem-content">
                        {activeTab === 'description' && (
                            <>
                                <div className="markdown-content"
                                    dangerouslySetInnerHTML={{ __html: formatMarkdown(problem.description) }} />

                                {problem.constraints && (
                                    <div className="section">
                                        <h3>Constraints</h3>
                                        <pre className="constraints-box">{problem.constraints}</pre>
                                    </div>
                                )}

                                {problem.sampleTestCases && problem.sampleTestCases.length > 0 && (
                                    <div className="section">
                                        <h3>Sample Test Cases</h3>
                                        {problem.sampleTestCases.map((tc, index) => (
                                            <div key={index} className="test-case-box">
                                                <div className="test-case-header">Example {index + 1}</div>
                                                <div className="test-case-content">
                                                    <div className="test-io">
                                                        <div className="test-label">Input:</div>
                                                        <pre>{tc.input}</pre>
                                                    </div>
                                                    <div className="test-io">
                                                        <div className="test-label">Output:</div>
                                                        <pre>{tc.expectedOutput}</pre>
                                                    </div>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                )}
                            </>
                        )}

                        {activeTab === 'submissions' && (
                            <div className="submissions-list">
                                <p className="empty-text">Previous submissions will appear here</p>
                            </div>
                        )}
                    </div>
                </div>

                {/* Right Panel - Code Editor */}
                <div className="editor-panel">
                    <div className="editor-header">
                        <div className="language-selector">
                            {(Object.keys(LANGUAGE_CONFIG) as Language[]).map((lang) => (
                                <button
                                    key={lang}
                                    className={`lang-btn ${language === lang ? 'active' : ''}`}
                                    onClick={() => handleLanguageChange(lang)}
                                >
                                    {LANGUAGE_CONFIG[lang].label}
                                </button>
                            ))}
                        </div>

                        <div className="editor-actions">
                            <button
                                className="btn btn-secondary"
                                onClick={handleRun}
                                disabled={running || submitting}
                            >
                                {running ? 'Running...' : '▶ Run'}
                            </button>
                            <button
                                className="btn btn-success"
                                onClick={handleSubmit}
                                disabled={running || submitting}
                            >
                                {submitting ? 'Submitting...' : '✓ Submit'}
                            </button>
                        </div>
                    </div>

                    <div className="code-editor">
                        <Editor
                            height="100%"
                            language={LANGUAGE_CONFIG[language].monacoLang}
                            value={code}
                            onChange={(value) => setCode(value || '')}
                            theme="vs-dark"
                            options={{
                                fontSize: 14,
                                fontFamily: "'JetBrains Mono', Monaco, Consolas, monospace",
                                minimap: { enabled: false },
                                scrollBeyondLastLine: false,
                                padding: { top: 16 },
                                lineNumbers: 'on',
                                automaticLayout: true,
                            }}
                        />
                    </div>

                    {/* Results Panel */}
                    <div className="results-panel">
                        <div className="results-header">
                            <span>Output</span>
                        </div>
                        <div className="results-content">
                            {!results && !submitResult && (
                                <p className="empty-text">Run or submit your code to see results</p>
                            )}

                            {results && (
                                <div className="test-results">
                                    {results.map((result, index) => (
                                        <div key={index} className={`result-item ${result.passed ? 'passed' : 'failed'}`}>
                                            <div className="result-header">
                                                <span className="result-icon">{result.passed ? '✓' : '✗'}</span>
                                                <span>Test Case {result.testNumber}</span>
                                                <span className="result-time">{result.executionTimeMs}ms</span>
                                            </div>
                                            {!result.passed && (
                                                <div className="result-details">
                                                    <div><strong>Input:</strong> <code>{result.input}</code></div>
                                                    <div><strong>Expected:</strong> <code>{result.expectedOutput}</code></div>
                                                    <div><strong>Got:</strong> <code>{result.actualOutput}</code></div>
                                                </div>
                                            )}
                                        </div>
                                    ))}
                                </div>
                            )}

                            {submitResult && (
                                <div className={`submit-result ${submitResult.status?.toLowerCase()}`}>
                                    <div className="submit-status">
                                        {submitResult.status === 'ACCEPTED' ? '🎉' : '❌'} {submitResult.status?.replace('_', ' ')}
                                    </div>
                                    {submitResult.passedTests !== undefined && (
                                        <div className="submit-stats">
                                            Passed: {submitResult.passedTests}/{submitResult.totalTests} test cases
                                            {submitResult.executionTimeMs && ` • ${submitResult.executionTimeMs}ms`}
                                        </div>
                                    )}
                                    {submitResult.errorMessage && (
                                        <div className="submit-error">{submitResult.errorMessage}</div>
                                    )}
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

// Simple markdown to HTML (for demo - use marked/react-markdown in production)
function formatMarkdown(text: string): string {
    if (!text) return '';
    return text
        .replace(/## (.*)/g, '<h2>$1</h2>')
        .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
        .replace(/`(.*?)`/g, '<code>$1</code>')
        .replace(/```(\w*)\n([\s\S]*?)```/g, '<pre><code>$2</code></pre>')
        .replace(/\n/g, '<br>');
}

export default ProblemSolvePage;
