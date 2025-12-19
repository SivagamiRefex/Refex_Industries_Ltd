import { useState, useEffect } from 'react';
import { newsroomCmsApi } from '../../../services/api';

interface Event {
  id: number;
  title: string;
  date: string;
  source: string;
  image: string;
  link: string;
  category: string;
  order: number;
  isActive: boolean;
}

export default function Events() {
  const [events, setEvents] = useState<Event[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [sortOrder, setSortOrder] = useState<'desc' | 'asc'>('desc');

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackEvents: Event[] = [
      {
        id: 1,
        title: "Refex Gheun Tak – A Women's Ultimate Frisbee Tournament",
        date: 'January 25, 2023',
        source: 'Times of India',
        image: 'https://refex.co.in/wp-content/uploads/2023/02/Refex-Gheun-Tak-A-Womenss-Ultimate-Frisbee-Tournament.jpg',
        link: 'https://businessnewsthisweek.com/business/team-meraki-wins-refex-gheun-tak-a-womens-ultimate-frisbee-tournament/',
        category: 'Frisbee Tournament',
        order: 1,
        isActive: true,
      },
      {
        id: 2,
        title: 'Refex Group Road Safety Awareness event',
        date: 'January 11, 2023',
        source: 'Events',
        image: 'https://refex.co.in/wp-content/uploads/2023/01/Refex-Group-Road-Safety-Awareness-event.jpg',
        link: 'https://navjeevanexpress.com/csr-initiative-refex-group-kick-starts-road-safety-campaign-on-anna-salai-in-chennai/',
        category: 'Awareness event',
        order: 2,
        isActive: true,
      },
    ];

    try {
      setLoading(true);
      const data = await newsroomCmsApi.getEvents();
      const activeEvents = (data || [])
        .filter((event: Event) => event.isActive)
        .sort((a: Event, b: Event) => {
          // Sort by order first, then by date descending
          if (a.order !== b.order) {
            return a.order - b.order;
          }
          const dateA = new Date(a.date).getTime();
          const dateB = new Date(b.date).getTime();
          return dateB - dateA;
        });
      
      if (activeEvents.length === 0) {
        setEvents(fallbackEvents);
      } else {
        setEvents(activeEvents);
      }
    } catch (error) {
      console.error('Failed to fetch events:', error);
      // Fallback to default data on error
      setEvents(fallbackEvents);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center py-20">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
          <p className="mt-4 text-gray-600">Loading events...</p>
        </div>
      </div>
    );
  }

  // Filter and sort
  const filteredEvents = events
    .filter((event) =>
      event.title.toLowerCase().includes(searchTerm.toLowerCase())
    )
    .sort((a, b) => {
      const dateA = new Date(a.date).getTime();
      const dateB = new Date(b.date).getTime();
      return sortOrder === 'desc' ? dateB - dateA : dateA - dateB;
    });

  return (
    <div>
      {/* Filter Bar */}
      <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4 mb-8 bg-gray-50 p-6 rounded-lg">
        <p className="text-gray-700 text-sm font-medium">
          Displaying 1 - {filteredEvents.length} of {filteredEvents.length} events
        </p>
        <div className="flex flex-col sm:flex-row gap-4 w-full md:w-auto">
          <input
            type="text"
            placeholder="Search by title"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="px-4 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-[#7dc244] focus:border-transparent w-full sm:w-64"
          />
          <select
            value={sortOrder}
            onChange={(e) => setSortOrder(e.target.value as 'desc' | 'asc')}
            className="px-4 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-[#7dc244] focus:border-transparent cursor-pointer pr-8 w-full sm:w-auto"
          >
            <option value="desc">Date (Newest)</option>
            <option value="asc">Date (Oldest)</option>
          </select>
        </div>
      </div>

      {/* Events Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        {filteredEvents.map((event) => (
          <div key={event.id} className="group cursor-pointer">
            <a href={event.link} target="_blank" rel="noopener noreferrer" className="block">
              {/* Image Container */}
              <div className="relative overflow-hidden mb-4" style={{ width: '330px', height: '300px' }}>
                <img
                  src={event.image}
                  alt={event.title}
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                />
                {/* Overlay */}
                <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent"></div>
                
                {/* Category Badge */}
                <div className="absolute top-4 left-4">
                  <span className="bg-white text-black text-[18px] font-bold px-3 py-1 rounded uppercase">
                    {event.category}
                  </span>
                </div>

                {/* Title Overlay */}
                <div className="absolute bottom-0 left-0 right-0 p-6">
                  <h5 className="text-white text-[20px] font-bold mb-3 line-clamp-2">
                    {event.title}
                  </h5>
                  <span className="inline-block text-[#74FF00] text-[16px] font-semibold underline">
                    Continue Reading
                  </span>
                </div>
              </div>

              {/* Date and Source */}
              <div className="flex flex-col gap-1">
                <p className="text-[#484848] text-[16px]">{event.date}</p>
                <p className="text-[#7cbf43] text-[14px] font-bold uppercase">{event.source}</p>
              </div>
            </a>
          </div>
        ))}
      </div>
    </div>
  );
}
