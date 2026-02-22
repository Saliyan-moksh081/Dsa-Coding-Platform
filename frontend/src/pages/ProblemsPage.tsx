import React, { useEffect, useState } from 'react';
import { problemsApi, leaderboardApi } from '../services/api';
import './ProblemsPage.css';

interface Problem {
    id: string;
    title: string;
    slug: string;
    difficulty: string;
    points: number;
    solved: boolean;
    topic: string;
}

interface Stats {
    totalProblems: number;
    easyProblems: number;
    mediumProblems: number;
    hardProblems: number;
    totalUsers: number;
}

const ProblemsPage: React.FC = () => {
    const [problems, setProblems] = useState<Problem[]>([]);
    const [stats, setStats] = useState<Stats | null>(null);
    const [loading, setLoading] = useState(true);
    const [difficultyFilter, setDifficultyFilter] = useState<string>('ALL');
    const [topicFilter, setTopicFilter] = useState<string>('ALL');

    const topics = ['ALL', ...Array.from(new Set(problems.map(p => p.topic || 'General')))];


    useEffect(() => {
        const fetchData = async () => {
            try {
                const [problemsRes, statsRes] = await Promise.all([
                    problemsApi.getAll(),
                    leaderboardApi.getStats()
                ]);
                setProblems(problemsRes.data);
                setStats(statsRes.data);
            } catch (error) {
                console.error('Error fetching data:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    const filteredProblems = problems.filter(problem => {
        const matchesDifficulty = difficultyFilter === 'ALL' || problem.difficulty === difficultyFilter;
        const matchesTopic = topicFilter === 'ALL' || (problem.topic || 'General') === topicFilter;
        return matchesDifficulty && matchesTopic;
    });

    if (loading) {
        return (
            <div className="page loading-page">
                <div className="spinner"></div>
            </div>
        );
    }

    return (
        <div className="page problems-page">
            <div className="container">
                <div className="problems-header">
                    <div className="header-content">
                        <h1>Problem Set</h1>
                        <p>Practice and improve your DSA skills</p>
                    </div>

                    {stats && (
                        <div className="stats-cards">
                            <div className="stat-card">
                                <span className="stat-value">{stats.totalProblems}</span>
                                <span className="stat-label">Problems</span>
                            </div>
                            <div className="stat-card stat-easy">
                                <span className="stat-value">{stats.easyProblems}</span>
                                <span className="stat-label">Easy</span>
                            </div>
                            <div className="stat-card stat-medium">
                                <span className="stat-value">{stats.mediumProblems}</span>
                                <span className="stat-label">Medium</span>
                            </div>
                            <div className="stat-card stat-hard">
                                <span className="stat-value">{stats.hardProblems}</span>
                                <span className="stat-label">Hard</span>
                            </div>
                        </div>
                    )}
                </div>

                <div className="problems-filters">
                    <div className="filter-group">
                        <span className="filter-label">Difficulty:</span>
                        <div className="filter-buttons">
                            <button
                                className={`filter-btn ${difficultyFilter === 'ALL' ? 'active' : ''}`}
                                onClick={() => setDifficultyFilter('ALL')}
                            >
                                All
                            </button>
                            <button
                                className={`filter-btn filter-easy ${difficultyFilter === 'EASY' ? 'active' : ''}`}
                                onClick={() => setDifficultyFilter('EASY')}
                            >
                                Easy
                            </button>
                            <button
                                className={`filter-btn filter-medium ${difficultyFilter === 'MEDIUM' ? 'active' : ''}`}
                                onClick={() => setDifficultyFilter('MEDIUM')}
                            >
                                Medium
                            </button>
                            <button
                                className={`filter-btn filter-hard ${difficultyFilter === 'HARD' ? 'active' : ''}`}
                                onClick={() => setDifficultyFilter('HARD')}
                            >
                                Hard
                            </button>
                        </div>
                    </div>

                    <div className="filter-group topic-filter-group">
                        <span className="filter-label">Topics:</span>
                        <div className="topic-tabs">
                            {topics.map(topic => (
                                <button
                                    key={topic}
                                    className={`topic-tab ${topicFilter === topic ? 'active' : ''}`}
                                    onClick={() => setTopicFilter(topic)}
                                >
                                    {topic}
                                </button>
                            ))}
                        </div>
                    </div>
                </div>

                <div className="problems-table-container">
                    <table className="problems-table">
                        <thead>
                            <tr>
                                <th>Status</th>
                                <th>Title</th>
                                <th>Difficulty</th>
                                <th>Points</th>
                            </tr>
                        </thead>
                        <tbody>
                            {filteredProblems.map((problem, index) => (
                                <tr key={problem.id} className="problem-row">
                                    <td className="status-cell">
                                        {problem.solved ? (
                                            <span className="solved-icon" title="Solved">✓</span>
                                        ) : (
                                            <span className="unsolved-icon"></span>
                                        )}
                                    </td>
                                    <td className="title-cell">
                                        <a
                                            href={`https://leetcode.com/problems/${problem.slug}/`}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            className="problem-link"
                                        >
                                            <span className="problem-number">{index + 1}.</span>
                                            {problem.title}
                                        </a>
                                    </td>
                                    <td>
                                        <span className={`badge badge-${problem.difficulty.toLowerCase()}`}>
                                            {problem.difficulty}
                                        </span>
                                    </td>
                                    <td className="points-cell">
                                        <span className="points">{problem.points}</span>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>

                    {filteredProblems.length === 0 && (
                        <div className="no-problems">
                            <p>No problems found</p>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

export default ProblemsPage;
