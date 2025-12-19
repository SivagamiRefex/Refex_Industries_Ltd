import { useState, useEffect } from 'react';
import { greenMobilityCmsApi } from '../../../services/api';

interface HeroSlide {
  image: string;
}

interface GreenMobilityHero {
  id?: number;
  title: string;
  subtitle?: string;
  slides: HeroSlide[];
  isActive: boolean;
}

function HeroSection() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [hero, setHero] = useState<GreenMobilityHero | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchHero = async () => {
      try {
        setLoading(true);
        const data = await greenMobilityCmsApi.getHero();
        if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
          setHero(data);
        } else {
          // Fallback to default data
          setHero({
            title: 'Refex Mobility',
            subtitle: 'The Most Trusted, Sustainable Mobility Partner in India',
            slides: [
              { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/e3bf83d0ca42ec3e1b21d62acc25a3cd.jpeg' },
              { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ffa03b0c227885e7d623744243542115.jpeg' },
            ],
            isActive: true,
          });
        }
      } catch (error) {
        console.error('Failed to fetch hero:', error);
        // Fallback to default data if API fails
        setHero({
          title: 'Refex Mobility',
          subtitle: 'The Most Trusted, Sustainable Mobility Partner in India',
          slides: [
            { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/e3bf83d0ca42ec3e1b21d62acc25a3cd.jpeg' },
            { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ffa03b0c227885e7d623744243542115.jpeg' },
          ],
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchHero();
  }, []);

  useEffect(() => {
    if (!hero || !hero.slides || hero.slides.length === 0) return;
    
    const timer = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % hero.slides.length);
    }, 5000);
    return () => clearInterval(timer);
  }, [hero]);

  if (loading) {
    return (
      <div className="relative w-full h-[600px] overflow-hidden bg-gray-200 flex items-center justify-center">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-green-600"></div>
          <p className="mt-4 text-gray-600">Loading hero section...</p>
        </div>
      </div>
    );
  }

  if (!hero || !hero.slides || hero.slides.length === 0) {
    return null;
  }

  return (
    <div className="relative w-full h-[600px] overflow-hidden">
      {/* Slides */}
      {hero.slides.map((slide, index) => (
        <div
          key={index}
          className={`absolute inset-0 transition-opacity duration-1000 ${
            index === currentSlide ? 'opacity-100' : 'opacity-0'
          }`}
        >
          <div
            className="w-full h-full bg-cover bg-center"
            style={{ backgroundImage: `url(${slide.image})` }}
          />
        </div>
      ))}

      {/* Overlay Content */}
      <div className="absolute inset-0 flex items-end pb-12">
        <div className="max-w-7xl mx-auto px-16 w-full">
          <div className="max-w-4xl">
            <h1 className="font-bold mb-3 animate-fadeInUp" style={{ fontSize: '40px', color: '#83e034' }}>
              {hero.title}
            </h1>
            {hero.subtitle && (
              <p className="text-white animate-fadeInUp" style={{ fontSize: '20px', animationDelay: '0.2s' }}>
                {hero.subtitle}
              </p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export default HeroSection;
