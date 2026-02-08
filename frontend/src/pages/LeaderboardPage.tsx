import React, { useEffect, useState } from 'react';
import { leaderboardApi } from '../services/api';
import './LeaderboardPage.css';

interface LeaderboardEntry {
    rank: number;
    userId: string;
    name: string;
    email: string;
    totalScore: number;
    problemsSolved: number;
}

const LeaderboardPage: React.FC = () => {
    const [entries, setEntries] = useState<LeaderboardEntry[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchLeaderboard = async () => {
            try {
                const response = await leaderboardApi.get();
                setEntries(response.data.entries);
            } catch (error) {
                console.error('Error fetching leaderboard:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchLeaderboard();
    }, []);

    if (loading) {
        return (
            <div className="page loading-page">
                <div className="spinner"></div>
            </div>
        );
    }

    const getRankIcon = (rank: number) => {
        switch (rank) {
            case 1: return '🥇';
            case 2: return '🥈';
            case 3: return '🥉';
            default: return null;
        }
    };

    return (
        <div className="page leaderboard-page">
            <div className="container">
                <div className="leaderboard-header">
                    <h1>🏆 Leaderboard</h1>
                    <p>Top performers in the team</p>
                </div>

                {entries.length > 0 && (
                    <div className="top-three">
                        {entries.slice(0, 3).map((entry, index) => (
                            <div key={entry.userId} className={`top-card top-${index + 1}`}>
                                <div className="top-rank">{getRankIcon(entry.rank)}</div>
                                <div className="top-name">{entry.name}</div>
                                <div className="top-score">{entry.totalScore} pts</div>
                                <div className="top-solved">{entry.problemsSolved} problems</div>
                            </div>
                        ))}
                    </div>
                )}

                <div className="leaderboard-table-container">
                    <table className="leaderboard-table">
                        <thead>
                            <tr>
                                <th>Rank</th>
                                <th>User</th>
                                <th>Problems Solved</th>
                                <th>Score</th>
                            </tr>
                        </thead>
                        <tbody>
                            {entries.map((entry) => (
                                <tr key={entry.userId} className={`rank-row rank-${entry.rank}`}>
                                    <td className="rank-cell">
                                        {getRankIcon(entry.rank) || `#${entry.rank}`}
                                    </td>
                                    <td className="user-cell">
                                        <div className="user-avatar">
                                            {entry.name.charAt(0).toUpperCase()}
                                        </div>
                                        <div className="user-details">
                                            <span className="user-name">{entry.name}</span>
                                            <span className="user-email">{entry.email}</span>
                                        </div>
                                    </td>
                                    <td className="solved-cell">{entry.problemsSolved}</td>
                                    <td className="score-cell">{entry.totalScore}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>

                    {entries.length === 0 && (
                        <div className="no-entries">
                            <p>No users on the leaderboard yet</p>
                            <p className="hint">Start solving problems to appear here!</p>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

export default LeaderboardPage;
