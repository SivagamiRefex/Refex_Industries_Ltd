import { BrowserRouter, useLocation } from 'react-router-dom';
import { AppRoutes } from './router';
import { AuthProvider } from './contexts/AuthContext';
import { useEffect, useState } from 'react';
import PageLoader from './pages/esg/components/PageLoader';

function AppContent() {
  const location = useLocation();
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    // Show loader on route change
    setIsLoading(true);
    
    // Hide loader after 2 seconds
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 2000);

    return () => clearTimeout(timer);
  }, [location.pathname]);

  return (
    <>
      {isLoading && <PageLoader />}
      <AppRoutes />
    </>
  );
}

function App() {
  const basePath = typeof __BASE_PATH__ !== 'undefined' ? __BASE_PATH__ : '/';
  
  return (
    <AuthProvider>
      <BrowserRouter basename={basePath}>
        <AppContent />
      </BrowserRouter>
    </AuthProvider>
  );
}

export default App;