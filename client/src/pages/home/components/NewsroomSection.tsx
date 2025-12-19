import { useState, useEffect, useRef, useCallback } from 'react';
import { homeCmsApi } from '../../../services/api';
import { getPlaceholderImage } from '../../../utils/placeholder';

interface NewsItem {
  id: number;
  title: string;
  image: string;
  link: string;
  category?: string;
  publishedDate?: string;
  order: number;
  isActive: boolean;
}

export default function NewsroomSection() {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [news, setNews] = useState<NewsItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [isTransitioning, setIsTransitioning] = useState(false);
  const [transitionDuration, setTransitionDuration] = useState(500);
  const [itemWidth, setItemWidth] = useState(380);
  const containerRef = useRef<HTMLDivElement>(null);
  const autoPlayRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    const fetchNews = async () => {
      try {
        setLoading(true);
        const data = await homeCmsApi.getNewsItems();
        const activeNews = (data || [])
          .filter((item: NewsItem) => item.isActive)
          .sort((a: NewsItem, b: NewsItem) => (a.order || 0) - (b.order || 0));
        setNews(activeNews);
      } catch (error) {
        console.error('Failed to fetch news items:', error);
        // Fallback to default data if API fails
        setNews([
          {
            id: 1,
            title: 'Dinesh Agarwal, CEO of Refex Group, on ET Now',
            image: 'https://refex.co.in/wp-content/uploads/2025/11/newsroom-thumbnail-video.jpg',
            link: '/press_releases/dinesh-agarwal-ceo-of-refex-group-on-et-now/',
            category: 'Press Release',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            title: 'Refex Mobility expands operations to Delhi NCR',
            image: 'https://refex.co.in/wp-content/uploads/2025/11/Refex-Mobility-expands.jpg',
            link: '/press_releases/refex-mobility-expands-operations-to-delhi-ncr/',
            category: 'Press Release',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            title: 'Refex eVeelz rebrands as Refex Mobility; to consolidate focus on existing Tier-1 market',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/2675d7edc8e086e4c4be378eba93a660.jpeg',
            link: '/press_releases/refex-eveelz-rebrands-as-refex-mobility-to-consolidate-focus-on-existing-tier-1-market/',
            category: 'Press Release',
            order: 3,
            isActive: true,
          },
          {
            id: 4,
            title: 'Refex Group is the Official Sponsor of Chennai Super Kings',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/d674bfc0dcb4ffb4355d91b67e0eb3b3.jpeg',
            link: '/press_releases/refex-group-is-the-official-sponsor-of-chennai-super-kings/',
            category: 'Press Release',
            order: 4,
            isActive: true,
          },
          {
            id: 5,
            title: 'Uber partners with Chennai-based Refex Green Mobility to deploy 1,000 EVs across cities',
            image: 'https://refex.co.in/wp-content/uploads/2025/07/press-release02.jpg',
            link: '/press_releases/uber-partners-with-chennai-based-refex-green-mobility-to-deploy-1000-evs-across-cities/',
            category: 'Press Release',
            order: 5,
            isActive: true,
          },
          {
            id: 6,
            title: 'Refex Group Strengthens Leadership in Sustainability at UNGCNI Annual Convention 2025',
            image: 'https://refex.co.in/wp-content/uploads/2025/07/press-release04.jpg',
            link: '/press_releases/refex-group-strengthens-leadership-in-sustainability-at-ungcni-annual-convention-2025/',
            category: 'Press Release',
            order: 6,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchNews();
  }, []);

  // Calculate item width based on screen size
  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth < 640) {
        setItemWidth(280);
      } else if (window.innerWidth < 768) {
        setItemWidth(320);
      } else if (window.innerWidth < 1024) {
        setItemWidth(350);
      } else {
        setItemWidth(380);
      }
    };

    handleResize();
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  // Navigate to next slide
  const goToNext = useCallback(() => {
    if (isTransitioning || news.length === 0) return;
    setIsTransitioning(true);
    const isLastItem = currentIndex === news.length - 1;
    // Extra time when looping from last to first
    const duration = isLastItem ? 1000 : 500;
    setTransitionDuration(duration);
    setCurrentIndex((prev) => (prev + 1) % news.length);
    setTimeout(() => setIsTransitioning(false), duration);
  }, [isTransitioning, news.length, currentIndex]);

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
    if (news.length === 0) return;

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
  }, [news.length, goToNext]);

  // Pause auto-play on hover
  const handleMouseEnter = () => {
    if (autoPlayRef.current) {
      clearInterval(autoPlayRef.current);
    }
  };

  const handleMouseLeave = () => {
    if (news.length === 0) return;
    autoPlayRef.current = setInterval(() => {
      goToNext();
    }, 4000);
  };

  // Create extended array for infinite loop effect (3x the items)
  const getExtendedNews = () => {
    if (news.length === 0) return [];
    return [...news, ...news, ...news];
  };

  // Calculate the offset to center the current item
  const getTransformOffset = () => {
    if (!containerRef.current || news.length === 0) return 0;
    const containerWidth = containerRef.current.offsetWidth;
    const gap = 24; // gap between items
    const totalItemWidth = itemWidth + gap;
    
    // Center position: middle of container - half of item width
    const centerOffset = containerWidth / 2 - itemWidth / 2;
    
    // Add offset for the middle set of items (since we have 3 sets)
    const middleSetOffset = news.length * totalItemWidth;
    
    // Calculate the position to center the current item
    const translateX = centerOffset - (currentIndex * totalItemWidth) - middleSetOffset;
    
    return translateX;
  };

  if (loading) {
    return (
      <section className="py-12 lg:py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading news...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (news.length === 0) {
    return null;
  }

  const extendedNews = getExtendedNews();

  return (
    <section className="py-12 lg:py-16 bg-white overflow-hidden">
      <div className="max-w-7xl mx-auto px-4">
        <div className="flex items-center justify-between mb-12">
          <h2 className="text-[34px] font-bold text-black uppercase tracking-wider">
            Newsroom
          </h2>
          <a
            href="/newsroom/"
            className="px-6 py-3 border-2 border-[#7cd144] text-[#7cd144] bg-white rounded-full hover:bg-[#7cd144] hover:text-white transition-colors cursor-pointer whitespace-nowrap"
          >
            View All
          </a>
        </div>

        <div 
          className="relative"
          onMouseEnter={handleMouseEnter}
          onMouseLeave={handleMouseLeave}
        >
          {/* Slider Container */}
          <div 
            ref={containerRef}
            className="overflow-hidden"
          >
            <div 
              className="flex gap-6 ease-out"
              style={{ 
                transform: `translateX(${getTransformOffset()}px)`,
                transition: `transform ${transitionDuration}ms ease-out`,
              }}
            >
              {extendedNews.map((item, index) => {
                const actualIndex = index % news.length;
                
                return (
                  <div
                    key={`${item.id}-${index}`}
                    className="flex-shrink-0 transition-all duration-500 group"
                    style={{ 
                      width: `${itemWidth}px`,
                    }}
                    onClick={() => goToSlide(actualIndex)}
                  >
                    <a 
                      href={item.link} 
                      className="block cursor-pointer"
                    >
                      <div className="bg-white overflow-hidden shadow-lg transition-all duration-500 border border-gray-200">
                        <div className="relative h-56 sm:h-64 overflow-hidden">
                          <img
                            src={item.image}
                            alt={item.title}
                            className="w-full h-full object-cover transition-transform duration-500"
                            onError={(e) => {
                              (e.target as HTMLImageElement).src = getPlaceholderImage(400, 256, 'No Image');
                            }}
                          />
                          <div className="absolute inset-0 bg-black/0 group-hover:bg-black/30 transition-all duration-300"></div>
                        </div>
                        <div className="p-5">
                          <h3 className="text-base sm:text-lg font-bold text-black line-clamp-2 group-hover:text-[#2a608d] transition-colors">
                            {item.title}
                          </h3>
                        </div>
                      </div>
                    </a>
                  </div>
                );
              })}
            </div>
          </div>

          {/* Pagination Dots */}
          <div className="flex justify-center gap-1.5 mt-8">
            {news.map((_, index) => (
              <button
                key={index}
                onClick={() => goToSlide(index)}
                className={`w-2 h-2 rounded-full transition-all duration-300 cursor-pointer ${
                  index === currentIndex 
                    ? 'bg-black' 
                    : 'bg-gray-300 hover:bg-gray-400'
                }`}
                aria-label={`Go to slide ${index + 1}`}
              />
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
