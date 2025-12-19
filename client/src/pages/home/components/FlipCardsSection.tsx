import { useState, useEffect } from 'react';
import { homeCmsApi } from '../../../services/api';

interface FlipCard {
  id: number;
  title: string;
  description: string;
  image: string;
  backImage: string;
  link: string;
  order: number;
  isActive: boolean;
}

export default function FlipCardsSection() {
  const [flippedCard, setFlippedCard] = useState<number | null>(null);
  const [cards, setCards] = useState<FlipCard[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCards = async () => {
      try {
        setLoading(true);
        const data = await homeCmsApi.getFlipCards();
        const activeCards = (data || [])
          .filter((card: FlipCard) => card.isActive)
          .sort((a: FlipCard, b: FlipCard) => (a.order || 0) - (b.order || 0));
        setCards(activeCards);
      } catch (error) {
        console.error('Failed to fetch flip cards:', error);
        // Fallback to default data if API fails
        setCards([
          {
            id: 1,
            title: 'Sustainability & ESG',
            description: 'Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png',
            backImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png',
            link: '/esg/',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            title: 'Investors',
            description: 'Explore our financial reports, stock information, investor presentations, and key announcements to learn more about how we\'re building a future-focused business.',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/857fbfe05f675330f7e584bf0ab44ecc.png',
            backImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/4fdca67bdfb39a83d2b83210bb1b5cf3.png',
            link: '/investors/',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            title: 'Life At Refex',
            description: 'Empowering people, celebrating diversity, and creating a culture where everyone feels valued.',
            image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/8818c5d55c5844bdefd4f3d1721b90ed.png',
            backImage: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/c46bbd8b593bd9cb6b8790cb61632cd7.png',
            link: 'https://www.refex.group/careers/',
            order: 3,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchCards();
  }, []);

  if (loading) {
    return (
      <section className="py-12 lg:py-16 bg-[#f7f7f7]">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading flip cards...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (cards.length === 0) {
    return null;
  }

  return (
    <section className="py-12 lg:py-16 bg-[#f7f7f7]">
      <div className="max-w-7xl mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {cards.map((card, index) => (
            <div
              key={index}
              className="relative h-96 perspective-1000 cursor-pointer"
              onMouseEnter={() => setFlippedCard(index)}
              onMouseLeave={() => setFlippedCard(null)}
            >
              <div
                className={`relative w-full h-full transition-transform duration-700 transform-style-3d ${
                  flippedCard === index ? 'rotate-x-180' : ''
                }`}
              >
                {/* Front */}
                <div className="absolute inset-0 backface-hidden overflow-hidden shadow-lg">
                  <img
                    src={card.image}
                    alt={card.title}
                    className="w-full h-full object-cover"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent flex items-center justify-center">
                    <div className="p-6 text-center">
                      <h3 className="text-2xl font-bold text-white">{card.title}</h3>
                    </div>
                  </div>
                </div>

                {/* Back */}
                <div className="absolute inset-0 backface-hidden rotate-x-180 bg-primary shadow-lg overflow-hidden">
                  {card.backImage && (
                    <img
                      src={card.backImage}
                      alt={card.title}
                      className="absolute inset-0 w-full h-full object-cover"
                    />
                  )}
                  <div className={`relative h-full p-8 flex flex-col justify-between ${card.backImage ? (index === 1 ? '' : '') : 'bg-primary'}`}>
                    <div>
                      <h3 className="text-2xl font-bold text-white mb-4 text-center">{card.title}</h3>
                      <p className="text-white/90 text-sm leading-relaxed">{card.description}</p>
                    </div>
                    <div className="flex justify-center">
                      <a
                        href={card.link}
                        className="inline-flex items-center justify-center w-32 px-4 py-2 rounded-full text-white font-semibold transition-all cursor-pointer whitespace-nowrap text-sm border-2 border-white hover:bg-[#7cd144] hover:border-[#7cd144]"
                      >
                        Read More
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      <style>{`
        .perspective-1000 {
          perspective: 1000px;
        }
        .transform-style-3d {
          transform-style: preserve-3d;
        }
        .backface-hidden {
          backface-visibility: hidden;
        }
        .rotate-x-180 {
          transform: rotateX(180deg);
        }
      `}</style>
    </section>
  );
}
