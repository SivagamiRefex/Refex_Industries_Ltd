import { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import Header from '../../home/components/Header';
import Footer from '../../home/components/Footer';
import ScrollToTop from '../../home/components/ScrollToTop';
import HeroSection from '../components/HeroSection';
import InvestorSidebar from '../components/InvestorSidebar';
import { investorsCmsApi } from '../../../services/api';

interface Document {
  title: string;
  pdfUrl: string;
}

interface PageContent {
  id?: number;
  slug: string;
  title: string;
  sections?: Array<{
    title: string;
    documents: Document[];
  }>;
  isActive: boolean;
}

// Fallback data removed - page now relies entirely on API data

const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8080';

// Helper function to get full URL for PDFs
const getPdfUrl = (pdfUrl: string): string => {
  if (!pdfUrl) return '';
  // If it's already a full URL, return as is
  if (pdfUrl.startsWith('http://') || pdfUrl.startsWith('https://')) {
    return pdfUrl;
  }
  // If it's a relative path (starts with /), prepend the API base URL
  if (pdfUrl.startsWith('/')) {
    return `${API_BASE_URL}${pdfUrl}`;
  }
  // Otherwise, assume it's a relative path without leading slash
  return `${API_BASE_URL}/${pdfUrl}`;
};

const RightsIssuePage = () => {
  const location = useLocation();
  const [pageContent, setPageContent] = useState<PageContent>({
    slug: 'rights-issue',
    title: 'Rights Issue',
    sections: [],
    isActive: true,
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    document.title = 'Rights Issue – Refex Industries Ltd.';
    
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Rights Issue information for Refex Industries Limited');
    } else {
      const meta = document.createElement('meta');
      meta.setAttribute('name', 'description');
      meta.setAttribute('content', 'Rights Issue information for Refex Industries Limited');
      document.head.appendChild(meta);
    }

    loadPageContent();
  }, []);

  const loadPageContent = async () => {
    try {
      setLoading(true);
      const data = await investorsCmsApi.getPageContentBySlug('rights-issue');
      if (data && data.isActive) {
        setPageContent(data);
      }
    } catch (err) {
      console.error('Failed to load Rights Issue page:', err);
      // Keep empty state if API fails
      setPageContent({
        slug: 'rights-issue',
        title: 'Rights Issue',
        sections: [],
        isActive: true,
      });
    } finally {
      setLoading(false);
    }
  };

  const handleView = (pdfUrl: string) => {
    window.open(getPdfUrl(pdfUrl), '_blank');
  };

  const handleDownload = async (pdfUrl: string, title: string) => {
    try {
      const filename = `${title.replace(/[^a-zA-Z0-9\s]/g, '')}.pdf`;
      
      const response = await fetch(`${API_BASE_URL}/api/download-proxy`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ url: getPdfUrl(pdfUrl), filename }),
      });

      if (!response.ok) throw new Error('Download failed');

      const blob = await response.blob();
      const blobUrl = window.URL.createObjectURL(blob);
      const link = document.createElement('a');
      link.href = blobUrl;
      link.download = filename;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      window.URL.revokeObjectURL(blobUrl);
    } catch (error) {
      console.error('Download failed:', error);
      window.open(pdfUrl, '_blank');
    }
  };

  const sections = pageContent.sections || [];

  if (loading) {
    return (
      <div className="min-h-screen bg-white">
        <Header />
        <HeroSection title={pageContent.title} />
        <section className="py-16 bg-[#e7e7e7]">
          <div className="max-w-7xl mx-auto px-6">
            <div className="flex items-center justify-center py-12">
              <div className="text-center">
                <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-[#7cd244]"></div>
                <p className="mt-4 text-gray-600">Loading Rights Issue information...</p>
              </div>
            </div>
          </div>
        </section>
        <Footer />
        <ScrollToTop />
      </div>
    );
  }

  if (!pageContent.isActive) {
    return null;
  }

  return (
    <div className="min-h-screen bg-white">
      <Header />
      <HeroSection title={pageContent.title} />
      
      <section className="py-16 bg-[#e7e7e7]">
        <div className="max-w-7xl mx-auto px-6">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
            {/* Left Sidebar - Links */}
            <InvestorSidebar currentPath={location.pathname} />

            {/* Right Content */}
            <div className="lg:col-span-9">
              {/* Sections */}
              {sections && sections.length > 0 ? (
                sections.map((section, sectionIndex) => {
                  const docs = section.documents || [];
                  
                  // Don't render section if no documents available
                  if (docs.length === 0) return null;
                  
                  return (
                    <div key={sectionIndex} className="mb-8">
                      <h3 
                        className="font-semibold mb-4"
                        style={{ color: '#2879b6', fontSize: '20px' }}
                      >
                        {section.title}
                      </h3>
                      {docs.length > 0 ? (
                        <div className="space-y-4">
                          {docs.map((doc, docIndex) => (
                            <div 
                              key={docIndex} 
                              className="flex items-center gap-4 p-4 bg-transparent border border-gray-300 rounded-lg hover:border-gray-400 transition-colors"
                            >
                              <div className="flex-shrink-0">
                                <img 
                                  src="https://refex.co.in/wp-content/uploads/2024/12/invest-file.svg" 
                                  alt="PDF" 
                                  className="w-12 h-12"
                                />
                              </div>
                              <div className="flex-1 min-w-0">
                                <p 
                                  className="font-medium mb-1"
                                  style={{ color: '#484848', fontSize: '16px' }}
                                >
                                  {doc.title}
                                </p>
                              </div>
                              <div className="flex items-center gap-6 flex-shrink-0">
                                <button 
                                  onClick={() => handleView(doc.pdfUrl)}
                                  className="flex items-center gap-2 transition-colors cursor-pointer whitespace-nowrap font-medium"
                                  style={{ color: '#2879b6', fontSize: '16px' }}
                                >
                                  View
                                  <img 
                                    src="https://refex.co.in/wp-content/uploads/2025/01/visible.svg" 
                                    alt="View" 
                                    style={{ width: '16px', height: '16px' }}
                                  />
                                </button>
                                <button 
                                  onClick={() => handleDownload(doc.pdfUrl, doc.title)}
                                  className="flex items-center gap-2 transition-colors cursor-pointer whitespace-nowrap font-medium"
                                  style={{ color: '#2879b6', fontSize: '16px' }}
                                >
                                  Download
                                  <svg 
                                    width="16" 
                                    height="16" 
                                    viewBox="0 0 24 24" 
                                    fill="none" 
                                    xmlns="http://www.w3.org/2000/svg"
                                  >
                                    <path 
                                      d="M12 16l-4-4h3V8h2v4h3l-4 4zm-8 4h16v2H4v-2z" 
                                      fill="#2879b6"
                                    />
                                  </svg>
                                </button>
                              </div>
                            </div>
                          ))}
                        </div>
                      ) : (
                        <div className="px-6 py-8 text-center text-gray-500">
                          No documents available.
                        </div>
                      )}
                    </div>
                  );
                })
              ) : (
                <div className="bg-white p-8 text-center text-gray-500">
                  No sections available.
                </div>
              )}
            </div>
          </div>
        </div>
      </section>

      <Footer />
      <ScrollToTop />
    </div>
  );
};

export default RightsIssuePage;
