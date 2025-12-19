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

interface Policy {
  id: number;
  title: string;
  image: string;
  link: string;
  order: number;
  isActive: boolean;
}

interface PoliciesSectionHeader {
  id: number;
  title: string;
  description?: string;
  isActive: boolean;
}

export default function ESGPoliciesSection() {
  const [header, setHeader] = useState<PoliciesSectionHeader | null>(null);
  const [policies, setPolicies] = useState<Policy[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      setLoading(true);
      const [headerData, policiesData] = await Promise.all([
        esgCmsApi.getPoliciesSection(),
        esgCmsApi.getPolicies(),
      ]);
      
      if (headerData && (headerData.isActive === true || headerData.isActive === undefined || headerData.isActive === null)) {
        setHeader(headerData);
      } else {
        setHeader(null);
      }
      
      const activePolicies = (policiesData || [])
        .filter((policy: Policy) => policy.isActive)
        .sort((a: Policy, b: Policy) => (a.order || 0) - (b.order || 0));
      setPolicies(activePolicies);
    } catch (error) {
      console.error('Failed to fetch policies section:', error);
      // Fallback to default data
      setHeader({
        id: 1,
        title: 'ESG POLICIES',
        description: 'Sustainable development is a fundamental value we prioritize. Our management team is deeply dedicated to this objective, ensuring it is embedded in our policies and procedures covering environmental, social, and governance aspects.',
        isActive: true,
      });
      setPolicies([
        {
          id: 1,
          title: 'Quality Policy',
          image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/1128e6028c267b8815610fa95a55bdd6.jpeg',
          link: 'https://refex.co.in/wp-content/uploads/2024/12/Quality-Policy.pdf',
          order: 1,
          isActive: true,
        },
        {
          id: 2,
          title: 'EHS policy',
          image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/559620381e3172f57ad556f2d25c4c5f.jpeg',
          link: 'https://refex.co.in/wp-content/uploads/2024/12/EHS-Policy.pdf',
          order: 2,
          isActive: true,
        },
        {
          id: 3,
          title: 'Sustainability Policy',
          image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/71965c8784563959b900528cb5104401.jpeg',
          link: 'https://refex.co.in/wp-content/uploads/2024/12/Sustainability-ESG-Policy.pdf',
          order: 3,
          isActive: true,
        },
        {
          id: 4,
          title: 'Grievance Policy',
          image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/1731653886eed719dcd84da082342c61.png',
          link: 'https://refex.co.in/wp-content/uploads/2024/12/Grievance-Policy.pdf',
          order: 4,
          isActive: true,
        },
      ]);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section id="esg-policies" className="py-20 bg-white">
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading policies section...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (!header || policies.length === 0) {
    return null;
  }

  return (
    <section id="esg-policies" className="py-20 bg-white">
      <div className="container mx-auto px-4 max-w-7xl">
        <div className="mb-0">
          <h2 
            className="text-[34px] font-semibold mb-6 text-center" 
            style={{ color: '#1f1f1f' }}
            data-aos="fade-right"
          >
            {header.title}
          </h2>
          {header.description && (
            <p className="text-left" style={{ fontSize: '16px', color: '#484848', marginBottom: '15px' }}>
              {header.description}
            </p>
          )}
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          {policies.map((policy) => (
            <div key={policy.id} className="group w-full">
              <div className="w-full aspect-square overflow-hidden mb-4">
                <img
                  src={getFullUrl(policy.image)}
                  alt={policy.title}
                  className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"
                  onError={(e) => {
                    // Hide broken images instead of requesting external placeholder
                    (e.target as HTMLImageElement).style.display = 'none';
                  }}
                />
              </div>
              <div>
                <h3 className="text-xl font-bold text-gray-900 mb-4">{policy.title}</h3>
                <a
                  href={getFullUrl(policy.link)}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center justify-between cursor-pointer"
                >
                  <span className="font-semibold text-[#7cd244] group-hover:text-gray-900 transition-colors whitespace-nowrap">
                    View Policy
                  </span>
                  <div className="w-10 h-10 bg-[#7cd244] group-hover:bg-gray-900 flex items-center justify-center transition-colors">
                    <i className="ri-arrow-right-line text-white"></i>
                  </div>
                </a>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
