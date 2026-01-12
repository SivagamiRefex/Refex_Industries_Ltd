import { useState, useEffect, useRef, useCallback } from 'react';
import { homeCmsApi } from '../../../services/api';

interface Award {
  id: number;
  title: string;
  image: string;
  order: number;
  isActive: boolean;
}

export default function AwardsSection() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [awards, setAwards] = useState<Award[]>([]);
  const [loading, setLoading] = useState(true);
  const [isTransitioning, setIsTransitioning] = useState(false);
  const [transitionDuration, setTransitionDuration] = useState(500);
  const [itemWidth, setItemWidth] = useState(350);
  const autoPlayRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    const fetchAwards = async () => {
      try {
        setLoading(true);
        const data = await homeCmsApi.getAwards();
        const activeAwards = (data || [])
          .filter((item: Award) => item.isActive)
          .sort((a: Award, b: Award) => (a.order || 0) - (b.order || 0));
        setAwards(activeAwards);
      } catch (error) {
        console.error('Failed to fetch awards:', error);
        // Fallback to default data if API fails
        setAwards([
          {
            id: 1,
            title: 'Best Organisations for Women 2024 Award by ET Now',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/BEST-ORGANISATIONS-FOR-WOMEN-2024-With-Work-force-1-300x281-1.png',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            title: 'Most Diversified Sustainable Company (India) by The Business Concept. UK',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/ESG_CSR_Award_01-Medium-300x295-1.png',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            title: 'Bronze Prize of Asia\'s Best Integrated Report for our First-ever Sustainability Report by AIRA',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/Sustainability-report-award-Medium-300x225-1.png',
            order: 3,
            isActive: true,
          },
          {
            id: 4,
            title: 'GOLD STEVIE AWARD WINNER Conglomerates Category (Medium Size)',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/Gold-Stieve-Refex.png',
            order: 4,
            isActive: true,
          },
          {
            id: 5,
            title: 'International Green Apple Environment Award 2024',
            image: 'https://refex.co.in/wp-content/uploads/2025/02/green-apple-award01.png',
            order: 5,
            isActive: true,
          },
          {
            id: 6,
            title: 'Best Waste Management Solution Award',
            image: 'https://refex.co.in/wp-content/uploads/2025/02/waste-managemnet-award01.png',
            order: 6,
            isActive: true,
          },
          {
            id: 7,
            title: 'ESG Excellence Award by ESG Grit Awards',
            image: 'https://refex.co.in/wp-content/uploads/2025/02/esg-excellence-award01.png',
            order: 7,
            isActive: true,
          },
          {
            id: 8,
            title: 'Great Place to Work Certified Apr 2025 - Apr 2026 India',
            image: 'https://refex.co.in/wp-content/uploads/2025/06/GPTW-award-img.png',
            order: 8,
            isActive: true,
          },
          {
            id: 9,
            title: 'Most Preferred Workplace 2025-2026 by Marksmen Daily',
            image: 'https://refex.co.in/wp-content/uploads/2025/07/award-img-1.png',
            order: 9,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchAwards();
  }, []);

  // Calculate item width based on screen size
  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth < 640) {
        setItemWidth(250);
      } else if (window.innerWidth < 768) {
        setItemWidth(280);
      } else if (window.innerWidth < 1024) {
        setItemWidth(320);
      } else {
        setItemWidth(350);
      }
    };

    handleResize();
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  // Navigate to next slide (move by 3 items)
  const goToNext = useCallback(() => {
    if (isTransitioning || awards.length === 0) return;
    setIsTransitioning(true);
    const itemsPerView = 3;
    const maxIndex = Math.max(0, awards.length - itemsPerView);
    const isLastGroup = currentIndex >= maxIndex;
    // Extra time when looping from last to first
    const duration = isLastGroup ? 1000 : 500;
    setTransitionDuration(duration);
    setCurrentIndex((prev) => {
      if (prev >= maxIndex) {
        return 0; // Loop back to start
      }
      return Math.min(prev + itemsPerView, maxIndex);
    });
    setTimeout(() => setIsTransitioning(false), duration);
  }, [isTransitioning, awards.length, currentIndex]);

  // Navigate to specific slide
  const goToSlide = useCallback((index: number) => {
    if (isTransitioning || index === currentIndex) return;
    setIsTransitioning(true);
    setTransitionDuration(500);
    setCurrentIndex(index);
    setTimeout(() => setIsTransitioning(false), 500);
  }, [isTransitioning, currentIndex]);

  // Auto-play functionality
  useEffect(() => {
    if (awards.length === 0) return;

    const startAutoPlay = () => {
      autoPlayRef.current = setInterval(() => {
        goToNext();
      }, 4000);
    };

    startAutoPlay();

    return () => {
      if (autoPlayRef.current) {
        clearInterval(autoPlayRef.current);
      }
    };
  }, [awards.length, goToNext]);

  // Pause auto-play on hover
  const handleMouseEnter = () => {
    if (autoPlayRef.current) {
      clearInterval(autoPlayRef.current);
    }
  };

  const handleMouseLeave = () => {
    if (awards.length === 0) return;
    autoPlayRef.current = setInterval(() => {
      goToNext();
    }, 4000);
  };

  // Calculate the offset to show 3 items per row
  const getTransformOffset = () => {
    if (awards.length === 0) return 0;
    const gap = 32; // gap between items (gap-8 = 2rem = 32px)
    const totalItemWidth = itemWidth + gap;
    
    // Calculate the position to show currentIndex and next 2 items (3 total)
    const translateX = -(currentIndex * totalItemWidth);
    
    return translateX;
  };


  if (loading) {
    return (
      <section className="py-12 lg:py-16 bg-[#f7f7f7]">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading awards...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (awards.length === 0) {
    return null;
  }

  const itemsPerView = 3;
  const totalGroups = Math.ceil(awards.length / itemsPerView);

  return (
    <section className="py-12 lg:py-16 bg-[#f7f7f7] overflow-hidden">
      <div className="max-w-7xl mx-auto px-4">
        <div className="mb-12">
          <h2 className="text-[34px] font-semibold text-black uppercase tracking-wider mb-4">
            Awards & Accolades
          </h2>
          <p className="text-gray-600 max-w-3xl">
            Our excellence is recognized through various awards and accolades that celebrate our achievements in quality and innovation.
          </p>
        </div>

        <div 
          className="relative"
          onMouseEnter={handleMouseEnter}
          onMouseLeave={handleMouseLeave}
        >
          {/* Slider Container */}
          <div 
            className="overflow-hidden mx-auto"
            style={{ 
              width: `${3 * (itemWidth + 32) - 32}px`, // Width for exactly 3 items (3 items + 2 gaps)
              maxWidth: '100%',
            }}
          >
            <div 
              className="flex gap-8 ease-out"
              style={{ 
                transform: `translateX(${getTransformOffset()}px)`,
                transition: `transform ${transitionDuration}ms ease-out`,
                width: `${awards.length * (itemWidth + 32)}px`, // Total width for all items
              }}
            >
              {awards.map((award, index) => (
                <div
                  key={award.id}
                  className="flex-shrink-0 transition-all duration-500 group cursor-pointer"
                  style={{ 
                    width: `${itemWidth}px`,
                  }}
                  onClick={() => goToSlide(index)}
                >
                  <div className="h-full flex flex-col items-center text-center">
                    <div className="mb-6 h-48 flex items-center justify-center relative overflow-hidden rounded-lg">
                      <img
                        src={award.image}
                        alt={award.title}
                        className="max-h-full max-w-full object-contain transition-transform duration-500"
                        onError={(e) => {
                          (e.target as HTMLImageElement).src = 'https://via.placeholder.com/300x200?text=No+Image';
                        }}
                      />
                      <div className="absolute inset-0 bg-black/0 group-hover:bg-black/20 transition-all duration-300 rounded-lg"></div>
                    </div>
                    <p className="text-gray-700 text-sm leading-relaxed group-hover:text-[#2a608d] transition-colors">
                      {award.title}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Pagination Dots - Show dots for groups of 3 */}
          <div className="flex justify-center gap-2 mt-8">
            {Array.from({ length: totalGroups }).map((_, groupIndex) => {
              const groupStartIndex = groupIndex * itemsPerView;
              const isActive = currentIndex >= groupStartIndex && currentIndex < groupStartIndex + itemsPerView;
              
              return (
                <button
                  key={groupIndex}
                  onClick={() => goToSlide(groupStartIndex)}
                  className={`w-3 h-3 rounded-full transition-all duration-300 cursor-pointer ${
                    isActive
                      ? 'bg-[#7dc144]' 
                      : 'bg-gray-300 hover:bg-gray-400'
                  }`}
                  aria-label={`Go to group ${groupIndex + 1}`}
                />
              );
            })}
          </div>
        </div>
      </div>
    </section>
  );
}
