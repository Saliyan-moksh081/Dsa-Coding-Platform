import React, { useState } from 'react';
import { problemsApi } from '../services/api';
import './AdminPage.css';

const AdminPage: React.FC = () => {
    const [title, setTitle] = useState('');
    const [difficulty, setDifficulty] = useState<'EASY' | 'MEDIUM' | 'HARD'>('EASY');
    const [description, setDescription] = useState('');
    const [constraints, setConstraints] = useState('');
    const [inputFormat, setInputFormat] = useState('');
    const [outputFormat, setOutputFormat] = useState('');
    const [testCases, setTestCases] = useState([
        { input: '', expectedOutput: '', isSample: true }
    ]);

    const [loading, setLoading] = useState(false);
    const [success, setSuccess] = useState('');
    const [error, setError] = useState('');

    const addTestCase = () => {
        setTestCases([...testCases, { input: '', expectedOutput: '', isSample: false }]);
    };

    const removeTestCase = (index: number) => {
        setTestCases(testCases.filter((_, i) => i !== index));
    };

    const updateTestCase = (index: number, field: string, value: string | boolean) => {
        const updated = [...testCases];
        updated[index] = { ...updated[index], [field]: value };
        setTestCases(updated);
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError('');
        setSuccess('');

        try {
            await problemsApi.create({
                title,
                difficulty,
                description,
                constraints,
                inputFormat,
                outputFormat,
                testCases,
            });

            setSuccess('Problem created successfully!');
            // Reset form
            setTitle('');
            setDescription('');
            setConstraints('');
            setInputFormat('');
            setOutputFormat('');
            setTestCases([{ input: '', expectedOutput: '', isSample: true }]);

        } catch (err: any) {
            setError(err.response?.data?.message || 'Failed to create problem');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="page admin-page">
            <div className="container">
                <div className="admin-header">
                    <h1>Admin Dashboard</h1>
                    <p>Create and manage DSA problems</p>
                </div>

                <div className="admin-card">
                    <h2>Create New Problem</h2>

                    <form onSubmit={handleSubmit} className="problem-form">
                        {error && <div className="form-error">{error}</div>}
                        {success && <div className="form-success">{success}</div>}

                        <div className="form-row">
                            <div className="form-group">
                                <label>Title *</label>
                                <input
                                    type="text"
                                    value={title}
                                    onChange={(e) => setTitle(e.target.value)}
                                    placeholder="Two Sum"
                                    required
                                />
                            </div>

                            <div className="form-group">
                                <label>Difficulty *</label>
                                <select
                                    value={difficulty}
                                    onChange={(e) => setDifficulty(e.target.value as any)}
                                >
                                    <option value="EASY">Easy (10 pts)</option>
                                    <option value="MEDIUM">Medium (25 pts)</option>
                                    <option value="HARD">Hard (50 pts)</option>
                                </select>
                            </div>
                        </div>

                        <div className="form-group">
                            <label>Description * (Markdown supported)</label>
                            <textarea
                                value={description}
                                onChange={(e) => setDescription(e.target.value)}
                                placeholder="## Problem Statement&#10;&#10;Given an array of integers..."
                                rows={10}
                                required
                            />
                        </div>

                        <div className="form-group">
                            <label>Constraints</label>
                            <textarea
                                value={constraints}
                                onChange={(e) => setConstraints(e.target.value)}
                                placeholder="* 2 <= nums.length <= 10^4&#10;* -10^9 <= nums[i] <= 10^9"
                                rows={4}
                            />
                        </div>

                        <div className="form-row">
                            <div className="form-group">
                                <label>Input Format</label>
                                <textarea
                                    value={inputFormat}
                                    onChange={(e) => setInputFormat(e.target.value)}
                                    placeholder="First line contains..."
                                    rows={3}
                                />
                            </div>

                            <div className="form-group">
                                <label>Output Format</label>
                                <textarea
                                    value={outputFormat}
                                    onChange={(e) => setOutputFormat(e.target.value)}
                                    placeholder="Print the result..."
                                    rows={3}
                                />
                            </div>
                        </div>

                        <div className="test-cases-section">
                            <div className="section-header">
                                <h3>Test Cases</h3>
                                <button type="button" className="btn btn-secondary" onClick={addTestCase}>
                                    + Add Test Case
                                </button>
                            </div>

                            {testCases.map((tc, index) => (
                                <div key={index} className="test-case-card">
                                    <div className="test-case-header">
                                        <span>Test Case {index + 1}</span>
                                        <div className="test-case-actions">
                                            <label className="sample-checkbox">
                                                <input
                                                    type="checkbox"
                                                    checked={tc.isSample}
                                                    onChange={(e) => updateTestCase(index, 'isSample', e.target.checked)}
                                                />
                                                Sample (visible to users)
                                            </label>
                                            {testCases.length > 1 && (
                                                <button
                                                    type="button"
                                                    className="remove-btn"
                                                    onClick={() => removeTestCase(index)}
                                                >
                                                    Remove
                                                </button>
                                            )}
                                        </div>
                                    </div>
                                    <div className="test-case-inputs">
                                        <div className="form-group">
                                            <label>Input</label>
                                            <textarea
                                                value={tc.input}
                                                onChange={(e) => updateTestCase(index, 'input', e.target.value)}
                                                placeholder="2 7 11 15&#10;9"
                                                rows={3}
                                            />
                                        </div>
                                        <div className="form-group">
                                            <label>Expected Output</label>
                                            <textarea
                                                value={tc.expectedOutput}
                                                onChange={(e) => updateTestCase(index, 'expectedOutput', e.target.value)}
                                                placeholder="0 1"
                                                rows={3}
                                            />
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </div>

                        <div className="form-actions">
                            <button type="submit" className="btn btn-primary btn-lg" disabled={loading}>
                                {loading ? 'Creating...' : 'Create Problem'}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
};

export default AdminPage;
