import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { authApi } from '../services/api';

export const ForgotPasswordPage: React.FC = () => {
    const [email, setEmail] = useState('');
    const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
    const [errorMessage, setErrorMessage] = useState('');

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setStatus('loading');
        setErrorMessage('');

        try {
            await authApi.forgotPassword(email);
            setStatus('success');
        } catch (err: any) {
            setStatus('error');
            setErrorMessage(err.response?.data?.message || 'Failed to send reset email. Please try again.');
        }
    };

    return (
        <div className="login-page">
            <div className="login-container">
                <div className="login-header">
                    <div className="login-icon">🔒</div>
                    <h1>Reset Password</h1>
                    <p>Enter your email to receive a reset link</p>
                </div>

                <div className="login-card">
                    {status === 'success' ? (
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ color: 'var(--accent-success)', fontSize: '48px', marginBottom: '16px' }}>✓</div>
                            <h3 style={{ marginBottom: '8px' }}>Check your email</h3>
                            <p style={{ color: 'var(--text-secondary)', marginBottom: '24px' }}>
                                We've sent password reset instructions to <strong>{email}</strong>
                            </p>
                            <Link to="/login" className="btn btn-primary btn-large" style={{ display: 'block', textDecoration: 'none' }}>
                                Back to Login
                            </Link>
                        </div>
                    ) : (
                        <form onSubmit={handleSubmit} className="login-form">
                            {status === 'error' && (
                                <div className="login-error">
                                    {errorMessage}
                                </div>
                            )}

                            <div className="form-group">
                                <label htmlFor="email">Email Address</label>
                                <input
                                    type="email"
                                    id="email"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                    placeholder="Enter your registered email"
                                    required
                                    disabled={status === 'loading'}
                                />
                            </div>

                            <button
                                type="submit"
                                className="btn btn-primary btn-large"
                                disabled={status === 'loading'}
                            >
                                {status === 'loading' ? 'Sending...' : 'Send Reset Link'}
                            </button>

                            <div className="login-footer">
                                <Link to="/login" className="link-button">Back to Login</Link>
                            </div>
                        </form>
                    )}
                </div>
            </div>
        </div>
    );
};
