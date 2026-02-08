import axios from 'axios';

const API_BASE_URL = '/api';

const api = axios.create({
    baseURL: API_BASE_URL,
    headers: {
        'Content-Type': 'application/json',
    },
});

// Request interceptor to add auth token
api.interceptors.request.use((config) => {
    const token = localStorage.getItem('token');
    if (token) {
        config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
});

// Response interceptor to handle auth errors
api.interceptors.response.use(
    (response) => response,
    (error: any) => {
        const isLoginRequest = error.config?.url?.includes('/auth/login');
        if (error.response?.status === 401 && !isLoginRequest) {
            localStorage.removeItem('token');
            localStorage.removeItem('user');
            window.location.href = '/login';
        }
        return Promise.reject(error);
    }
);

// Auth
export const authApi = {
    login: (email: string, password: string) =>
        api.post('/auth/login', { email, password }),

    register: (email: string, password: string, name: string) =>
        api.post('/auth/register', { email, password, name }),

    me: () => api.get('/auth/me'),

    forgotPassword: (email: string) =>
        api.post('/auth/forgot-password', { email }),

    resetPassword: (token: string, newPassword: string) =>
        api.post('/auth/reset-password', { token, newPassword }),
};

// Problems
export const problemsApi = {
    getAll: () => api.get('/problems'),

    getByDifficulty: (difficulty: string) =>
        api.get(`/problems/difficulty/${difficulty}`),

    getBySlug: (slug: string) => api.get(`/problems/${slug}`),

    create: (data: {
        title: string;
        difficulty: string;
        description: string;
        constraints?: string;
        inputFormat?: string;
        outputFormat?: string;
        testCases: Array<{
            input: string;
            expectedOutput: string;
            isSample: boolean;
        }>;
    }) => api.post('/problems', data),

    delete: (id: string) => api.delete(`/problems/${id}`),
};

// Submissions
export const submissionsApi = {
    submit: (problemId: string, code: string, language: string) =>
        api.post('/submissions', { problemId, code, language }),

    run: (problemId: string, code: string, language: string, customInput?: string) =>
        api.post('/submissions/run', { problemId, code, language, customInput }),

    getById: (id: string) => api.get(`/submissions/${id}`),

    getMy: () => api.get('/submissions/my'),

    getByProblem: (problemId: string) => api.get(`/submissions/problem/${problemId}`),
};

// Leaderboard
export const leaderboardApi = {
    get: () => api.get('/leaderboard'),

    getTop: (limit: number) => api.get(`/leaderboard/top/${limit}`),

    getStats: () => api.get('/leaderboard/stats'),
};

export default api;
