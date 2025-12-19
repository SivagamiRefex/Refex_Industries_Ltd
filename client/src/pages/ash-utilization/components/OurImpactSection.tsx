import { useState, useEffect } from 'react';
import { ashUtilizationCmsApi } from '../../../services/api';

interface Impact {
  id: number;
  number: string;
  label: string;
  icon?: string;
  order: number;
  isActive: boolean;
}

function OurImpactSection() {
  const [stats, setStats] = useState<Impact[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchImpacts = async () => {
      try {
        setLoading(true);
        const data = await ashUtilizationCmsApi.getImpacts();
        const activeImpacts = (data || [])
          .filter((item: Impact) => item.isActive)
          .sort((a: Impact, b: Impact) => (a.order || 0) - (b.order || 0));
        setStats(activeImpacts);
      } catch (error) {
        console.error('Failed to fetch impacts:', error);
        // Fallback to default data if API fails
        setStats([
          {
            id: 1,
            icon: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/2fbba1b40464605ef45109b08ba5f402.png',
            number: '2000+',
            label: 'Fleet network',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            icon: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/03b83a9256266b6870f5183167c8508f.png',
            number: '40+',
            label: 'Power projects',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            icon: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/a89554bfd8530b5648a0e4d24dfeb8cc.png',
            number: '70,000 MT',
            label: 'Ash handled daily',
            order: 3,
            isActive: true,
          },
          {
            id: 4,
            icon: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/e8074c5c8a93d2409fbc4388c739414c.png',
            number: '15+',
            label: 'Presence in states',
            order: 4,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchImpacts();
  }, []);

  if (loading) {
    return (
      <section className="bg-white" style={{ paddingTop: '40px', paddingBottom: '40px' }}>
        <div className="max-w-7xl mx-auto px-12">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading impact stats...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (stats.length === 0) {
    return null;
  }

  return (
    <section className="bg-white" style={{ paddingTop: '40px', paddingBottom: '40px' }}>
      <div className="max-w-7xl mx-auto px-12">
        <div className="text-center mb-16">
          <h2 
            style={{ fontSize: '34px', color: '#1f1f1f', fontWeight: 600 }} 
            className="uppercase"
            data-aos="fade-right"
          >
            Our Impact
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12">
          {stats.map((stat, index) => (
            <div 
              key={stat.id} 
              className="text-center"
              data-aos="zoom-in"
              data-aos-delay={index * 100}
            >
              {stat.icon && (
                <div className="flex justify-center mb-6">
                  <div className="w-20 h-20 flex items-center justify-center">
                    <img
                      src={stat.icon}
                      alt={stat.label}
                      className="w-full h-full object-contain"
                      onError={(e) => {
                        (e.target as HTMLImageElement).src = 'https://via.placeholder.com/80x80?text=Icon';
                      }}
                    />
                  </div>
                </div>
              )}
              <div className="font-bold mb-2" style={{ fontSize: '26px', color: '#000000' }}>{stat.number}</div>
              <div style={{ fontSize: '16px', color: '#222222' }}>{stat.label}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

export default OurImpactSection;
