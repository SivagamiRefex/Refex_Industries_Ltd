import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';
import { getPlaceholderImage } from '../../../utils/placeholder';

interface ValueItem {
  id: number;
  letter?: string;
  title: string;
  description: string;
  image?: string;
  icon?: string;
  color?: string;
  order: number;
  isActive: boolean;
}

export default function CoreValuesSection() {
  const [values, setValues] = useState<ValueItem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchValues = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getValues();
        const activeValues = (data || [])
          .filter((item: ValueItem) => item.isActive)
          .sort((a: ValueItem, b: ValueItem) => (a.order || 0) - (b.order || 0));
        setValues(activeValues);
      } catch (error) {
        console.error('Failed to fetch core values:', error);
        // Fallback to default data if API fails
        setValues([
          {
            id: 1,
            letter: 'P',
            title: 'Principled Excellence',
            description: "Doing what's right, with integrity and intention",
            image: 'https://refex.co.in/wp-content/uploads/2024/11/our-values05.jpg',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            letter: 'A',
            title: 'Authenticity',
            description: 'Bringing your true self to work, and honouring that in others.',
            image: 'https://refex.co.in/wp-content/uploads/2025/06/our-values032.jpg',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            letter: 'C',
            title: 'Customer Value',
            description: 'Keeping our customers at the heart of everything we do.',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/our-values01.jpg',
            order: 3,
            isActive: true,
          },
          {
            id: 4,
            letter: 'E',
            title: 'Esteem Culture',
            description: 'Fostering a workplace where respect, dignity, and belonging are everyday experiences.',
            image: 'https://refex.co.in/wp-content/uploads/2024/11/our-values02.jpg',
            order: 4,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchValues();
  }, []);

  if (loading) {
    return (
      <div id="core-values" className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-6">
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

  if (values.length === 0) {
    return null;
  }

  return (
    <div id="core-values" className="py-16 bg-white">
      <div className="max-w-7xl mx-auto px-6">
        <div className="text-center mb-12">
          <h4 
            style={{ fontSize: '34px', color: '#1f1f1f', fontWeight: 600, lineHeight: '1.68' }}
          >
            CORE VALUES
          </h4>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {values.map((value) => (
            <div 
              key={value.id} 
              className="group cursor-pointer bg-white shadow-lg overflow-hidden"
            >
              {/* Background Image */}
              <div className="relative h-64 overflow-hidden">
                <img 
                  src={value.image} 
                  alt={value.title}
                  className="w-full h-full object-cover"
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = getPlaceholderImage(400, 256, 'No Image');
                  }}
                />
              </div>
              
              {/* Content Below Image */}
              <div className="p-6 ">
                {/* Title */}
                <h3 className="text-xl font-bold mb-3" style={{ fontSize: '18px', color: '#1f1f1f' }}>{value.title }</h3>
                
                {/* Letter Between Title and Description */}
                {value.letter && (
                  <div className="text-5xl font-bold my-4" style={{ fontSize: '52px', color: '#1f1f1f' }} 
                  >{value.letter}</div>
                )}
                
                {/* Description */}
                <p className="text-sm leading-relaxed" style={{ fontSize: '17px', color: '#1f1f1f' }}>{value.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
