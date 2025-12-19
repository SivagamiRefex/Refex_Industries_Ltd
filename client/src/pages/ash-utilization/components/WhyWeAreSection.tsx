import { useState, useEffect } from 'react';
import { ashUtilizationCmsApi } from '../../../services/api';

interface HeroSlide {
  image: string;
}

interface WhoWeAreSection {
  id?: number;
  title: string;
  content: string;
  slides: HeroSlide[];
  isActive: boolean;
}

function WhoWeAreSection() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [section, setSection] = useState<WhoWeAreSection | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchSection = async () => {
      try {
        setLoading(true);
        const data = await ashUtilizationCmsApi.getWhoWeAre();
        if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
          setSection(data);
        } else {
          // Fallback to default if no active section
          setSection({
            title: 'WHO WE ARE',
            content: `Refex, a leader in the ash utilization sector since its entry in 2018, specializes in providing ash management services for coalfired power plants, helping them mitigate the environmental pollution caused by coal combustion.

As the largest organized player in India's ash management industry, we have successfully worked across 40+ plants and repurposed the ash generated for construction of roads, highways and embankments; for filling of mines and low-lying areas, and manufacturing of cement and bricks, thereby fostering sustainable infrastructure development.

Known for our reliable, and high-quality services, we employ advanced technologies and extensive network of fleet for the safe collection, transportation, and utilization of ash, with a strong emphasis on sustainability.`,
            slides: [
              { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/24687ccdb5cb91356b395ecdc1fc5b9e.jpeg' },
              { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/7c3c2bf683875e07aefd0074156c1eaf.jpeg' },
            ],
            isActive: true,
          });
        }
      } catch (error) {
        console.error('Failed to fetch who we are section:', error);
        // Fallback to default data if API fails
        setSection({
          title: 'WHO WE ARE',
          content: `Refex, a leader in the ash utilization sector since its entry in 2018, specializes in providing ash management services for coalfired power plants, helping them mitigate the environmental pollution caused by coal combustion.

As the largest organized player in India's ash management industry, we have successfully worked across 40+ plants and repurposed the ash generated for construction of roads, highways and embankments; for filling of mines and low-lying areas, and manufacturing of cement and bricks, thereby fostering sustainable infrastructure development.

Known for our reliable, and high-quality services, we employ advanced technologies and extensive network of fleet for the safe collection, transportation, and utilization of ash, with a strong emphasis on sustainability.`,
          slides: [
            { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/24687ccdb5cb91356b395ecdc1fc5b9e.jpeg' },
            { image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/7c3c2bf683875e07aefd0074156c1eaf.jpeg' },
          ],
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchSection();
  }, []);

  useEffect(() => {
    if (section && section.slides && section.slides.length > 0) {
      const timer = setInterval(() => {
        setCurrentSlide((prev) => (prev + 1) % section.slides.length);
      }, 3000);
      return () => clearInterval(timer);
    }
  }, [section]);

  const goToSlide = (index: number) => {
    setCurrentSlide(index);
  };

  if (loading) {
    return (
      <div className="py-20 bg-[#F5F5F5]">
        <div className="max-w-7xl mx-auto px-12">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading who we are section...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Always show something, even if section is null (shouldn't happen due to fallback)
  if (!section) {
    return (
      <div className="py-20 bg-[#F5F5F5]">
        <div className="max-w-7xl mx-auto px-12">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div className="relative overflow-hidden bg-gray-200" style={{ width: '593px', height: '409px' }}></div>
            <div>
              <span className="font-semibold mb-4 block" style={{ fontSize: '34px', color: '#1f1f1f' }}>WHO WE ARE</span>
              <div className="space-y-4 leading-relaxed" style={{ color: '#484848' }}>
                <p>Loading content...</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Split content by double line breaks to create paragraphs
  const paragraphs = section.content.split('\n\n').filter(p => p.trim());

  return (
    <div className="py-20 bg-[#F5F5F5]">
      <div className="max-w-7xl mx-auto px-12">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          {/* Image Slider */}
          {section.slides && section.slides.length > 0 && (
            <div data-aos="fade-right">
              <div className="relative overflow-hidden" style={{ width: '593px', height: '409px' }}>
                {section.slides.map((slide, index) => (
                  <div
                    key={index}
                    className={`absolute inset-0 transition-opacity duration-1000 ${
                      index === currentSlide ? 'opacity-100' : 'opacity-0'
                    }`}
                  >
                    <img
                      src={slide.image}
                      alt={`${section.title} ${index + 1}`}
                      className="w-full h-full object-cover"
                      style={{ width: '623px', height: '399px' }}
                      onError={(e) => {
                        (e.target as HTMLImageElement).src = 'https://via.placeholder.com/800x500?text=Image+Not+Found';
                      }}
                    />
                  </div>
                ))}
              </div>

              {/* Pagination Dots - Outside Image, Right End */}
              {section.slides.length > 1 && (
                <div className="flex gap-1.5 justify-end mt-2" style={{ height: '25px', alignItems: 'center' }}>
                  {section.slides.map((_, index) => (
                    <button
                      key={index}
                      onClick={() => goToSlide(index)}
                      className={`w-6 h-1.5 rounded-sm transition-all cursor-pointer ${
                        index === currentSlide ? 'bg-black' : 'bg-gray-300'
                      }`}
                      aria-label={`Go to slide ${index + 1}`}
                    />
                  ))}
                </div>
              )}
            </div>
          )}

          {/* Content */}
          <div data-aos="fade-left">
            <span 
              className="font-semibold mb-4 block" 
              style={{ fontSize: '34px', color: '#1f1f1f' }}
              data-aos="fade-up"
              data-aos-delay="100"
            >
              {section.title}
            </span>
            <div className="space-y-4 leading-relaxed" style={{ color: '#484848' }}>
              {paragraphs.map((paragraph, index) => (
                <p 
                  key={index}
                  data-aos="fade-up"
                  data-aos-delay={(index + 1) * 100}
                >
                  {paragraph}
                </p>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default WhoWeAreSection;
