import { useState, useEffect } from 'react';
import { ashUtilizationCmsApi } from '../../../services/api';

interface Feature {
  id: number;
  title: string;
  description: string;
  icon?: string;
  order: number;
  isActive: boolean;
}

function WhyChooseUsSection() {
  const [features, setFeatures] = useState<Feature[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchFeatures = async () => {
      try {
        setLoading(true);
        const data = await ashUtilizationCmsApi.getFeatures();
        const activeFeatures = (data || [])
          .filter((item: Feature) => item.isActive)
          .sort((a: Feature, b: Feature) => (a.order || 0) - (b.order || 0));
        setFeatures(activeFeatures);
      } catch (error) {
        console.error('Failed to fetch features:', error);
        // Fallback to default data if API fails
        setFeatures([
          {
            id: 1,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/superior-quality-2.png',
            title: 'Expertise in Managing Large-Scale Projects',
            description: 'Proven capability to handle complex operations efficiently.',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/eco-friendly-2.png',
            title: 'Centralized Operations',
            description: 'Digital work orders, sensor-based diesel management, centralized data collection, and GPS fleet tracking for seamless execution.',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/driver.png',
            title: 'Customer Centricity',
            description: 'Tailored solutions with transparent communication.',
            order: 3,
            isActive: true,
          },
          {
            id: 4,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/competitive-price-2.png',
            title: 'Safety & Compliance',
            description: 'Highest safety standards with full regulatory adherence.',
            order: 4,
            isActive: true,
          },
          {
            id: 5,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/money-currency.svg',
            title: 'Efficiency & Reliability',
            description: 'Fast, reliable ash services with minimal disruption.',
            order: 5,
            isActive: true,
          },
          {
            id: 6,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/cutting-edge-tech-2.png',
            title: 'Innovation & Adaptability',
            description: 'Adoption of new technologies and flexibility to evolving customer needs.',
            order: 6,
            isActive: true,
          },
          {
            id: 7,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/experience-2.png',
            title: 'Environmental Responsibility',
            description: 'Sustainable, regulation-compliant ash management practices.',
            order: 7,
            isActive: true,
          },
          {
            id: 8,
            icon: 'https://refex.co.in/wp-content/uploads/2024/12/competitive-price-2.png',
            title: 'Cost-Effective Solutions',
            description: 'Affordable services designed to meet power plant budgets.',
            order: 8,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchFeatures();
  }, []);

  if (loading) {
    return (
      <div className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-12">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading features...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (features.length === 0) {
    return null;
  }

  return (
    <div className="py-20 bg-white">
      <div className="max-w-7xl mx-auto px-12">
        <div className="text-center mb-16">
          <h2 
            style={{ fontSize: '34px', color: '#1f1f1f', fontWeight: 600 }} 
            className="mb-4"
            data-aos="fade-right"
          >
            WHY CHOOSE US
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {features.map((feature, index) => (
            <div
              key={feature.id}
              className="border border-gray-300 rounded-lg p-6 transition-transform duration-300 hover:scale-105 cursor-pointer"
              data-aos="zoom-in"
              data-aos-delay={index * 100}
            >
              <div className="flex flex-col items-start">
                {feature.icon && (
                  <div className="w-16 h-16 flex-shrink-0 flex items-center justify-start mb-4">
                    <img
                      src={feature.icon}
                      alt={feature.title}
                      className="w-full h-full object-contain"
                      onError={(e) => {
                        (e.target as HTMLImageElement).src = 'https://via.placeholder.com/64x64?text=Icon';
                      }}
                    />
                  </div>
                )}
                <div className="w-full">
                  <h3 className="text-lg font-bold text-gray-900 mb-3">
                    {feature.title}
                  </h3>
                  <p className="text-gray-600 text-sm leading-relaxed">
                    {feature.description}
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default WhyChooseUsSection;