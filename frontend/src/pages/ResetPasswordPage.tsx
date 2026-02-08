import React, { useState } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import { authApi } from '../services/api';

export const ResetPasswordPage: React.FC = () => {
    const [searchParams] = useSearchParams();
    const token = searchParams.get('token');
    const navigate = useNavigate();

    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
    const [errorMessage, setErrorMessage] = useState('');

    if (!token) {
        return (
            <div className="login-page">
                <div className="login-container">
                    <div className="login-card" style={{ textAlign: 'center' }}>
                        <h3 style={{ color: 'var(--accent-error)' }}>Invalid Link</h3>
                        <p style={{ margin: '16px 0' }}>This password reset link is invalid or missing the token.</p>
                        <Link to="/forgot-password" className="btn btn-primary">Request New Link</Link>
                    </div>
                </div>
            </div>
        );
    }

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        if (password !== confirmPassword) {
            setErrorMessage("Passwords don't match");
            return;
        }

        setStatus('loading');
        setErrorMessage('');

        try {
            await authApi.resetPassword(token, password);
            setStatus('success');
            setTimeout(() => navigate('/login'), 3000);
        } catch (err: any) {
            setStatus('error');
            setErrorMessage(err.response?.data?.message || 'Failed to reset password. The link may have expired.');
        }
    };

    return (
        <div className="login-page">
            <div className="login-container">
                <div className="login-header">
                    <div className="login-icon">🔑</div>
                    <h1>Set New Password</h1>
                    <p>Enter your new password below</p>
                </div>

                <div className="login-card">
                    {status === 'success' ? (
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ color: 'var(--accent-success)', fontSize: '48px', marginBottom: '16px' }}>✓</div>
                            <h3 style={{ marginBottom: '8px' }}>Password Reset!</h3>
                            <p style={{ color: 'var(--text-secondary)', marginBottom: '24px' }}>
                                Your password has been successfully updated. Redirecting to login...
                            </p>
                            <Link to="/login" className="btn btn-primary btn-large" style={{ display: 'block', textDecoration: 'none' }}>
                                Login Now
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
                                <label htmlFor="password">New Password</label>
                                <input
                                    type="password"
                                    id="password"
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                    placeholder="Enter new password"
                                    required
                                    minLength={6}
                                    disabled={status === 'loading'}
                                />
                            </div>

                            <div className="form-group">
                                <label htmlFor="confirmPassword">Confirm Password</label>
                                <input
                                    type="password"
                                    id="confirmPassword"
                                    value={confirmPassword}
                                    onChange={(e) => setConfirmPassword(e.target.value)}
                                    placeholder="Confirm new password"
                                    required
                                    minLength={6}
                                    disabled={status === 'loading'}
                                />
                            </div>

                            <button
                                type="submit"
                                className="btn btn-primary btn-large"
                                disabled={status === 'loading'}
                            >
                                {status === 'loading' ? 'Resetting...' : 'Reset Password'}
                            </button>
                        </form>
                    )}
                </div>
            </div>
        </div>
    );
};
