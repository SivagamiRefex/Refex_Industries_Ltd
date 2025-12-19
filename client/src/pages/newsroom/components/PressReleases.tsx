import { useState, useEffect } from 'react';
import { newsroomCmsApi } from '../../../services/api';

interface PressRelease {
  id: number;
  title: string;
  date: string;
  source: string;
  image: string;
  link: string;
  isVideo?: boolean;
  order: number;
  isActive: boolean;
}

export default function PressReleases() {
  const [pressReleases, setPressReleases] = useState<PressRelease[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [sortOrder, setSortOrder] = useState<'desc' | 'asc'>('desc');
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 6;

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackReleases: PressRelease[] = [
      {
        id: 1,
        title: 'Dinesh Agarwal, CEO of Refex Group, on ET Now',
        date: 'November 11, 2025',
        source: 'ET NOW',
        image: 'https://refex.co.in/wp-content/uploads/2025/11/newsroom-thumbnail-video.jpg',
        link: 'https://www.youtube.com/watch?v=vyiEp-hzhqU',
        isVideo: true,
        order: 1,
        isActive: true,
      },
      {
        id: 2,
        title: 'Refex reports PBT at 30 crore in Q1 FY24',
        date: 'August 4, 2023',
        source: 'The Times of India',
        image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/f083fd9c51a4b154ca0967ca2ad3b996.jpeg',
        link: 'https://timesofindia.indiatimes.com/city/chennai/refex-reports-pbt-at-30-crore-in-q1-fy24/articleshow/102408182.cms?from=mdr',
        order: 2,
        isActive: true,
      },
      {
        id: 3,
        title: 'Refex Mobility expands operations to Delhi NCR',
        date: 'November 11, 2025',
        source: 'ET AUTO',
        image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/2675d7edc8e086e4c4be378eba93a660.jpeg',
        link: 'https://auto.economictimes.indiatimes.com/news/aftermarket/refex-eveelz-rebrands-as-refex-mobility-to-consolidate-focus-on-existing-tier-1-market/123237339',
        order: 3,
        isActive: true,
      },
      {
        id: 4,
        title: 'Refex eVeelz rebrands as Refex Mobility; to consolidate focus on existing Tier-1 market',
        date: 'March 27, 2025',
        source: 'ANI',
        image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/d674bfc0dcb4ffb4355d91b67e0eb3b3.jpeg',
        link: 'https://www.aninews.in/news/business/refex-group-is-the-official-sponsor-of-chennai-super-kings20250327190124/',
        order: 4,
        isActive: true,
      },
      {
        id: 5,
        title: 'Refex Group is the Official Sponsor of Chennai Super Kings',
        date: 'March 11, 2025',
        source: 'The Hindu',
        image: 'https://refex.co.in/wp-content/uploads/2025/07/press-release02.jpg',
        link: 'https://www.thehindu.com/sci-tech/technology/uber-partners-with-chennai-based-refex-green-mobility-to-deploy-1000-evs-across-cities/article69316319.ece',
        order: 5,
        isActive: true,
      },
      {
        id: 6,
        title: 'Refex Group Strengthens Leadership in Sustainability at UNGCNI Annual Convention 2025',
        date: 'February 15, 2025',
        source: 'ANI',
        image: 'https://refex.co.in/wp-content/uploads/2025/07/press-release04.jpg',
        link: 'https://www.aninews.in/news/business/refex-group-strengthens-leadership-in-sustainability-at-ungcni-annual-convention-202520250215101613/',
        order: 6,
        isActive: true,
      },
    ];

    try {
      setLoading(true);
      const data = await newsroomCmsApi.getPressReleases();
      const activeReleases = (data || [])
        .filter((release: PressRelease) => release.isActive)
        .sort((a: PressRelease, b: PressRelease) => {
          // Sort by order first, then by date descending
          if (a.order !== b.order) {
            return a.order - b.order;
          }
          const dateA = new Date(a.date).getTime();
          const dateB = new Date(b.date).getTime();
          return dateB - dateA;
        });
      
      if (activeReleases.length === 0) {
        setPressReleases(fallbackReleases);
      } else {
        setPressReleases(activeReleases);
      }
    } catch (error) {
      console.error('Failed to fetch press releases:', error);
      // Fallback to default data on error
      setPressReleases(fallbackReleases);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center py-20">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
          <p className="mt-4 text-gray-600">Loading press releases...</p>
        </div>
      </div>
    );
  }

  // Filter and sort
  const filteredReleases = pressReleases
    .filter((release) =>
      release.title.toLowerCase().includes(searchTerm.toLowerCase())
    )
    .sort((a, b) => {
      const dateA = new Date(a.date).getTime();
      const dateB = new Date(b.date).getTime();
      return sortOrder === 'desc' ? dateB - dateA : dateA - dateB;
    });

  // Pagination
  const totalPages = Math.ceil(filteredReleases.length / itemsPerPage);
  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  const currentReleases = filteredReleases.slice(startIndex, endIndex);

  return (
    <div>
      {/* Filter Bar */}
      <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4 mb-8 bg-gray-50 p-6 rounded-lg">
        <p className="text-gray-700 text-sm font-medium">
          Displaying {startIndex + 1} - {Math.min(endIndex, filteredReleases.length)} of {filteredReleases.length} press releases
        </p>
        <div className="flex flex-col sm:flex-row gap-4 w-full md:w-auto">
          <input
            type="text"
            placeholder="Search by title"
            value={searchTerm}
            onChange={(e) => {
              setSearchTerm(e.target.value);
              setCurrentPage(1);
            }}
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

      {/* Press Releases Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
        {currentReleases.map((release) => (
          <div key={release.id} className="group cursor-pointer">
            <a href={release.link} target="_blank" rel="noopener noreferrer" className="block">
              {/* Image Container */}
              <div className="relative overflow-hidden mb-4" style={{ width: '330px', height: '300px' }}>
                <img
                  src={release.image}
                  alt={release.title}
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                />
                {/* Overlay */}
                <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent"></div>
                
                {/* Title Overlay */}
                <div className="absolute bottom-0 left-0 right-0 p-6">
                  <h5 className="text-white text-[20px] font-bold mb-3 line-clamp-2">
                    {release.title}
                  </h5>
                  <span className="inline-block text-[#ffffff] text-[16px] font-semibold hover:underline">
                    Continue Reading
                  </span>
                </div>
              </div>

              {/* Date and Source */}
              <div className="flex flex-col gap-1">
                <p className="text-[#484848] text-[16px]">{release.date}</p>
                <p className="text-[#7cbf43] text-[14px] font-bold uppercase">{release.source}</p>
              </div>
            </a>
          </div>
        ))}
      </div>

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2">
          {currentPage > 1 && (
            <button
              onClick={() => setCurrentPage(currentPage - 1)}
              className="px-4 py-2 text-sm bg-[#7dc144] text-white hover:opacity-90 transition-all cursor-pointer rounded"
            >
              « Previous
            </button>
          )}
          
          {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
            <button
              key={page}
              onClick={() => setCurrentPage(page)}
              className={`w-10 h-10 rounded-md text-sm font-medium transition-all cursor-pointer ${
                currentPage === page
                  ? 'bg-[#7dc244] text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              {page}
            </button>
          ))}
          
          {currentPage < totalPages && (
            <button
              onClick={() => setCurrentPage(currentPage + 1)}
              className="px-4 py-2 text-sm bg-[#7dc144] text-white hover:opacity-90 transition-all cursor-pointer rounded"
            >
              Next »
            </button>
          )}
        </div>
      )}
    </div>
  );
}
