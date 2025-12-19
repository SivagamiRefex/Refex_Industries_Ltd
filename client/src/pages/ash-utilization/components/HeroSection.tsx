import { useState, useEffect } from 'react';
import { ashUtilizationCmsApi } from '../../../services/api';

interface HeroSlide {
  image: string;
}

interface AshUtilizationHero {
  id?: number;
  title: string;
  subtitle?: string;
  slides: HeroSlide[];
  isActive: boolean;
}

function HeroSection() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [hero, setHero] = useState<AshUtilizationHero | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchHero = async () => {
      try {
        setLoading(true);
        const data = await ashUtilizationCmsApi.getHero();
        if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
          setHero(data);
        } else {
          // Fallback to default if no active hero
          setHero({
            title: 'ASH UTILIZATION AND COAL HANDLING',
            subtitle: 'One-stop solution for all your Ash and Coal Requirements',
            slides: [
              { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ce4e05dff329bc2f19abb413375a03a2.jpeg' },
              { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/744952edcfa05d3c20d725642ddeb0eb.webp' },
            ],
            isActive: true,
          });
        }
      } catch (error) {
        console.error('Failed to fetch hero section:', error);
        // Fallback to default data if API fails
        setHero({
          title: 'ASH UTILIZATION AND COAL HANDLING',
          subtitle: 'One-stop solution for all your Ash and Coal Requirements',
          slides: [
            { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ce4e05dff329bc2f19abb413375a03a2.jpeg' },
            { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/744952edcfa05d3c20d725642ddeb0eb.webp' },
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
    if (hero && hero.slides && hero.slides.length > 0) {
      const timer = setInterval(() => {
        setCurrentSlide((prev) => (prev + 1) % hero.slides.length);
      }, 5000);
      return () => clearInterval(timer);
    }
  }, [hero]);

  if (loading) {
    return (
      <div className="relative w-full overflow-hidden bg-gray-200" style={{ height: '549px' }}>
        <div className="absolute inset-0 flex items-center justify-center">
          <div className="text-center">
            <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            <p className="mt-4 text-gray-600">Loading hero section...</p>
          </div>
        </div>
      </div>
    );
  }

  // Always show something, even if hero is null (shouldn't happen due to fallback)
  if (!hero || !hero.slides || hero.slides.length === 0) {
    return (
      <div className="relative w-full overflow-hidden" style={{ height: '549px' }}>
        <div className="w-full h-full bg-cover bg-center" style={{ backgroundImage: 'url(https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ce4e05dff329bc2f19abb413375a03a2.jpeg)' }} />
        <div className="absolute inset-0 flex items-end justify-start pb-16">
          <div className="max-w-7xl mx-auto px-12 w-full">
            <div className="max-w-4xl">
              <h1 className="font-bold mb-3" style={{ fontSize: '40px', color: '#83e034' }}>
                ASH UTILIZATION AND COAL HANDLING
              </h1>
              <p style={{ fontSize: '20px', color: '#ffffff' }}>
                One-stop solution for all your Ash and Coal Requirements
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="relative w-full overflow-hidden" style={{ height: '549px' }}>
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
      <div className="absolute inset-0 flex items-end justify-start pb-16">
        <div className="max-w-7xl mx-auto px-12 w-full">
          <div className="max-w-4xl">
            <h1 className="font-bold mb-3 animate-fadeInUp whitespace-nowrap" style={{ fontSize: '40px', color: '#83e034' }}>
              {hero.title}
            </h1>
            {hero.subtitle && (
              <p className="animate-fadeInUp" style={{ fontSize: '20px', color: '#ffffff', animationDelay: '0.2s' }}>
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
