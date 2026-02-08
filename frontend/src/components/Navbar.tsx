import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import './Navbar.css';

const Navbar: React.FC = () => {
    const { user, logout, isAdmin } = useAuth();
    const navigate = useNavigate();

    const handleLogout = () => {
        logout();
        navigate('/login');
    };

    return (
        <nav className="navbar">
            <div className="navbar-container">
                <Link to="/" className="navbar-brand">
                    <span className="brand-icon">⚡</span>
                    <span className="brand-text">DSA Platform</span>
                </Link>

                <div className="navbar-links">
                    <Link to="/problems" className="nav-link">Problems</Link>
                    <Link to="/leaderboard" className="nav-link">Leaderboard</Link>
                    {isAdmin && (
                        <Link to="/admin" className="nav-link nav-admin">Admin</Link>
                    )}
                </div>

                <div className="navbar-user">
                    {user ? (
                        <>
                            <div className="user-info">
                                <span className="user-name">{user.name}</span>
                                <span className="user-score">{user.totalScore} pts</span>
                            </div>
                            <button onClick={handleLogout} className="btn btn-secondary btn-logout">
                                Logout
                            </button>
                        </>
                    ) : (
                        <Link to="/login" className="btn btn-primary">
                            Login
                        </Link>
                    )}
                </div>
            </div>
        </nav>
    );
};

export default Navbar;
