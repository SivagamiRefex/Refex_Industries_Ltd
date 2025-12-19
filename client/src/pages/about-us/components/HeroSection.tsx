import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface AboutHero {
  id?: number;
  title: string;
  subtitle?: string;
  description?: string;
  backgroundImage: string;
  logoCards?: Array<{ name: string; logoUrl: string; link?: string }>;
  isActive: boolean;
}

export default function HeroSection() {
  console.log('HeroSection rendering');
  const [hero, setHero] = useState<AboutHero | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchHero = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getHero();
        console.log('Hero data received:', data);
        // If data is null or undefined, use fallback
        if (!data) {
          console.log('No hero data, using fallback');
          setHero({
            title: 'A Story of Passion, Determination, and Growth',
            subtitle: '',
            description: '',
            backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/53db3ce33636656bd3b6d29ea93a1205.png',
            logoCards: [],
            isActive: true,
          });
        } else if (data.isActive === false) {
          // If explicitly inactive, use fallback
          console.log('Hero is inactive, using fallback');
          setHero({
            title: 'A Story of Passion, Determination, and Growth',
            subtitle: '',
            description: '',
            backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/53db3ce33636656bd3b6d29ea93a1205.png',
            logoCards: [],
            isActive: true,
          });
        } else {
          // Use the data from API
          console.log('Using hero data from API');
          setHero(data);
        }
      } catch (error) {
        console.error('Failed to fetch hero section:', error);
        // Fallback to default data if API fails
        setHero({
          title: 'A Story of Passion, Determination, and Growth',
          subtitle: '',
          description: '',
          backgroundImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/53db3ce33636656bd3b6d29ea93a1205.png',
          logoCards: [],
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchHero();
  }, []);

  if (loading) {
    return (
      <div className="relative overflow-hidden" style={{ height: '550px' }}>
        <div className="relative z-10 mx-auto px-6 flex items-center justify-center h-full">
          <div className="text-center">
            <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-white"></div>
            <p className="mt-4 text-white">Loading...</p>
          </div>
        </div>
      </div>
    );
  }

  // Always show something, even if hero is null (shouldn't happen due to fallback)
  if (!hero) {
    return (
      <div className="relative overflow-hidden" style={{ height: '550px' }}>
        <div 
          className="absolute inset-0 bg-cover bg-top bg-no-repeat"
          style={{
            backgroundImage: 'url(https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/53db3ce33636656bd3b6d29ea93a1205.png)'
          }}
        ></div>
        <div className="relative z-10 mx-auto px-6 flex items-end h-full pb-8" style={{ width: '1040px', maxWidth: '100%' }}>
          <div className="text-left">
            <h4 className="text-lg font-medium text-white" style={{ margin: '20px 0px 26px' }}>
              A Story of Passion, Determination, and Growth
            </h4>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="relative overflow-hidden" style={{ height: '550px' }}>
      <div 
        className="absolute inset-0 bg-cover bg-top bg-no-repeat"
        style={{
          backgroundImage: `url(${hero.backgroundImage})`
        }}
      ></div>
      <div className="relative z-10 mx-auto px-6 flex items-end h-full pb-8" style={{ width: '1040px', maxWidth: '100%' }}>
        <div className="text-left">
          {hero.subtitle && (
            <h5 className="text-sm font-medium text-white mb-2 opacity-90">
              {hero.subtitle}
            </h5>
          )}
          <h4 className="text-lg font-medium text-white" style={{ margin: '0px 0px 0px' }}>
            {hero.title}
          </h4>
          {hero.description && (
            <p className="text-white text-sm opacity-90 max-w-2xl">
              {hero.description}
            </p>
          )}
        </div>
      </div>
    </div>
  );
}
