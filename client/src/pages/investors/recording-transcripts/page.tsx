import { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import Header from '../../home/components/Header';
import Footer from '../../home/components/Footer';
import ScrollToTop from '../../home/components/ScrollToTop';
import HeroSection from '../components/HeroSection';
import InvestorSidebar from '../components/InvestorSidebar';
import { investorsCmsApi } from '../../../services/api';

interface Audio {
  name: string;
  year: string;
  audioUrl: string;
  pdfUrl: string;
}

interface PageContent {
  id?: number;
  slug: string;
  title: string;
  hasYearFilter: boolean;
  filterItems?: string[];
  sections?: Array<{
    title: string;
    audios?: Audio[];
  }>;
  isActive: boolean;
}

// Fallback data removed - page now relies entirely on API data

const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8080';

// Helper function to get full URL (for both PDFs and audio files)
const getFullUrl = (url: string): string => {
  if (!url) return '';
  // If it's already a full URL, return as is
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return url;
  }
  // If it's a relative path (starts with /), prepend the API base URL
  if (url.startsWith('/')) {
    return `${API_BASE_URL}${url}`;
  }
  // Otherwise, assume it's a relative path without leading slash
  return `${API_BASE_URL}/${url}`;
};

const RecordingTranscriptsPage = () => {
  const location = useLocation();
  const [pageContent, setPageContent] = useState<PageContent>({
    slug: 'recording-transcripts-of-post-earnings-quarterly-calls',
    title: 'Recording & Transcripts of Post Earnings / Quarterly Calls',
    hasYearFilter: true,
    filterItems: [],
    sections: [],
    isActive: true,
  });
  const [selectedYear, setSelectedYear] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadPageContent();
    window.scrollTo(0, 0);
  }, []);

  const handleDownload = async (pdfUrl: string, title: string) => {
    try {
      const filename = `${title.replace(/[^a-zA-Z0-9\s]/g, '')}.pdf`;
      const fullUrl = getFullUrl(pdfUrl);
      
      const response = await fetch(`${API_BASE_URL}/api/download-proxy`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ url: fullUrl, filename }),
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
      const fullUrl = getFullUrl(pdfUrl);
      window.open(fullUrl, '_blank');
    }
  };

  const loadPageContent = async () => {
    try {
      setLoading(true);
      const data = await investorsCmsApi.getPageContentBySlug('recording-transcripts-of-post-earnings-quarterly-calls');
      if (data && data.isActive) {
        // Handle both camelCase and snake_case from API response
        const filterItems = (data.filterItems || (data as any).filter_items || []);
        const pageData = {
          ...data,
          filterItems: filterItems,
        };
        setPageContent(pageData);
        // Set default year to the most recent year if available
        if (data.hasYearFilter) {
          const availableYears = filterItems && filterItems.length > 0
            ? [...filterItems].sort().reverse()
            : [];
          if (availableYears.length > 0) {
            setSelectedYear(availableYears[0]);
          }
        }
      }
    } catch (err) {
      console.error('Failed to load recording transcripts page:', err);
      // Keep empty state if API fails
      setPageContent({
        slug: 'recording-transcripts-of-post-earnings-quarterly-calls',
        title: 'Recording & Transcripts of Post Earnings / Quarterly Calls',
        hasYearFilter: true,
        filterItems: [],
        sections: [],
        isActive: true,
      });
    } finally {
      setLoading(false);
    }
  };

  // Get all available years from CMS filter items or extract from documents
  const getAllYears = (): string[] => {
    const filterItems = pageContent.filterItems || (pageContent as any).filter_items || [];
    if (filterItems && filterItems.length > 0) {
      return [...filterItems].sort().reverse();
    }
    if (!pageContent.sections || pageContent.sections.length === 0) return [];
    const years = pageContent.sections
      .flatMap((s) => (s.audios || []).map((a) => a.year))
      .filter((year: string, index: number, self: string[]) => year && self.indexOf(year) === index)
      .sort()
      .reverse();
    return years;
  };

  // Filter audios by year
  const getFilteredAudios = (audios: Audio[]): Audio[] => {
    if (!pageContent.hasYearFilter) return audios;
    return audios.filter(audio => audio.year === selectedYear);
  };

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
                <p className="mt-4 text-gray-600">Loading recording transcripts...</p>
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

  const availableYears = getAllYears();

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
              {/* Year Filter */}
              {pageContent.hasYearFilter && availableYears.length > 0 && (
                <div className="mb-6 flex justify-end">
                  <select 
                    value={selectedYear}
                    onChange={(e) => setSelectedYear(e.target.value)}
                    className="px-4 py-2 border border-gray-300 bg-white text-gray-700 cursor-pointer focus:outline-none focus:ring-2 focus:ring-[#7cd244]"
                  >
                    {availableYears.map(year => (
                      <option key={year} value={year}>FY {year}</option>
                    ))}
                  </select>
                </div>
              )}

              {/* Sections */}
              {pageContent.sections && pageContent.sections.length > 0 ? (
                pageContent.sections.map((section, sectionIndex) => {
                  const filteredAudios = getFilteredAudios(section.audios || []);
                  
                  // Don't render section if no audios available
                  if (filteredAudios.length === 0) return null;
                  
                  return (
                    <div key={sectionIndex} className="mb-8">
                      <h3 
                        className="font-semibold mb-4"
                        style={{ color: '#2879b6', fontSize: '20px' }}
                      >
                        {section.title}
                      </h3>
                      {filteredAudios.length > 0 ? (
                        <div className="space-y-4">
                          {filteredAudios.map((recording, audioIndex) => (
                            <div 
                              key={audioIndex} 
                              className="flex flex-col gap-4 p-4 bg-transparent border border-gray-300 rounded-lg hover:border-gray-400 transition-colors"
                            >
                              {/* First Row: Icon, Name, View/Download */}
                              <div className="flex items-center gap-4">
                                <div className="flex-shrink-0">
                                  <img 
                                    src="https://refex.co.in/wp-content/uploads/2024/12/invest-file.svg" 
                                    alt="Document" 
                                    className="w-12 h-12"
                                  />
                                </div>
                                <div className="flex-1 min-w-0">
                                  <p 
                                    className="font-medium mb-1"
                                    style={{ color: '#484848', fontSize: '16px' }}
                                  >
                                    {recording.name}
                                  </p>
                                </div>
                                <div className="flex items-center gap-6 flex-shrink-0">
                                  {recording.pdfUrl && (
                                    <a
                                      href={getFullUrl(recording.pdfUrl)}
                                      target="_blank"
                                      rel="noopener noreferrer"
                                      className="flex items-center gap-2 transition-colors cursor-pointer whitespace-nowrap font-medium"
                                      style={{ color: '#2879b6', fontSize: '16px' }}
                                    >
                                      View
                                      <img 
                                        src="https://refex.co.in/wp-content/uploads/2025/01/visible.svg" 
                                        alt="View" 
                                        style={{ width: '16px', height: '16px' }}
                                      />
                                    </a>
                                  )}
                                  {recording.pdfUrl && (
                                    <button
                                      onClick={() => handleDownload(recording.pdfUrl, recording.name)}
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
                                  )}
                                </div>
                              </div>
                              {/* Second Row: Audio Player */}
                              {recording.audioUrl && (
                                <div className="mt-2">
                                  <audio controls className="w-full">
                                    <source src={getFullUrl(recording.audioUrl)} type="audio/mpeg" />
                                    <source src={getFullUrl(recording.audioUrl)} type="audio/mp3" />
                                    <source src={getFullUrl(recording.audioUrl)} type="audio/wav" />
                                    Your browser does not support the audio element.
                                  </audio>
                                </div>
                              )}
                            </div>
                          ))}
                        </div>
                      ) : (
                        <div className="px-6 py-8 text-center text-gray-500">
                          No recordings available for the selected year.
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

export default RecordingTranscriptsPage;
