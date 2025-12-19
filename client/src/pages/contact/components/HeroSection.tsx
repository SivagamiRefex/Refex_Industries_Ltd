import { useState, useEffect } from 'react';
import { contactCmsApi } from '../../../services/api';

interface ContactHero {
  id: number;
  title: string;
  description?: string;
  backgroundImage?: string;
  isActive: boolean;
}

export default function HeroSection() {
  const [hero, setHero] = useState<ContactHero | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadHero();
  }, []);

  const loadHero = async () => {
    // Default fallback data
    const fallbackHero: ContactHero = {
      id: 1,
      title: 'CONTACT US',
      description: "Drop us a line, we'd love to hear from you.",
      backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/b309ae4045ece5791af67c177be612e9.png',
      isActive: true,
    };

    try {
      setLoading(true);
      const data = await contactCmsApi.getHero();
      if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
        setHero(data);
      } else {
        setHero(fallbackHero);
      }
    } catch (error) {
      console.error('Failed to fetch Contact Hero section:', error);
      // Fallback to default data on error
      setHero(fallbackHero);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="relative flex items-center justify-center overflow-hidden bg-gray-200" style={{ height: '590px' }}>
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
          <p className="mt-4 text-gray-600">Loading...</p>
        </div>
      </section>
    );
  }

  if (!hero || !hero.isActive) {
    return null; // Don't render if not active or no data
  }

  return (
    <section className="relative flex items-end overflow-hidden" style={{ height: '590px' }}>
      {/* Background Image */}
      <div 
        className="absolute inset-0 bg-cover bg-center"
        style={{
          backgroundImage: hero.backgroundImage ? `url(${hero.backgroundImage})` : undefined,
          backgroundColor: hero.backgroundImage ? undefined : '#1f2937',
        }}
      >
        <div className="absolute inset-0 bg-black/40"></div>
      </div>

      {/* Content */}
      <div className="relative z-10 w-full max-w-7xl mx-auto px-4 pb-8">
        <div className="text-left text-white max-w-2xl ml-0">
          <h1 className="font-bold mb-4" style={{ fontSize: '40px', color: '#83e034' }}>
            {hero.title}
          </h1>
          {hero.description && (
            <p className="text-white" style={{ fontSize: '20px' }}>
              {hero.description}
            </p>
          )}
        </div>
      </div>
    </section>
  );
}
