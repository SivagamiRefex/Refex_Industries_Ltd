import { useState, useEffect } from 'react';
import { esgCmsApi } from '../../../services/api';

const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8080';

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

interface Award {
  id: number;
  image: string;
  title: string;
  order: number;
  isActive: boolean;
}

interface AwardsSectionHeader {
  id: number;
  title: string;
  isActive: boolean;
}

export default function AwardsSection() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [header, setHeader] = useState<AwardsSectionHeader | null>(null);
  const [awards, setAwards] = useState<Award[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackHeader: AwardsSectionHeader = {
      id: 1,
      title: 'Awards & Accolades',
      isActive: true,
    };
    
    const fallbackAwards: Award[] = [
      {
        id: 1,
        image: 'https://refex.co.in/wp-content/uploads/2024/11/ESG_CSR_Award_01-Medium-300x295-1.png',
        title: 'Most Diversified Sustainable Company (India) by The Business Concept',
        order: 1,
        isActive: true,
      },
      {
        id: 2,
        image: 'https://refex.co.in/wp-content/uploads/2024/11/Sustainability-report-award-Medium-300x225-1.png',
        title: 'Bronze Prize of Asia\'s Best Integrated Report for our First-ever Sustainability Report by AIRA',
        order: 2,
        isActive: true,
      },
      {
        id: 3,
        image: 'https://refex.co.in/wp-content/uploads/2025/02/green-apple-award01.png',
        title: 'International Green Apple Environment Award 2024',
        order: 3,
        isActive: true,
      },
      {
        id: 4,
        image: 'https://refex.co.in/wp-content/uploads/2025/02/waste-managemnet-award01.png',
        title: 'Best Waste Management Solution Award',
        order: 4,
        isActive: true,
      },
      {
        id: 5,
        image: 'https://refex.co.in/wp-content/uploads/2025/02/esg-excellence-award01.png',
        title: 'ESG Excellence Award by ESG Grit Awards',
        order: 5,
        isActive: true,
      },
    ];

    try {
      setLoading(true);
      
      // Try to fetch data, but handle errors gracefully
      let headerData = null;
      let awardsData: Award[] = [];
      
      try {
        headerData = await esgCmsApi.getAwardsSection();
      } catch (err: any) {
        console.warn('Failed to fetch awards section header:', err.message);
        headerData = null;
      }
      
      try {
        awardsData = await esgCmsApi.getAwards();
      } catch (err: any) {
        console.warn('Failed to fetch awards:', err.message);
        awardsData = [];
      }
      
      // Use API data if available and active, otherwise use fallback
      if (headerData && (headerData.isActive === true || headerData.isActive === undefined || headerData.isActive === null)) {
        setHeader(headerData);
      } else {
        setHeader(fallbackHeader);
      }
      
      const activeAwards = (awardsData || [])
        .filter((award: Award) => award.isActive)
        .sort((a: Award, b: Award) => (a.order || 0) - (b.order || 0));
      
      // If no active awards from API, use fallback
      if (activeAwards.length === 0) {
        setAwards(fallbackAwards);
      } else {
        setAwards(activeAwards);
      }
    } catch (error: any) {
      console.error('Failed to fetch awards section:', error);
      // Fallback to default data on any error
      setHeader(fallbackHeader);
      setAwards(fallbackAwards);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (awards.length === 0) return;
    const timer = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % awards.length);
    }, 3000);
    return () => clearInterval(timer);
  }, [awards.length]);

  if (loading) {
    return (
      <section className="py-20" style={{ backgroundColor: '#f3f3f3' }}>
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading awards section...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (awards.length === 0) {
    return null;
  }

  // Ensure we have a header (use default if not available)
  const displayHeader = header || {
    id: 1,
    title: 'Awards & Accolades',
    isActive: true,
  };

  const visibleAwards = [];
  for (let i = 0; i < 3; i++) {
    visibleAwards.push(awards[(currentSlide + i) % awards.length]);
  }

  return (
    <section className="py-20" style={{ backgroundColor: '#f3f3f3' }}>
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

        <div className="relative">
          <div className="grid md:grid-cols-3 gap-8">
            {visibleAwards.map((award, index) => (
              <div key={index} className="overflow-hidden transition-all duration-300">
                <div className="overflow-hidden flex items-center justify-center">
                  <img
                    src={getFullUrl(award.image)}
                    alt={award.title}
                    className="object-contain"
                    style={{ width: '199px', height: '187px' }}
                  />
                </div>
                <div className="p-6">
                  <p className="text-center" style={{ fontSize: '14px', color: '#535a5e' }}>{award.title}</p>
                </div>
              </div>
            ))}
          </div>

          <div className="flex justify-center gap-2 mt-8">
            {awards.map((_, index) => (
              <button
                key={index}
                onClick={() => setCurrentSlide(index)}
                className="rounded-full transition-all duration-300 cursor-pointer"
                style={{
                  width: currentSlide === index ? '12px' : '8px',
                  height: currentSlide === index ? '12px' : '8px',
                  backgroundColor: currentSlide === index ? '#6cc24a' : 'white',
                  border: currentSlide === index ? 'none' : '1px solid #cccccc'
                }}
              ></button>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
