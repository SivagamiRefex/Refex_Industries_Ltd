import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';
import mapImage from '../../../../public/map.png';

interface AboutPresence {
  id?: number;
  title: string;
  subtitle?: string;
  mapImage?: string;
  presenceTextImage?: string;
  isActive: boolean;
}

function OurPresenceSection() {
  const [presence, setPresence] = useState<AboutPresence | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchPresence = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getPresence();
        if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
          setPresence(data);
        } else {
          // Fallback to default if no active presence
          setPresence({
            title: 'Refex Vertical Wise Presence',
            subtitle: 'Spanning Across the Nation',
            mapImage: 'https://refex.co.in/wp-content/uploads/2025/06/mobile-map02.jpg',
            presenceTextImage: 'https://refex.co.in/wp-content/uploads/2025/08/presence-text-new04.png',
            isActive: true,
          });
        }
      } catch (error) {
        console.error('Failed to fetch presence section:', error);
        // Fallback to default data if API fails
        setPresence({
          title: 'Refex Vertical Wise Presence',
          subtitle: 'Spanning Across the Nation',
          mapImage: 'https://refex.co.in/wp-content/uploads/2025/06/mobile-map02.jpg',
          presenceTextImage: 'https://refex.co.in/wp-content/uploads/2025/08/presence-text-new04.png',
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchPresence();
  }, []);

  if (loading) {
    return (
      <div id="our-presence" className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-6">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading presence section...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Always show something, even if presence is null (shouldn't happen due to fallback)
  if (!presence) {
    return (
      <div id="our-presence" className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-12">
            <h4 className="mb-4" style={{ fontSize: '30px', color: '#1f1f1f', lineHeight: '1.68' }}>Refex Vertical Wise Presence</h4>
            <p style={{ fontSize: '22px', color: '#484848' }}>Spanning Across the Nation</p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div id="our-presence" className="py-16 bg-white">
      <div className="max-w-7xl mx-auto px-6">
        <div className="text-center mb-12">
          <h4 className="mb-4" style={{ fontSize: '30px', color: '#1f1f1f', lineHeight: '1.68' }}>{presence.title}</h4>
          {presence.subtitle && (
            <p style={{ fontSize: '22px', color: '#484848' }}>{presence.subtitle}</p>
          )}
        </div>

        <div className="flex flex-col lg:flex-row items-center justify-center gap-8">
          {/* Map Image */}
          {presence.mapImage && (
            <div className="flex-shrink-0">
              <img 
                src={mapImage} 
                alt="India Map"
                className="h-auto rounded-lg"
                style={{ maxWidth: '100%',    height: '550px' }}
                onError={(e) => {
                  (e.target as HTMLImageElement).src = 'https://via.placeholder.com/800x600?text=Map+Image';
                }}
              />
            </div>
          )}

          {/* Presence Text */}
          {presence.presenceTextImage && (
            <div className="flex-shrink-0">
              <img 
                src={presence.presenceTextImage} 
                alt="Presence Details"
                className="h-auto"
                style={{ maxWidth: '100%' }}
                onError={(e) => {
                  (e.target as HTMLImageElement).src = 'https://via.placeholder.com/800x600?text=Presence+Text';
                }}
              />
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default OurPresenceSection;
