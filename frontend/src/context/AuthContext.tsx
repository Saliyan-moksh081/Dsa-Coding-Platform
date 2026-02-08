import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { authApi } from '../services/api';

interface User {
    id: string;
    email: string;
    name: string;
    role: string;
    totalScore: number;
    problemsSolved: number;
}

interface AuthContextType {
    user: User | null;
    token: string | null;
    isLoading: boolean;
    login: (email: string, password: string) => Promise<void>;
    register: (email: string, password: string, name: string) => Promise<void>;
    logout: () => void;
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

    useEffect(() => {
        const storedToken = localStorage.getItem('token');
        const storedUser = localStorage.getItem('user');

        if (storedToken && storedUser) {
            setToken(storedToken);
            setUser(JSON.parse(storedUser));
        }
        setIsLoading(false);
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
        <AuthContext.Provider value={{ user, token, isLoading, login, register, logout, isAdmin }}>
            {children}
        </AuthContext.Provider>
    );
};
