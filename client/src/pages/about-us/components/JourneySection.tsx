import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface AboutJourney {
  id?: number;
  title?: string;
  summary?: string;
  image?: string;
  images?: string[];
  isActive: boolean;
}

function JourneySection() {
  const [journey, setJourney] = useState<AboutJourney | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchJourney = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getAboutJourney();
        if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
          setJourney(data);
        } else {
          // Fallback to default if no active journey
          setJourney({
            title: 'Our Journey',
            summary: '',
            image: 'https://refex.co.in/wp-content/uploads/2025/08/Our-Journey-new01.jpg',
            images: [],
            isActive: true,
          });
        }
      } catch (error) {
        console.error('Failed to fetch journey section:', error);
        // Fallback to default data if API fails
        setJourney({
          title: 'Our Journey',
          summary: '',
          image: 'https://refex.co.in/wp-content/uploads/2025/08/Our-Journey-new01.jpg',
          images: [],
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchJourney();
  }, []);

  if (loading) {
    return (
      <div className="py-16 bg-white">
        <div className="w-full">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading journey section...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Always show something, even if journey is null (shouldn't happen due to fallback)
  if (!journey || !journey.image) {
    return (
      <div className="py-16 bg-white">
        <div className="w-full">
          <img 
            src="https://refex.co.in/wp-content/uploads/2025/08/Our-Journey-new01.jpg" 
            alt="Our Journey"
            className="w-full h-auto"
          />
        </div>
      </div>
    );
  }

  return (
    <div className="py-16 bg-white">
      <div className="w-full">
        <img 
          src={journey.image} 
          alt={journey.title || 'Our Journey'}
          className="w-full h-auto"
          onError={(e) => {
            (e.target as HTMLImageElement).src = 'https://refex.co.in/wp-content/uploads/2025/08/Our-Journey-new01.jpg';
          }}
        />
      </div>
    </div>
  );
}

export default JourneySection;
