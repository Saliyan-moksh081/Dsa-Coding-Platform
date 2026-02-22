import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { authApi } from '../services/api';

interface User {
    id: string;
    email: string;
    name: string;
    role: string;
    totalScore: number;
    problemsSolved: number;
    leetcodeUsername?: string;
    lastSyncAt?: string;
}

interface AuthContextType {
    user: User | null;
    token: string | null;
    isLoading: boolean;
    login: (email: string, password: string) => Promise<void>;
    register: (email: string, password: string, name: string) => Promise<void>;
    logout: () => void;
    checkAuth: () => Promise<void>;
    isAdmin: boolean;
}

const AuthContext = createContext<AuthContextType | null>(null);

export const useAuth = () => {
    const context = useContext(AuthContext);
    if (!context) {
        throw new Error('useAuth must be used within an AuthProvider');
    }
    return context;
};

interface AuthProviderProps {
    children: ReactNode;
}

export const AuthProvider: React.FC<AuthProviderProps> = ({ children }) => {
    const [user, setUser] = useState<User | null>(null);
    const [token, setToken] = useState<string | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const checkAuth = async () => {
        const storedToken = localStorage.getItem('token');
        if (storedToken) {
            try {
                const response = await authApi.me();
                const fullUser = response.data;
                localStorage.setItem('user', JSON.stringify(fullUser));
                setUser(fullUser);
                setToken(storedToken);
            } catch (error) {
                console.error('Check auth failed:', error);
                logout();
            }
        }
        setIsLoading(false);
    };

    useEffect(() => {
        checkAuth();
    }, []);

    const login = async (email: string, password: string) => {
        const response = await authApi.login(email, password);
        const { token: newToken } = response.data;

        localStorage.setItem('token', newToken);

        // Fetch full user data
        const userResponse = await authApi.me();
        const fullUser = userResponse.data;

        localStorage.setItem('user', JSON.stringify(fullUser));
        setToken(newToken);
        setUser(fullUser);
    };

    const register = async (email: string, password: string, name: string) => {
        const response = await authApi.register(email, password, name);
        const { token: newToken } = response.data;

        localStorage.setItem('token', newToken);

        // Fetch full user data
        const userResponse = await authApi.me();
        const fullUser = userResponse.data;

        localStorage.setItem('user', JSON.stringify(fullUser));
        setToken(newToken);
        setUser(fullUser);
    };

    const logout = () => {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        setToken(null);
        setUser(null);
    };

    const isAdmin = user?.role === 'ADMIN';

    return (
        <AuthContext.Provider value={{ user, token, isLoading, login, register, logout, isAdmin, checkAuth }}>
            {children}
        </AuthContext.Provider>
    );
};
