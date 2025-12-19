import { useState, useEffect } from 'react';
import { venwindRefexCmsApi } from '../../../services/api';

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

interface VenwindRefexWhoWeAre {
  id: number;
  title: string;
  content?: string;
  mainImage?: string;
  smallImage?: string;
  isActive: boolean;
}

export default function WhoWeAreSection() {
  const [section, setSection] = useState<VenwindRefexWhoWeAre | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadSection();
  }, []);

  const loadSection = async () => {
    try {
      setLoading(true);
      const data = await venwindRefexCmsApi.getWhoWeAre();
      if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
        setSection(data);
      } else {
        setSection(null);
      }
    } catch (err) {
      console.error('Failed to load who we are section:', err);
      // Fallback to default data
      setSection({
        id: 1,
        title: 'Who we are',
        content: `Venwind Refex is a joint venture between Refex and Venwind, committed to revolutionizing wind energy in India through advanced turbine technology and sustainable solutions. With a clear vision to become one of India's leading wind turbine OEMs, we combine global innovation with deep local insights.

Through an exclusive technology license from Vensys Energy AG, Germany, we manufacture cutting-edge 5.3 MW wind turbines featuring a hybrid drivetrain and permanent magnet generator (PMG). This technology is proven worldwide—with over 120 GW of Vensys-powered wind turbines operating across five continents, in a wide range of environments and energy markets.

Our advanced manufacturing facility in India is purpose-built to scale, with a goal of reaching 5 GW in annual production capacity within five years, contributing meaningfully to India's renewable energy targets and the global energy transition.`,
        mainImage: 'https://refex.co.in/wp-content/uploads/2025/06/home-image-600x691-1.jpg',
        smallImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/4df2fa160fec066dfccd45c0b0052a39.jpeg',
        isActive: true,
      });
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center">
            <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-gray-900"></div>
          </div>
        </div>
      </section>
    );
  }

  if (!section) {
    return null;
  }

  // Split content into paragraphs by double line breaks or single line breaks
  const paragraphs = section.content
    ? section.content.split(/\n\s*\n/).filter(p => p.trim())
    : [];

  return (
    <section className="py-20 bg-white">
      <div className="max-w-7xl mx-auto px-6">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          {/* Left - Image */}
          <div className="relative">
            <div className="relative">
              {/* Top left small image */}
              {section.smallImage && (
                <div className="absolute -top-8 -left-8 z-10 w-48 h-48 rounded-lg overflow-hidden shadow-lg">
                  <img
                    src={getFullUrl(section.smallImage)}
                    alt="Venwind Technology"
                    className="w-full h-full object-cover"
                    onError={(e) => {
                      (e.target as HTMLImageElement).style.display = 'none';
                    }}
                  />
                </div>
              )}
              
              {/* Main image */}
              {section.mainImage ? (
                <img
                  src={getFullUrl(section.mainImage)}
                  alt="Venwind Refex"
                  className="rounded-lg shadow-lg"
                  style={{ width: '538px', height: '550px', objectFit: 'cover' }}
                  onError={(e) => {
                    (e.target as HTMLImageElement).style.display = 'none';
                  }}
                />
              ) : (
                <div className="bg-gray-200 rounded-lg shadow-lg flex items-center justify-center text-gray-500" style={{ width: '320px', height: '368px' }}>
                  No Image
                </div>
              )}
            </div>
          </div>

          {/* Right - Content */}
          <div>
            <h2 
              className="font-bold mb-8 uppercase tracking-wide" 
              style={{ fontSize: '34px', color: '#1f1f1f', lineHeight: '1.68' }}
              data-aos="fade-right"
            >
              {section.title}
            </h2>
            {paragraphs.length > 0 ? (
              <div className="space-y-6 leading-relaxed" style={{ fontSize: '17px', color: '#484848' }}>
                {paragraphs.map((paragraph, index) => (
                  <p key={index}>{paragraph.trim()}</p>
                ))}
              </div>
            ) : (
              <div className="italic" style={{ fontSize: '17px', color: '#484848' }}>No content available.</div>
            )}
          </div>
        </div>
      </div>
    </section>
  );
}
