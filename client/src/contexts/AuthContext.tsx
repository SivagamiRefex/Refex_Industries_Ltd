import { createContext, useContext, useState, useEffect, ReactNode } from 'react';

interface User {
  id: number;
  email: string;
  first_name?: string;
  last_name?: string;
  role?: string;
}

interface AuthContextType {
  user: User | null;
  token: string | null;
  login: (email: string, password: string) => Promise<void>;
  logout: () => void;
  isAuthenticated: boolean;
  loading: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

const API_BASE_URL = 'http://localhost:8080';

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [token, setToken] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Check for stored auth data on mount
    const storedToken = localStorage.getItem('auth_token');
    const storedUser = localStorage.getItem('auth_user');
    
    if (storedToken && storedUser) {
      setToken(storedToken);
      setUser(JSON.parse(storedUser));
    }
    setLoading(false);
  }, []);

  const login = async (email: string, password: string) => {
    try {
      // Basic local authentication (no backend required)
      // Default admin credentials
      const ADMIN_EMAIL = 'admin@refex.com';
      const ADMIN_PASSWORD = 'admin123';

      if (email === ADMIN_EMAIL && password === ADMIN_PASSWORD) {
        // Simulate successful login
        const mockUser: User = {
          id: 1,
          email: ADMIN_EMAIL,
          first_name: 'Admin',
          last_name: 'User',
          role: 'SuperAdmin',
        };
        const mockToken = 'mock_token_' + Date.now();

        setToken(mockToken);
        setUser(mockUser);
        localStorage.setItem('auth_token', mockToken);
        localStorage.setItem('auth_user', JSON.stringify(mockUser));
      } else {
        throw new Error('Invalid email or password');
      }

      // Optional: Try backend if available, fallback to local auth
      // try {
      //   const response = await fetch(`${API_BASE_URL}/auth/login`, {
      //     method: 'POST',
      //     headers: {
      //       'Content-Type': 'application/json',
      //     },
      //     credentials: 'include',
      //     body: JSON.stringify({ email, password }),
      //   });

      //   const data = await response.json();

      //   if (response.ok && data.status && data.token) {
      //     setToken(data.token);
      //     setUser(data.user_data);
      //     localStorage.setItem('auth_token', data.token);
      //     localStorage.setItem('auth_user', JSON.stringify(data.user_data));
      //     return;
      //   }
      // } catch (backendError) {
      //   // Fallback to local auth if backend is not available
      //   console.log('Backend not available, using local authentication');
      // }
    } catch (error) {
      throw error;
    }
  };

  const logout = async () => {
    try {
      // Optional: Try backend logout if available
      // if (token && token.startsWith('real_token_')) {
      //   await fetch(`${API_BASE_URL}/auth/logout`, {
      //     method: 'POST',
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Authorization': `Bearer ${token}`,
      //     },
      //     credentials: 'include',
      //   });
      // }
    } catch (error) {
      console.error('Logout error:', error);
    } finally {
      setToken(null);
      setUser(null);
      localStorage.removeItem('auth_token');
      localStorage.removeItem('auth_user');
    }
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        token,
        login,
        logout,
        isAuthenticated: !!token,
        loading,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}

