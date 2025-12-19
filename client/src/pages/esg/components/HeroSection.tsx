import { useState, useEffect } from 'react';
import { esgCmsApi } from '../../../services/api';

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

interface EsgHero {
  id: number;
  title: string;
  description1?: string;
  description2?: string;
  backgroundImage?: string;
  button1Text?: string;
  button1Link?: string;
  button2Text?: string;
  button2Link?: string;
  isActive: boolean;
}

export default function HeroSection() {
  const [hero, setHero] = useState<EsgHero | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchHero = async () => {
      try {
        setLoading(true);
        const data = await esgCmsApi.getHero();

        if (data && (data.isActive === true || data.isActive === undefined)) {
          setHero(data);
        } else {
          setHero(null);
        }
      } catch (error) {
        console.error('Failed to fetch hero section:', error);

        // fallback default
        setHero({
          id: 1,
          title: 'ESG',
          description1:
            "At Refex, we’re constantly changing from the inside to change the world outside.",
          description2: 'Learn how our business strives to make a difference.',
          backgroundImage:
            'https://refex.co.in/wp-content/uploads/2024/12/esg-banner.jpg',
          button1Text: 'Download Sustainability Report',
          button1Link:
            'https://refex.co.in/wp-content/uploads/2025/02/Sustainability-Report-2023-24.pdf',
          button2Text: 'BRSR Report',
          button2Link:
            'https://refex.co.in/wp-content/uploads/2025/09/BRSR.pdf',
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchHero();
  }, []);

  // loading section
  if (loading) {
    return (
      <section className="relative h-[650px] flex items-center justify-center bg-gray-200">
        <div className="text-center">
          <div className="animate-spin h-10 w-10 border-b-2 border-green-500 rounded-full mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading hero section...</p>
        </div>
      </section>
    );
  }

  if (!hero) return null;

  return (
    <section className="relative h-[650px] overflow-hidden flex items-center">
      {/* BACKGROUND IMAGE */}
      <div
        className="absolute inset-0 bg-cover bg-center"
        style={{
          backgroundImage: hero.backgroundImage
            ? `url(${getFullUrl(hero.backgroundImage)})`
            : undefined,
          backgroundColor: hero.backgroundImage ? undefined : '#1f2937',
        }}
      >
        <div className="absolute inset-0 bg-black/35"></div>
      </div>

      {/* CONTENT */}
      <div className="relative z-10 container mx-auto max-w-7xl h-full flex justify-between px-6">

        {/* LEFT TEXT — bottom aligned */}
        <div className="flex flex-col justify-end pb-20 max-w-3xl">
          <h1
            className="text-[42px] font-bold mb-4"
            style={{ color: '#83e034' }}
          >
            {hero.title}
          </h1>

          {hero.description1 && (
            <p className="text-[20px] text-white leading-relaxed mb-1">
              {hero.description1}
            </p>
          )}
          {hero.description2 && (
            <p className="text-[20px] text-white leading-relaxed">
              {hero.description2}
            </p>
          )}
        </div>

        {/* RIGHT BUTTONS — EXACT CENTER MID */}
        <div className="flex flex-col justify-center gap-5 pr-4 min-w-[330px]">
          
          {/* BUTTON 1 */}
          {hero.button1Text && hero.button1Link && (
            <a
              href={getFullUrl(hero.button1Link)}
              target="_blank"
              rel="noopener noreferrer"
              className="relative bg-[#7dc144] text-white px-8 py-4 rounded-full
              font-semibold transition-all duration-300 flex items-center gap-2
              text-[18px] overflow-hidden group whitespace-nowrap"
            >
              <span className="relative z-10">{hero.button1Text}</span>
              <i className="ri-arrow-right-line text-xl relative z-10 transition-transform duration-300 group-hover:translate-x-2"></i>

              <div className="absolute inset-0 bg-[#5ea027] 
              -translate-x-full group-hover:translate-x-0 transition-transform duration-300"></div>
            </a>
          )}

          {/* BUTTON 2 */}
          {hero.button2Text && hero.button2Link && (
            <a
              href={getFullUrl(hero.button2Link)}
              target="_blank"
              rel="noopener noreferrer"
              className="relative bg-[#7dc144] text-white px-8 py-4 rounded-full
              font-semibold transition-all duration-300 flex items-center gap-2
              text-[18px] overflow-hidden group whitespace-nowrap"
            >
              <span className="relative z-10">{hero.button2Text}</span>
              <i className="ri-arrow-right-line text-xl relative z-10 transition-transform duration-300 group-hover:translate-x-2"></i>

              <div className="absolute inset-0 bg-[#5ea027] 
              -translate-x-full group-hover:translate-x-0 transition-transform duration-300"></div>
            </a>
          )}

        </div>
      </div>
    </section>
  );
}
