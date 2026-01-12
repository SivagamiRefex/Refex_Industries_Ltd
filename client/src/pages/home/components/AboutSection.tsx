import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface AboutSectionData {
  id: number;
  title: string;
  content: string;
  icon?: string;
  color?: string;
  order: number;
  isActive: boolean;
}

export default function AboutSection() {
  const [section, setSection] = useState<AboutSectionData | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchSection = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getSections();
        // Get the first active section, sorted by order
        const activeSection = (data || [])
          .filter((s: AboutSectionData) => s.isActive)
          .sort((a: AboutSectionData, b: AboutSectionData) => (a.order || 0) - (b.order || 0))[0];
        setSection(activeSection || null);
      } catch (error) {
        console.error('Failed to fetch about section:', error);
        // Fallback to default content if API fails
        setSection({
          id: 0,
          title: 'ABOUT US',
          content: 'Refex Industries Limited is a dynamic, diversified enterprise with strategic interests in refrigerant gases, coal and ash management, power trading, clean mobility, and renewable energy. We are committed to sustainability, innovation, and long-term value creation across sectors critical to India\'s growth.',
          color: '#7abc43',
          order: 1,
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchSection();
  }, []);

  if (loading) {
    return (
      <section className="py-6 lg:py-10 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex items-center justify-center">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (!section) {
    return null;
  }

  const buttonColor = section.color || '#7abc43';

  return (
    <section className="py-6 lg:py-10 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4">
        <div className="flex flex-col">
          <div className="mb-8">
            <h2 className="text-[35px] font-semibold text-gray-800 uppercase tracking-wider mb-6">
              {section.title}
            </h2>
            <p className="text-gray-600 text-base leading-relaxed ">
              {section.content}
            </p>
          </div>
          <div className="flex justify-start">
            <a
              href="/about-us"
              className="inline-flex items-center px-8 py-3 bg-transparent border-2 rounded-full transition-all duration-300 ease-in-out cursor-pointer whitespace-nowrap font-medium group hover:shadow-lg hover:scale-105"
              style={{
                borderColor: buttonColor,
                color: buttonColor,
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.backgroundColor = buttonColor;
                e.currentTarget.style.color = 'white';
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.backgroundColor = 'transparent';
                e.currentTarget.style.color = buttonColor;
              }}
            >
              Discover More
              <span className="ml-2 transform group-hover:translate-x-2 transition-transform duration-300 ease-in-out">→</span>
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}
