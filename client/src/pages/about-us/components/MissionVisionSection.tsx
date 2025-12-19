import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface VisionMission {
  id?: number;
  visionTitle: string;
  visionDescription?: string;
  visionImage?: string;
  missionTitle: string;
  missionImage?: string;
  missionPoints?: string[];
  isActive: boolean;
}

export default function MissionVisionSection() {
  const [vm, setVm] = useState<VisionMission | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchVisionMission = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getVisionMission();
        if (data && (data.isActive === true || data.isActive === undefined)) {
          setVm(data);
        } else {
          // Fallback to default if no active section
          setVm({
            visionTitle: 'Vision',
            visionDescription: 'Refex aims to be a globally admired conglomerate, driving long-term sustainable growth through innovation, purposeful collaborations and partnerships, and an unwavering commitment to excellence, while contributing meaningfully to societal progress',
            missionTitle: 'Mission',
            missionImage: '',
            visionImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/9e3a526ee87e445a5adad66c9b086662.png',
            missionPoints: [],
            isActive: true,
          });
        }
      } catch (error) {
        console.error('Failed to fetch vision & mission:', error);
        // Fallback to default data if API fails
        setVm({
          visionTitle: 'Vision',
          visionDescription: 'Refex aims to be a globally admired conglomerate, driving long-term sustainable growth through innovation, purposeful collaborations and partnerships, and an unwavering commitment to excellence, while contributing meaningfully to societal progress',
          missionTitle: 'Mission',
          missionImage: '',
          visionImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/9e3a526ee87e445a5adad66c9b086662.png',
          missionPoints: [],
          isActive: true,
        });
      } finally {
        setLoading(false);
      }
    };

    fetchVisionMission();
  }, []);

  if (loading) {
    return (
      <div id="mission-vision" className="py-16 relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-6 relative z-10">
          <div className="flex items-center justify-center py-20 gap-40">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-white"></div>
              <p className="mt-4 text-white">Loading...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Always show something, even if vm is null (shouldn't happen due to fallback)
  if (!vm) {
    return (
      <div id="mission-vision" className="py-16 relative overflow-hidden">
        <div 
          className="absolute inset-0 bg-cover bg-center"
          style={{
            backgroundImage: 'url(https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/9e3a526ee87e445a5adad66c9b086662.png)',
          }}
        ></div>
        <div className="max-w-7xl mx-auto px-6 relative z-10">
          <div className="flex flex-col md:flex-row gap-40 justify-between">
            <div className="bg-gray-800/20 p-8 flex-1">
              <div>
                <h3 className="font-bold text-white mb-4" style={{ fontSize: '40px' }}>Mission</h3>
                <p style={{ color: '#ffffff', fontSize: '17px' }}>
                  Refex shall create enduring value across industries through innovation, operational excellence, and sustainable practices, thereby empowering our customers, enriching our communities, and delivering responsible growth for all stakeholders
                </p>
              </div>
            </div>
            <div className="bg-gray-800/20 p-8 flex-1">
              <div>
                <h3 className="font-bold text-white mb-4" style={{ fontSize: '40px' }}>Vision</h3>
                <p style={{ color: '#ffffff', fontSize: '17px' }}>
                  Refex aims to be a globally admired conglomerate, driving long-term sustainable growth through innovation, purposeful collaborations and partnerships, and an unwavering commitment to excellence, while contributing meaningfully to societal progress
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Use visionImage as background (since model doesn't have separate backgroundImage field)
  const backgroundImage = vm.visionImage || vm.missionImage || '';

  return (
    <div id="mission-vision" className="py-16 relative overflow-hidden">
      {/* Background Image */}
      {backgroundImage && (
        <div 
          className="absolute inset-0 bg-cover bg-center"
          style={{
            backgroundImage: `url(${backgroundImage})`,
          }}
        ></div>
      )}

      <div className="max-w-7xl mx-auto px-6 relative z-10">
        <div className="flex flex-col md:flex-row gap-40 justify-between">
          {/* Mission */}
          <div 
            className="bg-gray-800/20 p-8 flex-1"
            data-aos="fade-right"
            data-aos-delay="100"
          >
            <div>
              <h3 className="font-bold text-white mb-4" style={{ fontSize: '40px' }}>{vm.missionTitle}</h3>
              {Array.isArray(vm.missionPoints) && vm.missionPoints.length > 0 ? (
                <ul className="space-y-2" style={{ color: '#ffffff', fontSize: '17px' }}>
                  {vm.missionPoints.map((point, index) => (
                    <li key={index} className="flex items-start">
                      <span className="mr-2">•</span>
                      <span>{point}</span>
                    </li>
                  ))}
                </ul>
              ) : (
                <p style={{ color: '#ffffff', fontSize: '17px' }}>
                  Refex shall create enduring value across industries through innovation, operational excellence, and sustainable practices, thereby empowering our customers, enriching our communities, and delivering responsible growth for all stakeholders
                </p>
              )}
            </div>
          </div>

          {/* Vision */}
          <div 
            className="bg-gray-800/20 p-8 flex-1"
            data-aos="fade-left"
            data-aos-delay="200"
          >
            <div>
              <h3 className="font-bold text-white mb-4" style={{ fontSize: '40px' }}>{vm.visionTitle}</h3>
              {vm.visionDescription ? (
                <p style={{ color: '#ffffff', fontSize: '17px' }}>
                  {vm.visionDescription}
                </p>
              ) : (
                <p style={{ color: '#ffffff', fontSize: '17px' }}>
                  Refex aims to be a globally admired conglomerate, driving long-term sustainable growth through innovation, purposeful collaborations and partnerships, and an unwavering commitment to excellence, while contributing meaningfully to societal progress
                </p>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
