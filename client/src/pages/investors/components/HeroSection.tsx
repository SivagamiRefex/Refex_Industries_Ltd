import { useState, useEffect } from 'react';
import { investorsCmsApi } from '../../../services/api';

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

interface HeroSectionProps {
  title?: string;
}

interface InvestorHero {
  id?: number;
  title: string;
  backgroundImage?: string;
  isActive: boolean;
}

export default function HeroSection({ title: propTitle }: HeroSectionProps) {
  const [heroData, setHeroData] = useState<InvestorHero | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadHeroData();
  }, []);

  const loadHeroData = async () => {
    try {
      const data = await investorsCmsApi.getHero();
      if (data && data.isActive) {
        setHeroData(data);
      } else {
        // Fallback to default data
        setHeroData({
          title: propTitle || 'Investors',
          backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/504911d23a96027f1d7ab6083fd4d266.jpeg',
          isActive: true,
        });
      }
    } catch (err) {
      // Fallback to default data on error
      setHeroData({
        title: propTitle || 'Investors',
        backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/504911d23a96027f1d7ab6083fd4d266.jpeg',
        isActive: true,
      });
    } finally {
      setLoading(false);
    }
  };

  // Prioritize propTitle when explicitly passed, otherwise use CMS data
  const displayTitle = propTitle || heroData?.title || 'Investors';
  const backgroundImage = getFullUrl(
    heroData?.backgroundImage ||
      'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/504911d23a96027f1d7ab6083fd4d266.jpeg'
  );

  if (loading) {
    return (
      <section className="relative h-[400px] flex items-center justify-center overflow-hidden bg-gray-200">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-[#7cd244]"></div>
        </div>
      </section>
    );
  }

  return (
    <section className="relative h-[400px] flex items-end justify-start overflow-hidden">
      <div 
        className="absolute inset-0 bg-cover bg-center"
        style={{
          backgroundImage: backgroundImage ? `url(${backgroundImage})` : undefined,
        }}
      >
        <div className="absolute inset-0 bg-black/30"></div>
      </div>
      
      <div className="relative z-10 w-full px-6 pb-16">
        <div className="max-w-7xl mx-auto">
          <h1 className="font-bold uppercase tracking-wide" style={{ fontSize: '40px', color: '#83e034' }}>
            {displayTitle}
          </h1>
        </div>
      </div>
    </section>
  );
}