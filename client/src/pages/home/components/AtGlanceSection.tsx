import { useState, useEffect, useRef } from 'react';
import { homeCmsApi } from '../../../services/api';

interface Statistic {
  id: number;
  title: string;
  value: string;
  description: string;
  image: string;
  color?: string;
  order: number;
  isActive: boolean;
}

export default function AtGlanceSection() {
  const [statistics, setStatistics] = useState<Statistic[]>([]);
  const [counts, setCounts] = useState<{ [key: number]: number }>({});
  const [hasAnimated, setHasAnimated] = useState(false);
  const [hoveredItem, setHoveredItem] = useState<number | null>(null);
  const sectionRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const fetchStatistics = async () => {
      try {
        const data = await homeCmsApi.getStatistics();
        const activeStats = (data || [])
          .filter((s: Statistic) => s.isActive)
          .sort((a: Statistic, b: Statistic) => (a.order || 0) - (b.order || 0));
        setStatistics(activeStats);
      } catch (error) {
        console.error('Failed to fetch statistics:', error);
        // Fallback to default data
        setStatistics([
          {
            id: 1,
            title: 'Years of Legacy',
            value: '23+',
            description: 'Years of Legacy',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/experience-icon-2.svg',
            color: '#4ade80',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            title: 'People',
            value: '500+',
            description: 'People',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/team-size-01.svg',
            color: '#4ade80',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            title: 'Pan India Presence',
            value: 'Pan India',
            description: 'Presence',
            image: 'https://refex.co.in/wp-content/uploads/2025/04/location.svg',
            color: '#4ade80',
            order: 3,
            isActive: true,
          },
        ]);
      }
    };

    fetchStatistics();
  }, []);

  useEffect(() => {
    if (statistics.length === 0) return;

    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && !hasAnimated) {
          setHasAnimated(true);
          
          // Animate each statistic that has a numeric value
          statistics.forEach((stat) => {
            const numericValue = parseInt(stat.value);
            if (!isNaN(numericValue)) {
              const endValue = numericValue;
              let startValue = 0;
              const increment = endValue > 100 ? 10 : 1;
              const interval = endValue > 100 ? 20 : 50;
              
              const timer = setInterval(() => {
                startValue += increment;
                if (startValue >= endValue) {
                  setCounts(prev => ({ ...prev, [stat.id]: endValue }));
                  clearInterval(timer);
                } else {
                  setCounts(prev => ({ ...prev, [stat.id]: startValue }));
                }
              }, interval);
            }
          });
        }
      },
      { threshold: 0.3 }
    );

    if (sectionRef.current) {
      observer.observe(sectionRef.current);
    }

    return () => observer.disconnect();
  }, [hasAnimated, statistics]);

  if (statistics.length === 0) {
    return null;
  }

  const getDisplayValue = (stat: Statistic) => {
    const numericValue = parseInt(stat.value);
    if (!isNaN(numericValue)) {
      const count = counts[stat.id] || 0;
      return `${count}${stat.value.replace(numericValue.toString(), '')}`;
    }
    return stat.value;
  };

  return (
    <section ref={sectionRef} className="py-12 lg:py-16 bg-[#f8f9fa]">
      <div className="max-w-7xl mx-auto px-4">
        <div className="mb-12">
          <h2 
            className="text-[35px] font-semibold text-black uppercase tracking-wider mb-4"
          >
            At a Glance
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 lg:gap-12">
          {statistics.map((stat, index) => (
            <div
              key={stat.id}
              className={`text-center p-8 cursor-pointer transition-all duration-300 ${
                hoveredItem === index ? 'bg-white rounded-2xl shadow-lg' : ''
              }`}
              style={{
                transform: hoveredItem === index ? 'scale(1.05)' : 'scale(1)',
                transformOrigin: 'center',
              }}
              onMouseEnter={() => setHoveredItem(index)}
              onMouseLeave={() => setHoveredItem(null)}
            >
              <div className="mb-4 flex justify-center">
                <img
                  src={stat.image}
                  alt={stat.title}
                  className="w-16 h-16"
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = 'https://via.placeholder.com/64x64?text=Icon';
                  }}
                />
              </div>
              <div
                className="text-5xl font-normal mb-2"
                style={{
                  background: 'linear-gradient(-90deg, rgba(56, 132, 169, 1) 0%, rgba(108, 182, 97, 1) 40%, rgb(243, 134, 89) 80%)',
                  WebkitBackgroundClip: 'text',
                  WebkitTextFillColor: 'transparent',
                  backgroundClip: 'text',
                  color: 'transparent',
                  display: 'inline-block',
                }}
              >
                {getDisplayValue(stat)}
              </div>
              <div className="text-[20px] text-[#1F1F1F] font-medium">{stat.description}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
