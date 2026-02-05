import { useState, useEffect, useRef } from 'react';
import { homeCmsApi } from '../../../services/api';

interface Business {
  id: number;
  title: string;
  description: string;
  image: string;
  link: string;
  order: number;
  isActive: boolean;
}

export default function BusinessSection() {
  const [businesses, setBusinesses] = useState<Business[]>([]);
  const [loading, setLoading] = useState(true);
  const scrollContainerRef = useRef<HTMLDivElement>(null);
  const isScrollingRef = useRef(false);

  useEffect(() => {
    const fetchBusinesses = async () => {
      try {
        setLoading(true);
        const data = await homeCmsApi.getOfferings();
        // Map offerings to business structure
        const activeBusinesses = (data || [])
          .filter((item: any) => item.isActive)
          .map((item: any) => ({
            id: item.id,
            title: item.title,
            description: item.description,
            image: item.image || '',
            link: item.link || '/',
            order: item.order || 0,
            isActive: item.isActive,
          }))
          .sort((a: Business, b: Business) => (a.order || 0) - (b.order || 0));
        setBusinesses(activeBusinesses);
      } catch (error) {
        console.error('Failed to fetch businesses:', error);
        // Fallback to default data if API fails
        setBusinesses([
          {
            id: 1,
            title: 'Ash Utilization and Coal Handling',
            description: 'Providing end-to-end ash handling/disposal, coal yard management, and coal trading solutions for thermal power plants',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/07455fbd11f25781b1c0645ed45ecceb.png',
            link: '/ash-utilization',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            title: 'Green Mobility',
            description: 'Offering tailored mobility services for corporate commuting and daily rides, with a focus on sustainability through electric four-wheeler fleets.',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/71f2b6479f74d24cab18fe163beff0f1.png',
            link: '/green-mobility',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            title: 'Venwind Refex',
            description: 'Aiming to drive sustainable wind energy adoption nationwide with advanced 5.3 MW wind turbine manufacturing in India',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/14ac7f1fbbb4c730f253c0cc8078f920.png',
            link: '/venwind-refex',
            order: 3,
            isActive: true,
          },
          {
            id: 4,
            title: 'Refrigerant Gas',
            description: 'A leading global supplier specializing in eco-friendly refrigerant gases, equipped with automated filling, rigorous quality control, and certified storage facilities',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/a8311a97127f77813e6f7198f947d66c.png',
            link: '/refrigerant-gas',
            order: 4,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchBusinesses();
  }, []);

  // Setup infinite scroll effect
  useEffect(() => {
    if (businesses.length === 0 || !scrollContainerRef.current) return;

    const container = scrollContainerRef.current;
    
    // Wait for cards to render, then calculate and set scroll position
    const setupScroll = () => {
      if (!container.children.length) {
        setTimeout(setupScroll, 100);
        return;
      }

      // Calculate width of one set of businesses
      let totalWidth = 0;
      for (let i = 0; i < businesses.length; i++) {
        const card = container.children[i] as HTMLElement;
        if (card) {
          totalWidth += card.offsetWidth + 24; // 24px is gap-6
        }
      }

      // Set initial scroll position to the middle (second set of businesses)
      if (totalWidth > 0) {
        container.scrollLeft = totalWidth;
      }
    };

    // Initial setup after a short delay to ensure rendering
    const timeoutId = setTimeout(setupScroll, 100);

    const handleScroll = () => {
      if (isScrollingRef.current || !container.children.length) return;

      // Recalculate width dynamically
      let totalWidth = 0;
      for (let i = 0; i < businesses.length; i++) {
        const card = container.children[i] as HTMLElement;
        if (card) {
          totalWidth += card.offsetWidth + 24;
        }
      }

      if (totalWidth === 0) return;

      const scrollLeft = container.scrollLeft;
      const threshold = 50; // Threshold for reset
      
      // If scrolled to the end (third set), reset to middle (second set)
      if (scrollLeft >= totalWidth * 2 - threshold) {
        isScrollingRef.current = true;
        container.scrollLeft = totalWidth;
        setTimeout(() => {
          isScrollingRef.current = false;
        }, 50);
      }
      // If scrolled to the beginning (first set), reset to middle (second set)
      else if (scrollLeft <= threshold) {
        isScrollingRef.current = true;
        container.scrollLeft = totalWidth;
        setTimeout(() => {
          isScrollingRef.current = false;
        }, 50);
      }
    };

    container.addEventListener('scroll', handleScroll);
    
    // Handle window resize to recalculate
    const handleResize = () => {
      setupScroll();
    };
    window.addEventListener('resize', handleResize);

    return () => {
      clearTimeout(timeoutId);
      container.removeEventListener('scroll', handleScroll);
      window.removeEventListener('resize', handleResize);
    };
  }, [businesses]);

  const scrollLeft = () => {
    if (scrollContainerRef.current && !isScrollingRef.current) {
      const cardWidth = scrollContainerRef.current.children[0]?.clientWidth || 0;
      const gap = 24; // gap-6 = 24px
      scrollContainerRef.current.scrollBy({
        left: -(cardWidth + gap) * 3,
        behavior: 'smooth',
      });
    }
  };

  const scrollRight = () => {
    if (scrollContainerRef.current && !isScrollingRef.current) {
      const cardWidth = scrollContainerRef.current.children[0]?.clientWidth || 0;
      const gap = 24; // gap-6 = 24px
      scrollContainerRef.current.scrollBy({
        left: (cardWidth + gap) * 3,
        behavior: 'smooth',
      });
    }
  };

  if (loading) {
    return (
      <section className="py-12 lg:py-16 bg-[#f7f7f7] relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading businesses...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (businesses.length === 0) {
    return null;
  }

  return (
    <section className="py-12 lg:py-16 bg-[#f7f7f7] relative overflow-hidden">
      <img 
        src="https://refex.co.in/wp-content/uploads/2024/02/shape_img_new.png" 
        alt="" 
        className="absolute top-0 right-0 w-80 lg:w-[640px] opacity-10 pointer-events-none"
      />
      
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="mb-8">
          <h2 className="text-3xl lg:text-4xl font-bold text-[#1a1a1a] uppercase tracking-wide">
            OUR BUSINESSES
          </h2>
        </div>

        <div className="relative">
          {/* Scroll Buttons */}
          {businesses.length > 3 && (
            <>
              <button
                onClick={scrollLeft}
                className="absolute left-[-20px] lg:left-[-40px] top-1/2 -translate-y-1/2 z-20 bg-white/90 hover:bg-white shadow-lg rounded-full p-3 transition-all hover:scale-110"
                aria-label="Scroll left"
              >
                <i className="ri-arrow-left-line text-2xl text-[#1a1a1a]"></i>
              </button>
              <button
                onClick={scrollRight}
                className="absolute right-[-20px] lg:right-[-40px] top-1/2 -translate-y-1/2 z-20 bg-white/90 hover:bg-white shadow-lg rounded-full p-3 transition-all hover:scale-110"
                aria-label="Scroll right"
              >
                <i className="ri-arrow-right-line text-2xl text-[#1a1a1a]"></i>
              </button>
            </>
          )}

          {/* Scrollable Cards Container */}
          <div 
            ref={scrollContainerRef}
            className="flex gap-6 overflow-x-auto scrollbar-hide scroll-smooth pb-4"
            style={{
              scrollbarWidth: 'none',
              msOverflowStyle: 'none',
            }}
          >
            {/* Render businesses 3 times for seamless looping */}
            {[...businesses, ...businesses, ...businesses].map((business, index) => (
              <div
                key={`${business.id}-${index}`}
                className="w-full sm:w-[calc(50%-12px)] lg:w-[calc((100%-48px)/3)] flex-shrink-0 min-w-[280px]"
              >
                <div className="group cursor-pointer relative overflow-hidden h-[420px] border-b-4 border-transparent hover:border-[#7cd144] transition-colors duration-300">
                  <img
                    src={business.image}
                    alt={business.title}
                    className="w-full h-full object-cover object-center group-hover:scale-110 transition-transform duration-700"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/95 via-black/60 to-transparent"></div>
                  
                  <div className="absolute inset-0 p-6 flex flex-col justify-end text-white">
                    <h3 className="text-xl lg:text-2xl font-bold mb-3 leading-tight text-[#7cd144]">
                      {business.title}
                    </h3>
                    <p className="text-sm text-white/90 mb-6 leading-relaxed">
                      {business.description}
                    </p>
                    <a
                      href={business.link}
                      className="inline-flex items-center justify-center w-32 px-4 py-2 rounded-full text-[#7cd144] font-semibold transition-all cursor-pointer whitespace-nowrap text-sm border-2 border-[#7cd144] hover:bg-[#7cd144] hover:text-white group/btn"
                    >
                      <span className="group-hover/btn:text-white">Explore</span>
                      <i className="ri-arrow-right-line ml-2 text-white group-hover/btn:text-white"></i>
                    </a>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
