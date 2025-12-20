import { useState, useEffect } from 'react';
import { esgCmsApi } from '../../../services/api';

const API_BASE_URL = import.meta.env.VITE_API_URL || "";

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

interface SdgSection {
  id: number;
  title: string;
  content?: string;
  image?: string;
  isActive: boolean;
}

export default function SDGSection() {
  const [section, setSection] = useState<SdgSection | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadSection();
  }, []);

  const loadSection = async () => {
    // Default fallback data
    const fallbackSection: SdgSection = {
      id: 1,
      title: 'SUSTAINABLE DEVELOPMENT GOALS',
      content: `We're all about making the world a better place! We're committed to working with India and the UN to achieve United Nations Sustainable Development Goals, because we know that together we can make a big difference. We're not just focused on making our shareholders happy – we're all about creating value for everyone involved, including the planet!

We're so proud to be a member of UNGC and to be working with partners around the world to make the world a better place. We're all about ethical business practices and doing our part to solve some of the biggest challenges of our time. Let's make the world a better place, together!`,
      image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/b386e5df75d7a9c971d04671cf57b3fe.jpeg',
      isActive: true,
    };

    try {
      setLoading(true);
      const data = await esgCmsApi.getSdgSection();
      if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
        setSection(data);
      } else {
        setSection(fallbackSection);
      }
    } catch (error) {
      console.error('Failed to fetch SDG section:', error);
      // Fallback to default data on error
      setSection(fallbackSection);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-20" style={{ backgroundColor: '#f3f3f3' }}>
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading SDG section...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (!section) {
    return null;
  }

  // Split title by \n for line breaks
  const titleLines = section.title.split('\n');
  // Split content into paragraphs
  const paragraphs = section.content
    ? section.content.split(/\n\s*\n/).filter(p => p.trim())
    : [];

  return (
    <section className="py-20" style={{ backgroundColor: '#f3f3f3' }}>
      <div className="container mx-auto px-4 max-w-7xl">
        <div className="grid md:grid-cols-2 gap-12 items-center">
          <div className="w-full">
            <h2 
              className="text-[34px] font-semibold mb-6" 
              style={{ color: '#1f1f1f' }}
              data-aos="fade-right"
            >
              {titleLines.map((line, index) => (
                <span key={index}>
                  {line}
                  {index < titleLines.length - 1 && <br />}
                </span>
              ))}
            </h2>
            <div className="space-y-4 leading-relaxed" style={{ fontSize: '16px', color: '#484848' }}>
              {paragraphs.map((paragraph, index) => (
                <p key={index}>{paragraph.trim()}</p>
              ))}
            </div>
          </div>
          
          {section.image && (
            <div 
              className="h-full bg-cover bg-center"
              style={{
                backgroundImage: `url(${getFullUrl(section.image)})`,
                minHeight: '360px',
                width: 'calc(100% + 80px)'
              }}
            ></div>
          )}
        </div>
      </div>
    </section>
  );
}
