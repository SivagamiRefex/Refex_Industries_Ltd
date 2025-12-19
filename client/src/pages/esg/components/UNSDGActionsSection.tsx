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

interface UnsdgAction {
  id: number;
  icon: string;
  title: string;
  points: string[];
  video?: string;
  order: number;
  isActive: boolean;
}

interface UnsdgActionsSectionHeader {
  id: number;
  title: string;
  isActive: boolean;
}

export default function UNSDGActionsSection() {
  const [header, setHeader] = useState<UnsdgActionsSectionHeader | null>(null);
  const [sdgs, setSdgs] = useState<UnsdgAction[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackHeader: UnsdgActionsSectionHeader = {
      id: 1,
      title: 'UN SDGs and our Actions',
      isActive: true,
    };
    
    const fallbackSdgs: UnsdgAction[] = [
      {
        id: 1,
        icon: 'https://refex.co.in/wp-content/uploads/2024/12/sdg03.png',
        title: 'Good Health and Well-being',
        points: [
          'Affordable medical diagnosis through our indigenously made affordable MRI and X-ray machines',
          'Certified with ISO 45001 through a successful implementation of the Occupational Health and Safety Management System',
          'Regular sessions conducted on the mental well-being of employees followed by counseling',
        ],
        order: 1,
        isActive: true,
      },
      {
        id: 2,
        icon: 'https://refex.co.in/wp-content/uploads/2025/06/sdg041.png',
        title: 'Quality Education',
        points: [
          'Merit scholarship and financial support to 5 Children in Ramakrishna Mission School, Chennai',
          'Accommodation support for 30 UPSC appearing candidates in Delhi NCR region',
          'Supported 30 tribal schools across 30 villages in Chhattisgarh, benefiting around 600 children by improving access to quality early education',
          'In Bhasma, Sundargarh district, support extended to a residential school for 45 students, including orphans and children from underprivileged backgrounds',
        ],
        order: 2,
        isActive: true,
      },
      {
        id: 3,
        icon: 'https://refex.co.in/wp-content/uploads/2025/02/sdg04.png',
        title: 'Gender Equality',
        points: [
          'Currently, women make up 11% of our workforce, and we aim to increase this representation to 15% within the next two years',
          'Implemented a \'Wellness Work from Home\' choice, enabling women to prioritise self-care during their menstrual cycle',
        ],
        order: 3,
        isActive: true,
      },
      {
        id: 4,
        icon: 'https://refex.co.in/wp-content/uploads/2024/12/sdg06.png',
        title: 'Clean Water & Sanitation',
        points: [
          'Our "Nirmal Jal" initiative strives to ensure accessible clean water by rejuvenating dependent water bodies and rainwater harvesting',
          'We aim to become water positive by 2035',
        ],
        video: 'https://www.youtube.com/embed/Jlk4HC70Jek?rel=0&modestbranding=1&showinfo=0&controls=0',
        order: 4,
        isActive: true,
      },
      {
        id: 5,
        icon: 'https://refex.co.in/wp-content/uploads/2024/12/sdg07.png',
        title: 'Affordable & Clean Energy',
        points: [
          'Operating a 68 MW solar power facility at the Bhilai Plant, and supplying uninterupted solar energy to South East Central Railway through a power purchase agreement (PPA)',
          'Incorporated smart grid systems to elevate the efficiency and dependability of the solar power plant',
          'Set up and commissioned two 1MW - 2MWH-BESS Solar Plant at Pratapur and Siachen for Indian Army',
          'Our refrigerant gas plant is operational on 100% renewable solar energy',
        ],
        order: 5,
        isActive: true,
      },
      {
        id: 6,
        icon: 'https://refex.co.in/wp-content/uploads/2025/02/sdg09.png',
        title: 'Industry, Innovation and Infrastructure',
        points: [
          'MedTech pioneers groundbreaking medical imaging technology, encompassing indigenously made X-ray and MRI machines, empowered by innovation and digital imaging for elevated diagnostics',
          'Venwind Refex is focused on advancing India\'s clean energy future by manufacturing sustainable wind turbines to deliver scalable, low-carbon energy solutions.',
        ],
        order: 6,
        isActive: true,
      },
      {
        id: 7,
        icon: 'https://refex.co.in/wp-content/uploads/2025/02/sdg10.png',
        title: 'Reduced Inequalities',
        points: [
          'Workforce Experience Blend: A harmonious mix of youthful energy and seasoned expertise among Refexians',
          'We offer regional religious holidays that cater to their diverse festive observances, with a holiday calendar tailored to respect individual religious inclinations',
          'We have well-rounded diversity within our organisation, embracing a harmonious mix of religious, linguistic, geographical, and age variations',
        ],
        order: 7,
        isActive: true,
      },
      {
        id: 8,
        icon: 'https://refex.co.in/wp-content/uploads/2025/02/sdg11.png',
        title: 'Sustainable Cities and Communities',
        points: [
          'RGML\'s pioneering services promote sustainable urban transportation by transitioning businesses to EVs for employees commuting in the B2B model and B2B2C model in major cities like Mumbai, Bengaluru, Hyderabad, Pune, and Chennai',
        ],
        order: 8,
        isActive: true,
      },
      {
        id: 9,
        icon: 'https://refex.co.in/wp-content/uploads/2024/12/sdg12.png',
        title: 'Responsible Consumption & Production',
        points: [
          'Ash and Coal handling business facilitates eco-friendly disposal and management of ash partnering with the cement manufacturing plant, brick manufacturer, and block industries ensuring circularity of material and GHG emission reduction',
        ],
        order: 9,
        isActive: true,
      },
      {
        id: 10,
        icon: 'https://refex.co.in/wp-content/uploads/2024/12/sdg13.png',
        title: 'Climate Action',
        points: [
          'Refex strives for an annual 10% reduction in energy intensity relative to the FY 2022-23 baseline',
          'Target to become carbon neutral by 2040',
          'More focus to utilize renewable energy for company operations',
        ],
        order: 10,
        isActive: true,
      },
      {
        id: 11,
        icon: 'https://refex.co.in/wp-content/uploads/2025/02/sdg15.png',
        title: 'Life on Land',
        points: [
          'Pledged to plant and nurture 1,00,000 saplings by 2035.',
          'Planted 5000 saplings in FY 2023-24 and in the process of planting 10,000 mangrove saplings by FY 2026',
          'Collaborating with UNGC Network India and established a Corporate Centre on Biodiversity Conservation.',
        ],
        order: 11,
        isActive: true,
      },
      {
        id: 12,
        icon: 'https://refex.co.in/wp-content/uploads/2024/12/sdg17.png',
        title: 'Partnerships for the Goals',
        points: [
          'Refex is proud to be part of the United Nations Global Compact (UNGC). By joining forces with other partners, we\'re committed to ethical business practices and addressing the most pressing social and environmental issues',
          'We\'ve built a strong network of partners in the cement, brick, and block industries, local governments, educational institutions, concrete producers, road contractors, NGO, power plant operators and other industrial houses to promote and achieve UNSDG',
        ],
        order: 12,
        isActive: true,
      },
    ];

    try {
      setLoading(true);
      
      // Try to fetch data, but handle errors gracefully
      let headerData = null;
      let actionsData: UnsdgAction[] = [];
      
      try {
        headerData = await esgCmsApi.getUnsdgActionsSection();
      } catch (err: any) {
        console.warn('Failed to fetch UN SDG Actions section header:', err.message);
        headerData = null;
      }
      
      try {
        actionsData = await esgCmsApi.getUnsdgActions();
      } catch (err: any) {
        console.warn('Failed to fetch UN SDG Actions:', err.message);
        actionsData = [];
      }
      
      // Use API data if available and active, otherwise use fallback
      if (headerData && (headerData.isActive === true || headerData.isActive === undefined || headerData.isActive === null)) {
        setHeader(headerData);
      } else {
        setHeader(fallbackHeader);
      }
      
      const activeActions = (actionsData || [])
        .filter((action: UnsdgAction) => action.isActive)
        .sort((a: UnsdgAction, b: UnsdgAction) => (a.order || 0) - (b.order || 0));
      
      // If no active actions from API, use fallback
      if (activeActions.length === 0) {
        setSdgs(fallbackSdgs);
      } else {
        setSdgs(activeActions);
      }
    } catch (error: any) {
      console.error('Failed to fetch UN SDG Actions section:', error);
      // Fallback to default data on any error
      setHeader(fallbackHeader);
      setSdgs(fallbackSdgs);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-20 bg-white">
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading UN SDG Actions section...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (sdgs.length === 0) {
    return null;
  }

  // Ensure we have a header (use default if not available)
  const displayHeader = header || {
    id: 1,
    title: 'UN SDGs and our Actions',
    isActive: true,
  };

  return (
    <section className="py-20 bg-white">
      <div className="container mx-auto px-4 max-w-7xl">
        <div className="text-center mb-16">
          <h2 
            className="text-[34px] font-semibold mb-6" 
            style={{ color: '#1f1f1f' }}
            data-aos="fade-right"
          >
            {displayHeader.title}
          </h2>
        </div>

        <div className="space-y-8">
          {sdgs.map((sdg, index) => {
            const isEven = index % 2 === 1;
            
            return (
              <div
                key={index}
                className="overflow-hidden"
              >
                <div className={`grid grid-cols-[600px_1fr] ${isEven ? 'direction-rtl' : ''}`}>
                  {/* Image */}
                  <div className={`flex items-center justify-center overflow-hidden ${isEven ? 'order-2' : 'order-1'}`}>
                    <img
                      src={getFullUrl(sdg.icon)}
                      alt={sdg.title}
                      className="w-full h-auto object-contain transition-transform duration-300 hover:scale-110 cursor-pointer"
                    />
                  </div>
                  
                  {/* Content */}
                  <div className={`p-8 flex flex-col justify-center ${isEven ? 'order-1' : 'order-2'}`}>
                    <h3 className="font-bold mb-6" style={{ fontSize: '22px', color: '#1f1f1f' }}>{sdg.title}</h3>
                    <ul className="space-y-3">
                      {sdg.points.map((point, idx) => (
                        <li key={idx} className="flex items-start gap-3" style={{ fontSize: '16px', color: '#1f1f1f' }}>
                          <span className="w-2 h-2 rounded-full mt-2 flex-shrink-0" style={{ backgroundColor: '#1f1f1f' }}></span>
                          <span>{point}</span>
                        </li>
                      ))}
                    </ul>
                    {sdg.video && (
                      <div className="mt-6">
                        <iframe
                          width="100%"
                          height="250"
                          src={sdg.video}
                          frameBorder="0"
                          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                          allowFullScreen
                          className="rounded-lg"
                        ></iframe>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}