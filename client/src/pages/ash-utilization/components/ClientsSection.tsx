import { useEffect, useRef, useState } from 'react';
import { ashUtilizationCmsApi } from '../../../services/api';

interface Client {
  id: number;
  category: 'thermal' | 'cement' | 'concessionaires';
  image: string;
  order: number;
  isActive: boolean;
}

function ClientsSection() {
  const thermalRef = useRef<HTMLDivElement>(null);
  const cementRef = useRef<HTMLDivElement>(null);
  const concessionairesRef = useRef<HTMLDivElement>(null);

  const [clients, setClients] = useState<Client[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchClients = async () => {
      try {
        setLoading(true);
        const data = await ashUtilizationCmsApi.getClients();
        const activeClients = (data || []).filter((item: Client) => item.isActive);
        setClients(activeClients);
      } catch (error) {
        console.error('Failed to fetch clients:', error);
        // Fallback to default data if API fails
        setClients([
          // Thermal clients
          { id: 1, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client12.jpg', order: 1, isActive: true },
          { id: 2, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2025/02/thermal-client02.jpg', order: 2, isActive: true },
          { id: 3, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2025/02/thermal-client05.jpg', order: 3, isActive: true },
          { id: 4, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client13.jpg', order: 4, isActive: true },
          { id: 5, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2025/02/thermal-client03.jpg', order: 5, isActive: true },
          { id: 6, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2025/02/thermal-client01.jpg', order: 6, isActive: true },
          { id: 7, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2025/02/thermal-client10.jpg', order: 7, isActive: true },
          { id: 8, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2025/02/thermal-client04.jpg', order: 8, isActive: true },
          { id: 9, category: 'thermal', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client14.jpg', order: 9, isActive: true },
          // Cement clients
          { id: 10, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client01.jpg', order: 1, isActive: true },
          { id: 11, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client06.jpg', order: 2, isActive: true },
          { id: 12, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2025/02/ash-client021.jpg', order: 3, isActive: true },
          { id: 13, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2025/02/ash-client031.jpg', order: 4, isActive: true },
          { id: 14, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client03.jpg', order: 5, isActive: true },
          { id: 15, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client08.jpg', order: 6, isActive: true },
          { id: 16, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client04.jpg', order: 7, isActive: true },
          { id: 17, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client07.jpg', order: 8, isActive: true },
          { id: 18, category: 'cement', image: 'https://refex.co.in/wp-content/uploads/2024/12/ash-client09.jpg', order: 9, isActive: true },
          // Concessionaires clients
          { id: 19, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client01-1.jpg', order: 1, isActive: true },
          { id: 20, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client01.jpg', order: 2, isActive: true },
          { id: 21, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/construction-client01.jpg', order: 3, isActive: true },
          { id: 22, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client02.jpg', order: 4, isActive: true },
          { id: 23, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/construction-client02.jpg', order: 5, isActive: true },
          { id: 24, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client02-1.jpg', order: 6, isActive: true },
          { id: 25, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client03.jpg', order: 7, isActive: true },
          { id: 26, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client05.jpg', order: 8, isActive: true },
          { id: 27, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/construction-client03.jpg', order: 9, isActive: true },
          { id: 28, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client04.jpg', order: 10, isActive: true },
          { id: 29, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client06.jpg', order: 11, isActive: true },
          { id: 30, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/construction-client04.jpg', order: 12, isActive: true },
          { id: 31, category: 'concessionaires', image: 'https://refex.co.in/wp-content/uploads/2025/02/road-client03-1.jpg', order: 13, isActive: true },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchClients();
  }, []);

  const thermalClients = clients
    .filter(c => c.category === 'thermal')
    .sort((a, b) => (a.order || 0) - (b.order || 0))
    .map(c => c.image);

  const cementClients = clients
    .filter(c => c.category === 'cement')
    .sort((a, b) => (a.order || 0) - (b.order || 0))
    .map(c => c.image);

  const concessionairesClients = clients
    .filter(c => c.category === 'concessionaires')
    .sort((a, b) => (a.order || 0) - (b.order || 0))
    .map(c => c.image);

  useEffect(() => {
    if (loading || (thermalClients.length === 0 && cementClients.length === 0 && concessionairesClients.length === 0)) {
      return;
    }

    const scrollers = [
      { ref: thermalRef, speed: 1, clients: thermalClients },
      { ref: cementRef, speed: 1, clients: cementClients },
      { ref: concessionairesRef, speed: 1, clients: concessionairesClients }
    ];

    const animationFrameIds: number[] = [];

    scrollers.forEach(({ ref, speed, clients }) => {
      if (clients.length === 0) return;
      
      const animate = () => {
        if (ref.current) {
          ref.current.scrollLeft += speed;
          if (ref.current.scrollLeft >= ref.current.scrollWidth / 2) {
            ref.current.scrollLeft = 0;
          }
          const frameId = requestAnimationFrame(animate);
          animationFrameIds.push(frameId);
        }
      };
      
      if (ref.current) {
        const frameId = requestAnimationFrame(animate);
        animationFrameIds.push(frameId);
      }
    });

    return () => {
      animationFrameIds.forEach(frameId => {
        cancelAnimationFrame(frameId);
      });
    };
  }, [loading, thermalClients.length, cementClients.length, concessionairesClients.length]);

  const ClientMarquee = ({ clients, scrollRef }: { 
    clients: string[], 
    scrollRef: React.RefObject<HTMLDivElement | null> 
  }) => (
    <div className="overflow-hidden">
      <div
        ref={scrollRef}
        className="flex gap-8 overflow-x-hidden"
        style={{ scrollBehavior: 'auto' }}
      >
        {[...clients, ...clients].map((client, index) => (
          <div
            key={`${client}-${index}`}
            className="flex-shrink-0 w-48 h-32 flex items-center justify-center p-4"
          >
            <img
              src={client}
              alt={`Client ${index + 1}`}
              className="max-w-full max-h-full object-contain"
              onError={(e) => {
                const target = e.target as HTMLImageElement;
                target.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHZpZXdCb3g9IjAgMCA0OCA0OCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4IiBmaWxsPSIjRjNGNEY2Ii8+CjxwYXRoIGQ9Ik0yNCAzMkMxOS41ODE3IDMyIDE2IDI4LjQxODMgMTYgMjRDMTAgMTkuNTgxNyAxOS41ODE3IDE2IDI0IDE2QzI4LjQxODMgMTYgMzIgMTkuNTgxNyAzMiAyNEMzMiAyOC40MTgzIDI4LjQxODMgMzIgMjQgMzJaIiBmaWxsPSIjOUI5QjlBIi8+Cjwvc3ZnPgo=';
              }}
            />
          </div>
        ))}
      </div>
    </div>
  );

  if (loading) {
    return (
      <div className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-12">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading clients...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (thermalClients.length === 0 && cementClients.length === 0 && concessionairesClients.length === 0) {
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
            OUR CLIENTELE
          </h2>
        </div>

        <div className="space-y-16">
          {/* Thermal Power Plant */}
          {thermalClients.length > 0 && (
            <div data-aos="fade-up" data-aos-delay="100">
              <h5 className="text-2xl font-bold text-center text-gray-900 mb-8">
                Thermal Power Plant
              </h5>
              <ClientMarquee clients={thermalClients} scrollRef={thermalRef} />
            </div>
          )}

          {/* Cement Companies */}
          {cementClients.length > 0 && (
            <div data-aos="fade-up" data-aos-delay="200">
              <h5 className="text-2xl font-bold text-center text-gray-900 mb-8">
                Cement Companies
              </h5>
              <ClientMarquee clients={cementClients} scrollRef={cementRef} />
            </div>
          )}

          {/* Concessionaires */}
          {concessionairesClients.length > 0 && (
            <div data-aos="fade-up" data-aos-delay="300">
              <h5 className="text-2xl font-bold text-center text-gray-900 mb-8">
                Concessionaires
              </h5>
              <ClientMarquee clients={concessionairesClients} scrollRef={concessionairesRef} />
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default ClientsSection;
