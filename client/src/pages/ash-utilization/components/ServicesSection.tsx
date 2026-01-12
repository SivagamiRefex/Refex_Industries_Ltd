import { useState, useEffect } from 'react';
import { ashUtilizationCmsApi } from '../../../services/api';
import { getPlaceholderImage } from '../../../utils/placeholder';

interface Service {
  id: number;
  title: string;
  image?: string;
  imagePosition: 'left' | 'right';
  intro?: string;
  subtitle?: string;
  pointsJson?: string[];
  order: number;
  isActive: boolean;
}

function ServicesSection() {
  const [activeTab, setActiveTab] = useState(0);
  const [services, setServices] = useState<Service[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchServices = async () => {
      try {
        setLoading(true);
        const data = await ashUtilizationCmsApi.getServices();
        const activeServices = (data || [])
          .filter((item: Service) => item.isActive)
          .sort((a: Service, b: Service) => (a.order || 0) - (b.order || 0));
        setServices(activeServices);
        // Set default active tab to first service if available
        if (activeServices.length > 0) {
          setActiveTab(0);
        }
      } catch (error) {
        console.error('Failed to fetch services:', error);
        // Fallback to default data if API fails
        setServices([
          {
            id: 1,
            title: 'Ash Utilisation',
            image: 'https://refex.co.in/wp-content/uploads/2025/06/supply-img01.jpg',
            imagePosition: 'left',
            intro: 'Ash, if released into the atmosphere, can cause significant environmental harm. Refex plays a vital role in its safe and responsible utilisation by ensuring efficient transportation from plant silos and dykes to designated sites using trucks, hywas, bulkers, and rail rakes. The ash is then utilised at various locations in full compliance with regulatory standards.',
            subtitle: 'With a strong focus on innovation and environmental stewardship, Refex continues to be a trusted partner in ash management solutions, supporting power plants through:',
            pointsJson: [
              'Extensive network of fleets and vendor partners',
              'Advanced tracking technology, sensors and equipment providing real-time information',
              'Customized solutions tailored to the needs of power plant operators.',
              'Comprehensive utilisation strategy for both Fly Ash and Pond Ash for each power plant',
              'Strong partnerships with cement companies, road concessionaires, brick manufacturers, mine operators and government agencies',
              '100% compliance to MOEF guidelines and Pollution Control Board standards'
            ],
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            title: 'Coal Supply and Handling',
            image: 'https://refex.co.in/wp-content/uploads/2025/06/supply-img02.jpg',
            imagePosition: 'right',
            intro: 'Refex is dedicated to guaranteeing the seamless and efficient supply of coal to various power plants at competitive prices.',
            subtitle: 'We also provide comprehensive services for over burden excavation and coal yard management encompassing,',
            pointsJson: [
              'Coal handling Plant Room Operations',
              'Segregation of Coal and Stone',
              'Housekeeping',
              'Initial Crushing',
              'Management of Heavy Machinery',
              'Maintenance of CHP Equipment'
            ],
            order: 2,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchServices();
  }, []);

  if (loading) {
    return (
      <div className="py-20 bg-[#F5F5F5]">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading services...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (services.length === 0) {
    return null;
  }

  const currentService = services[activeTab];

  if (!currentService) {
    return null;
  }

  return (
    <div className="py-20 bg-[#F5F5F5]">
      <div className="max-w-7xl mx-auto px-12">
        <div className="text-center mb-16">
          <h2 
            style={{ fontSize: '34px', color: '#1f1f1f', fontWeight: 600 }} 
            className="mb-4"
            data-aos="fade-right"
          >
            OUR SERVICES
          </h2>
        </div>

        {/* Desktop Tabs */}
        <div className="hidden md:block">
          <div className="flex flex-wrap justify-center gap-4 mb-12" style={{ maxWidth: '100%' }}>
            {services.map((service, index) => (
              <button
                key={service.id}
                onClick={() => setActiveTab(index)}
                className={`font-semibold transition-all whitespace-nowrap cursor-pointer relative group ${
                  activeTab === index
                    ? 'bg-[#e4e4e4] text-gray-900'
                    : 'bg-white text-gray-700 hover:bg-gray-100'
                }`}
                style={{ 
                  padding: '15px 50px',
                  fontSize: '24px',
                  flex: '0 0 calc(50% - 8px)',
                  maxWidth: 'calc(50% - 8px)'
                }}
              >
                {service.title}
                {activeTab !== index && (
                  <span className="absolute bottom-0 left-0 w-0 h-0.5 bg-[#7cd144] transition-all duration-300 group-hover:w-full"></span>
                )}
              </button>
            ))}
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-stretch">
            {currentService.imagePosition === 'left' ? (
              <>
                <div 
                  className="order-1 flex"
                  data-aos="fade-right"
                  data-aos-duration="800"
                  key={`image-${activeTab}`}
                >
                  {currentService.image && (
                    <div className="rounded-lg overflow-hidden shadow-lg w-full h-full">
                      <img
                        src={currentService.image}
                        alt={currentService.title}
                        className="w-full h-full object-cover"
                        onError={(e) => {
                          (e.target as HTMLImageElement).src = 'https://via.placeholder.com/800x500?text=No+Image';
                        }}
                      />
                    </div>
                  )}
                </div>
                <div 
                  className="order-2"
                  data-aos="fade-left"
                  data-aos-duration="800"
                  key={`content-${activeTab}`}
                >
                  <div className="space-y-6">
                    {currentService.intro && (
                      <h6 className="leading-relaxed" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                        {currentService.intro}
                      </h6>
                    )}
                    {currentService.subtitle && (
                      <h6 className="leading-relaxed font-semibold" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                        {currentService.subtitle}
                      </h6>
                    )}
                    {Array.isArray(currentService.pointsJson) && currentService.pointsJson.length > 0 && (
                      <ul className="space-y-4">
                        {currentService.pointsJson.map((point, idx) => (
                          <li key={idx} className="flex items-start gap-3">
                            <span className="w-6 h-6 flex items-center justify-center flex-shrink-0 mt-1">
                              <i className="ri-arrow-right-s-line text-[#9ACD32] text-xl"></i>
                            </span>
                            <p className="leading-relaxed flex-1" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                              {point}
                            </p>
                          </li>
                        ))}
                      </ul>
                    )}
                  </div>
                </div>
              </>
            ) : (
              <>
                <div 
                  className="order-1"
                  data-aos="fade-right"
                  data-aos-duration="800"
                  key={`content-${activeTab}`}
                >
                  <div className="space-y-6">
                    {currentService.intro && (
                      <h6 className="leading-relaxed" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                        {currentService.intro}
                      </h6>
                    )}
                    {currentService.subtitle && (
                      <h6 className="leading-relaxed font-semibold" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                        {currentService.subtitle}
                      </h6>
                    )}
                    {Array.isArray(currentService.pointsJson) && currentService.pointsJson.length > 0 && (
                      <ul className="space-y-4">
                        {currentService.pointsJson.map((point, idx) => (
                          <li key={idx} className="flex items-start gap-3">
                            <span className="w-6 h-6 flex items-center justify-center flex-shrink-0 mt-1">
                              <i className="ri-arrow-right-s-line text-[#9ACD32] text-xl"></i>
                            </span>
                            <p className="leading-relaxed flex-1" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                              {point}
                            </p>
                          </li>
                        ))}
                      </ul>
                    )}
                  </div>
                </div>
                <div 
                  className="order-2 flex"
                  data-aos="fade-left"
                  data-aos-duration="800"
                  key={`image-${activeTab}`}
                >
                  {currentService.image && (
                    <div className="rounded-lg overflow-hidden shadow-lg w-full h-full">
                      <img
                        src={currentService.image}
                        alt={currentService.title}
                        className="w-full h-full object-cover"
                        onError={(e) => {
                          (e.target as HTMLImageElement).src = 'https://via.placeholder.com/800x500?text=No+Image';
                        }}
                      />
                    </div>
                  )}
                </div>
              </>
            )}
          </div>
        </div>

        {/* Mobile Accordion */}
        <div className="md:hidden space-y-4">
          {services.map((service, index) => (
            <div key={service.id} className="bg-white rounded-lg overflow-hidden shadow-md">
              <button
                onClick={() => setActiveTab(activeTab === index ? -1 : index)}
                className="w-full px-6 py-4 text-left font-semibold text-gray-900 flex items-center justify-between cursor-pointer"
              >
                {service.title}
                <i className={`ri-arrow-${activeTab === index ? 'up' : 'down'}-s-line text-xl`}></i>
              </button>
              
              {activeTab === index && (
                <div className="px-6 pb-6">
                  {service.image && (
                    <div className="mb-6">
                      <img
                        src={service.image}
                        alt={service.title}
                        className="w-full h-64 object-cover rounded-lg"
                        onError={(e) => {
                          (e.target as HTMLImageElement).src = getPlaceholderImage(400, 256, 'No Image');
                        }}
                      />
                    </div>
                  )}
                  <div className="space-y-4">
                    {service.intro && (
                      <h6 className="leading-relaxed" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                        {service.intro}
                      </h6>
                    )}
                    {service.subtitle && (
                      <h6 className="leading-relaxed font-semibold" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                        {service.subtitle}
                      </h6>
                    )}
                    {Array.isArray(service.pointsJson) && service.pointsJson.length > 0 && (
                      <ul className="space-y-3">
                        {service.pointsJson.map((point, idx) => (
                          <li key={idx} className="flex items-start gap-2">
                            <span className="w-5 h-5 flex items-center justify-center flex-shrink-0 mt-0.5">
                              <i className="ri-arrow-right-s-line text-[#9ACD32] text-lg"></i>
                            </span>
                            <p className="leading-relaxed flex-1" style={{ fontSize: '18px', color: '#1f1f1f' }}>
                              {point}
                            </p>
                          </li>
                        ))}
                      </ul>
                    )}
                  </div>
                </div>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default ServicesSection;
