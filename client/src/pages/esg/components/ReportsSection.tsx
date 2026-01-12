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
                  className="group inline-flex items-center gap-3 px-8 py-3 border-2 border-[#7cd244] rounded-full cursor-pointer transition-all duration-300 whitespace-nowrap hover:bg-[#7cd244]"
                >
                  <div className="w-6 h-6 flex items-center justify-center">
                  <svg
                    height="18"
  width="18"
  aria-hidden="true"
  className="e-font-icon-svg e-far-file-pdf transition-colors duration-300 group-hover:fill-white"
  viewBox="0 0 384 512"
  xmlns="http://www.w3.org/2000/svg"
  fill="#7DC144"
>
  <path d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zM332.1 128H256V51.9l76.1 76.1zM48 464V48h160v104c0 13.3 10.7 24 24 24h104v288H48zm250.2-143.7c-12.2-12-47-8.7-64.4-6.5-17.2-10.5-28.7-25-36.8-46.3 3.9-16.1 10.1-40.6 5.4-56-4.2-26.2-37.8-23.6-42.6-5.9-4.4 16.1-.4 38.5 7 67.1-10 23.9-24.9 56-35.4 74.4-20 10.3-47 26.2-51 46.2-3.3 15.8 26 55.2 76.1-31.2 22.4-7.4 46.8-16.5 68.4-20.1 18.9 10.2 41 17 55.8 17 25.5 0 28-28.2 17.5-38.7z" />
</svg>

                  </div>
                  <span className="font-semibold text-[#7cd244] transition-colors duration-300 group-hover:text-white">
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