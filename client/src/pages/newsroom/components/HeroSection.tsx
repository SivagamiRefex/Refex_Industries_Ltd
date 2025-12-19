import { useState, useEffect } from 'react';
import { newsroomCmsApi } from '../../../services/api';

interface NewsroomHero {
  id: number;
  title: string;
  description?: string;
  backgroundImage?: string;
  isActive: boolean;
}

export default function HeroSection() {
  const [hero, setHero] = useState<NewsroomHero | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadHero();
  }, []);

  const loadHero = async () => {
    // Default fallback data
    const fallbackHero: NewsroomHero = {
      id: 1,
      title: 'NEWSROOM',
      description: 'Get hyped for the latest buzz on our businesses and community initiatives, as well as inspiring stories about the amazing people behind them!',
      backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0343739fb3bc08f14ce39df6b86bba49.jpeg',
      isActive: true,
    };

    try {
      setLoading(true);
      const data = await newsroomCmsApi.getHero();
      if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
        setHero(data);
      } else {
        setHero(fallbackHero);
      }
    } catch (error) {
      console.error('Failed to fetch newsroom hero section:', error);
      // Fallback to default data on error
      setHero(fallbackHero);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="relative h-[550px] flex items-center justify-center overflow-hidden mt-[148px] bg-gray-200">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
          <p className="mt-4 text-gray-600">Loading...</p>
        </div>
      </div>
    );
  }

  if (!hero || !hero.isActive) {
    return null;
  }

  // Ensure we have data (use defaults if not available)
  const displayHero = hero || {
    id: 1,
    title: 'NEWSROOM',
    description: 'Get hyped for the latest buzz on our businesses and community initiatives, as well as inspiring stories about the amazing people behind them!',
    backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0343739fb3bc08f14ce39df6b86bba49.jpeg',
    isActive: true,
  };

  return (
    <div className="relative h-[550px] flex items-end justify-start overflow-hidden mt-[148px]">
      {/* Background Image */}
      <div 
        className="absolute inset-0 bg-cover bg-center"
        style={{
          backgroundImage: displayHero.backgroundImage ? `url(${displayHero.backgroundImage})` : 'none',
        }}
      >
        {/* Overlay */}
        <div className="absolute inset-0 bg-black/40"></div>
      </div>

      {/* Content */}
      <div className="relative z-10 max-w-7xl mx-auto px-6 w-full pb-8">
        <div className="max-w-3xl">
          <h1 className="text-[#83e034] text-[40px] font-bold mb-6 uppercase tracking-wide">
            {displayHero.title}
          </h1>
          {displayHero.description && (
            <p 
              className="text-white text-[20px] leading-relaxed"
              dangerouslySetInnerHTML={{ __html: displayHero.description.replace(/\n/g, '<br />') }}
            />
          )}
        </div>
      </div>
    </div>
  );
}
