import { useState, useEffect } from 'react';
import { esgCmsApi } from '../../../services/api';

const API_BASE_URL = import.meta.env.VITE_API_URL || "";

const getFullUrl = (url?: string): string | undefined => {
  if (!url) return undefined;
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return url;
  }
  if (url.startsWith('/')) {
    return `${API_BASE_URL}${url}`;
  }
  return `${API_BASE_URL}/${url}`;
};

interface Report {
  id: number;
  title: string;
  image: string;
  link: string;
  order: number;
  isActive: boolean;
}

interface ReportsSectionHeader {
  id: number;
  title: string;
  isActive: boolean;
}

export default function ReportsSection() {
  const [header, setHeader] = useState<ReportsSectionHeader | null>(null);
  const [reports, setReports] = useState<Report[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackHeader = {
      id: 1,
      title: 'REPORTS',
      isActive: true,
    };
    
    const fallbackReports = [
      {
        id: 1,
        title: 'Sustainability Report',
        image: 'https://refex.co.in/wp-content/uploads/2025/02/sustainibility-report-new.jpg',
        link: 'https://refex.co.in/wp-content/uploads/2025/02/Sustainability-Report-2023-24.pdf',
        order: 1,
        isActive: true,
      },
      {
        id: 2,
        title: 'BRSR',
        image: 'https://refex.co.in/wp-content/uploads/2025/01/brsr-dashboard.jpg',
        link: 'https://refex.co.in/wp-content/uploads/2025/09/BRSR.pdf',
        order: 2,
        isActive: true,
      },
      {
        id: 3,
        title: 'ESG Performance Dashboard',
        image: 'https://refex.co.in/wp-content/uploads/2024/12/esg-dashboard.jpg',
        link: 'https://refex.co.in/wp-content/uploads/2025/07/ESG_Dashboard_FY-24-25-1.pdf',
        order: 3,
        isActive: true,
      },
    ];

    try {
      setLoading(true);
      
      // Try to fetch data, but handle errors gracefully
      let headerData = null;
      let reportsData: Report[] = [];
      
      try {
        headerData = await esgCmsApi.getReportsSection();
      } catch (err: any) {
        console.warn('Failed to fetch reports section header:', err.message);
        // Use fallback header
        headerData = null;
      }
      
      try {
        reportsData = await esgCmsApi.getReports();
      } catch (err: any) {
        console.warn('Failed to fetch reports:', err.message);
        // Use fallback reports
        reportsData = [];
      }
      
      // Use API data if available and active, otherwise use fallback
      if (headerData && (headerData.isActive === true || headerData.isActive === undefined || headerData.isActive === null)) {
        setHeader(headerData);
      } else {
        // If no header data or inactive, use fallback header
        setHeader(fallbackHeader);
      }
      
      const activeReports = (reportsData || [])
        .filter((report: Report) => report.isActive)
        .sort((a: Report, b: Report) => (a.order || 0) - (b.order || 0));
      
      // If no active reports from API, use fallback
      if (activeReports.length === 0) {
        setReports(fallbackReports);
      } else {
        setReports(activeReports);
      }
    } catch (error: any) {
      console.error('Failed to fetch reports section:', error);
      // Fallback to default data on any error
      setHeader(fallbackHeader);
      setReports(fallbackReports);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-20" style={{ backgroundColor: '#f3f3f3' }}>
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading reports section...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  // Always show the section if we have reports (either from API or fallback)
  if (reports.length === 0) {
    return null;
  }
  
  // Ensure we have a header (use default if not available)
  const displayHeader = header || {
    id: 1,
    title: 'REPORTS',
    isActive: true,
  };

  return (
    <section className="py-20" style={{ backgroundColor: '#f3f3f3' }}>
      <div className="container mx-auto px-4 max-w-7xl">
        <div className="text-center mb-16">
          <h2 
            className="text-[34px] font-semibold mb-6" 
            style={{ color: '#1f1f1f' }}
            data-aos="fade-right"
          >
            {displayHeader.title}
          </h2>
        </div>

        <div className="grid md:grid-cols-3 gap-0">
          {reports.map((report) => (
            <div key={report.id} className="group transition-all duration-300 w-full" style={{ margin: 0, padding: 0 }}>
              <div className="overflow-hidden w-full" style={{ height: '210px' }}>
                <img
                  src={getFullUrl(report.image)}
                  alt={report.title}
                  className="w-full h-full object-cover"
                  onError={(e) => {
                    // Hide broken images instead of requesting external placeholder
                    (e.target as HTMLImageElement).style.display = 'none';
                  }}
                />
              </div>
              <div className="text-center transition-colors duration-300 group-hover:bg-white">
                <h3 
                  className="font-bold transition-colors duration-300 text-[#616161] group-hover:text-[#1f1f1f]" 
                  style={{ fontSize: '22px', marginTop: '15px', marginBottom: '10px' }}
                >
                  {report.title}
                </h3>
                <a
                  href={getFullUrl(report.link)}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-3 px-8 py-3 border-2 border-[#7cd244] rounded-full cursor-pointer transition-all duration-300 whitespace-nowrap"
                >
                  <div className="w-6 h-6 flex items-center justify-center">
                    <i className="ri-file-pdf-line text-[#7cd244] text-xl"></i>
                  </div>
                  <span className="font-semibold text-[#7cd244]">
                    View Report
                  </span>
                </a>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}