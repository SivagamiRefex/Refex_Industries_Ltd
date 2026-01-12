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

interface HrItem {
  id: number;
  title: string;
  link: string;
  order: number;
  isActive: boolean;
}

interface HrSectionHeader {
  id: number;
  title: string;
  isActive: boolean;
}

export default function HRSection() {
  const [header, setHeader] = useState<HrSectionHeader | null>(null);
  const [items, setItems] = useState<HrItem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackHeader: HrSectionHeader = {
      id: 1,
      title: 'HR',
      isActive: true,
    };
    
    const fallbackItems: HrItem[] = [
      {
        id: 1,
        title: 'Employee Benefits and ESOP',
        link: 'https://refex.co.in/wp-content/uploads/2025/02/ESOP-Disclosure-2023-24.pdf',
        order: 1,
        isActive: true,
      },
    ];

    try {
      setLoading(true);
      
      // Try to fetch data, but handle errors gracefully
      let headerData = null;
      let itemsData: HrItem[] = [];
      
      try {
        headerData = await esgCmsApi.getHrSection();
      } catch (err: any) {
        console.warn('Failed to fetch HR section header:', err.message);
        headerData = null;
      }
      
      try {
        itemsData = await esgCmsApi.getHrItems();
      } catch (err: any) {
        console.warn('Failed to fetch HR items:', err.message);
        itemsData = [];
      }
      
      // Use API data if available and active, otherwise use fallback
      if (headerData && (headerData.isActive === true || headerData.isActive === undefined || headerData.isActive === null)) {
        setHeader(headerData);
      } else {
        setHeader(fallbackHeader);
      }
      
      const activeItems = (itemsData || [])
        .filter((item: HrItem) => item.isActive)
        .sort((a: HrItem, b: HrItem) => (a.order || 0) - (b.order || 0));
      
      // If no active items from API, use fallback
      if (activeItems.length === 0) {
        setItems(fallbackItems);
      } else {
        setItems(activeItems);
      }
    } catch (error: any) {
      console.error('Failed to fetch HR section:', error);
      // Fallback to default data on any error
      setHeader(fallbackHeader);
      setItems(fallbackItems);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-20" style={{ backgroundColor: '#e7e7e7' }}>
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading HR section...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  // Ensure we have data (use defaults if not available)
  const displayHeader = header || {
    id: 1,
    title: 'HR',
    isActive: true,
  };

  if (items.length === 0) {
    return null;
  }

  return (
    <section className="py-20" style={{ backgroundColor: '#e7e7e7' }}>
      <div className="container mx-auto px-4 max-w-7xl">
        <div className="text-center mb-16">
          <h3 
            className="text-[34px] font-semibold mb-4" 
            style={{ color: '#1f1f1f' }}
            data-aos="fade-right"
          >
            {displayHeader.title}
          </h3>
        </div>

        <div className="max-w-2xl mx-auto">
          {items.map((item) => (
            <div key={item.id} className="bg-white p-8 mb-4 last:mb-0 text-center">
              <h4 className="text-xl font-bold text-gray-900 mb-6">{item.title}</h4>
              <a
                href={getFullUrl(item.link)}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center justify-center font-semibold transition-colors cursor-pointer border-2 rounded-full text-[#7dc144] border-[#7dc144] hover:bg-[#7dc144] hover:text-white"
                style={{ 
                  padding: '5px 10px'
                }}
              >
                View Report
              </a>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
