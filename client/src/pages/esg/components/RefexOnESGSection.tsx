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

interface RefexOnEsgSection {
  id: number;
  title: string;
  content?: string;
  image?: string;
  isActive: boolean;
}

export default function RefexOnESGSection() {
  const [section, setSection] = useState<RefexOnEsgSection | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadSection();
  }, []);

  const loadSection = async () => {
    try {
      setLoading(true);
      const data = await esgCmsApi.getRefexOnEsg();
      if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
        setSection(data);
      } else {
        setSection(null);
      }
    } catch (err) {
      console.error('Failed to load Refex on ESG section:', err);
      // Fallback to default data
      setSection({
        id: 1,
        title: 'Refex on ESG',
        content: `At Refex Industries Limited, we believe in creating a better world through sustainable business practices. We prioritize People, Planet, and Profit equally and are committed to becoming an ESG champion and carbon-neutral company.

By aligning with the United Nations Sustainable Development Goals, we are taking action towards a brighter future. We invite you to join hands with Refex Group in our efforts towards sustainability and make a positive impact on the world!`,
        image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/2a88034df4623de87800682ebeaf6ce1.jpeg',
        isActive: true,
      });
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section id="refex-esg" className="py-20 bg-white">
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading section...</p>
            </div>
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
    <section id="refex-esg" className="py-20 bg-white">
      <div className="container mx-auto px-4 max-w-7xl">
        <div className="grid md:grid-cols-2 gap-12 items-center">
          <div 
            className="bg-contain bg-center bg-no-repeat"
            style={{
              width: '100%',
              maxWidth: '600px',
              height: '400px',
              backgroundImage: section.image ? `url(${getFullUrl(section.image)})` : undefined,
              backgroundColor: section.image ? undefined : '#e5e7eb',
            }}
          ></div>
          
          <div>
            <h2 
              className="text-[34px] font-semibold mb-6" 
              style={{ color: '#1f1f1f' }}
              data-aos="fade-right"
            >
              {section.title}
            </h2>
            {paragraphs.length > 0 ? (
              <div className="space-y-4 text-[16px] leading-relaxed" style={{ color: '#484848' }}>
                {paragraphs.map((paragraph, index) => {
                  const isFirstParagraph = index === 0;
                  return (
                    <p 
                      key={index}
                      className={isFirstParagraph ? 'font-bold' : ''}
                      dangerouslySetInnerHTML={{ 
                        __html: paragraph.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>').replace(/<strong>(.*?)<\/strong>/g, '<strong>$1</strong>')
                      }}
                    />
                  );
                })}
              </div>
            ) : (
              <div className="text-gray-500 italic">No content available.</div>
            )}
          </div>
        </div>
      </div>
    </section>
  );
}
