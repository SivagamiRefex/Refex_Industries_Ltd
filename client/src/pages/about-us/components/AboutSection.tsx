import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface AboutPageSection {
  id?: number;
  title: string;
  content: string;
  isActive: boolean;
}

export default function AboutSection() {
  const [section, setSection] = useState<AboutPageSection | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchSection = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getAboutPageSection();
        console.log('About section data received:', data);
        // If data is null or undefined, use fallback
        if (!data) {
          console.log('No about section data, using fallback');
          setSection({
            title: 'About Us',
            content: `Refex Industries Limited is a dynamic, diversified enterprise with strategic interests in refrigerant gases, coal and ash management, power trading, clean mobility, and renewable energy. We are committed to sustainability, innovation, and long-term value creation across sectors critical to India's growth.

We specialize in eco-friendly refrigerant gas trading with multiple cylinder size options, offering reliable and sustainable cooling solutions. In the energy domain, Refex provides integrated services for responsible coal supply, handling and ash utilization. With a Category-I license for interstate power trading, we enable electricity transactions across the country.

Refex Green Mobility Limited, our clean mobility arm, offers four-wheeler vehicles running on clean fuel along with a technology-enabled platform and a professional driver partner to serve the corporates and demand aggregator platforms.

Our renewable energy subsidiary, Venwind , focuses on revolutionising wind energy manufacturing in India through cutting-edge technology, localised production and sustainable growth.

Together, our businesses drive impactful, scalable solutions aligned with a cleaner, more efficient future`,
            isActive: true,
          });
        } else if (data.isActive === false) {
          // If explicitly inactive, use fallback
          console.log('About section is inactive, using fallback');
          setSection({
            title: 'About Us',
            content: `Refex Industries Limited is a dynamic, diversified enterprise with strategic interests in refrigerant gases, coal and ash management, power trading, clean mobility, and renewable energy. We are committed to sustainability, innovation, and long-term value creation across sectors critical to India's growth.

We specialize in eco-friendly refrigerant gas trading with multiple cylinder size options, offering reliable and sustainable cooling solutions. In the energy domain, Refex provides integrated services for responsible coal supply, handling and ash utilization. With a Category-I license for interstate power trading, we enable electricity transactions across the country.

Refex Green Mobility Limited, our clean mobility arm, offers four-wheeler vehicles running on clean fuel along with a technology-enabled platform and a professional driver partner to serve the corporates and demand aggregator platforms.

Our renewable energy subsidiary, Venwind , focuses on revolutionising wind energy manufacturing in India through cutting-edge technology, localised production and sustainable growth.

Together, our businesses drive impactful, scalable solutions aligned with a cleaner, more efficient future`,
            isActive: true,
          });
        } else {
          // Use the data from API
          console.log('Using about section data from API');
          setSection(data);
        }
      } catch (error) {
        console.error('Failed to fetch about section:', error);
        // Fallback to default data if API fails
        setSection({
          title: 'About Us',
          content: `Refex Industries Limited is a dynamic, diversified enterprise with strategic interests in refrigerant gases, coal and ash management, power trading, clean mobility, and renewable energy. We are committed to sustainability, innovation, and long-term value creation across sectors critical to India's growth.

We specialize in eco-friendly refrigerant gas trading with multiple cylinder size options, offering reliable and sustainable cooling solutions. In the energy domain, Refex provides integrated services for responsible coal supply, handling and ash utilization. With a Category-I license for interstate power trading, we enable electricity transactions across the country.

Refex Green Mobility Limited, our clean mobility arm, offers four-wheeler vehicles running on clean fuel along with a technology-enabled platform and a professional driver partner to serve the corporates and demand aggregator platforms.

Our renewable energy subsidiary, Venwind , focuses on revolutionising wind energy manufacturing in India through cutting-edge technology, localised production and sustainable growth.

Together, our businesses drive impactful, scalable solutions aligned with a cleaner, more efficient future`,
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchSection();
  }, []);

  if (loading) {
    return (
      <div className="py-12 bg-white">
<div className="max-w-[1100px] mx-auto px-6 text-center">
<div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Always show something, even if section is null (shouldn't happen due to fallback)
  if (!section) {
    return (
      <div className="py-12 bg-white">
<div className="max-w-[1100px] mx-auto px-6 text-center">
<div className="text-center mb-8">
            <h4 className="mb-6" style={{ fontSize: '34px', color: '#1f1f1f', lineHeight: '1.68', fontWeight: 600 }}>About Us</h4>
          </div>
          <div className="space-y-7 leading-8 text-[17px] text-center" style={{ color: '#484848' }}>
          <p>Refex Industries Limited is a dynamic, diversified enterprise with strategic interests in refrigerant gases, coal and ash management, power trading, clean mobility, and renewable energy. We are committed to sustainability, innovation, and long-term value creation across sectors critical to India's growth.</p>
          </div>
        </div>
      </div>
    );
  }

  // Split content by double line breaks to create paragraphs
  const paragraphs = section.content.split('\n\n').filter(p => p.trim());

  return (
    <div className="py-12 bg-white">
<div className="max-w-[1100px] mx-auto px-6 text-center">
        <div className="text-center mb-8">
          <h4 
            className="mb-6" 
            style={{ fontSize: '34px', color: '#1f1f1f', lineHeight: '1.68', fontWeight: 600 }}
          >
            {section.title}
          </h4>
        </div>
        <div className="space-y-7 leading-8 text-[17px] text-center" style={{ color: '#484848' }}>
        {paragraphs.map((paragraph, index) => (
            <p key={index}>
              {paragraph}
            </p>
          ))}
        </div>
      </div>
    </div>
  );
}
