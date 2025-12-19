import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface NavItem {
  id: number;
  name: string;
  href: string;
  sectionId: string;
  order: number;
  isActive: boolean;
}

export default function StickyNav() {
  const [isSticky, setIsSticky] = useState(false);
  const [activeTab, setActiveTab] = useState<string>('');
  const [navItems, setNavItems] = useState<NavItem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchNavItems = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getStickyNavItems();
        const activeItems = (data || [])
          .filter((item: NavItem) => item.isActive)
          .sort((a: NavItem, b: NavItem) => (a.order || 0) - (b.order || 0));
        setNavItems(activeItems);
        
        // Set initial active tab to first item
        if (activeItems.length > 0) {
          setActiveTab(activeItems[0].sectionId);
        }
      } catch (error) {
        console.error('Failed to fetch sticky nav items:', error);
        // Fallback to default data if API fails
        setNavItems([
          {
            id: 1,
            name: 'Mission & Vision',
            href: '#mission-vision',
            sectionId: 'mission-vision',
            order: 1,
            isActive: true,
          },
          {
            id: 2,
            name: 'Core Values',
            href: '#core-values',
            sectionId: 'core-values',
            order: 2,
            isActive: true,
          },
          {
            id: 3,
            name: 'Board Members',
            href: '#board-members',
            sectionId: 'board-members',
            order: 3,
            isActive: true,
          },
          {
            id: 4,
            name: 'Our Presence',
            href: '#our-presence',
            sectionId: 'our-presence',
            order: 4,
            isActive: true,
          },
        ]);
        setActiveTab('mission-vision');
      } finally {
        setLoading(false);
      }
    };

    fetchNavItems();
  }, []);

  useEffect(() => {
    if (navItems.length === 0) return;

    let scrollTimeout: NodeJS.Timeout;

    const handleScroll = () => {
      setIsSticky(window.scrollY > 300);

      // Clear any existing timeout
      clearTimeout(scrollTimeout);

      // Determine active section based on scroll position
      // Only activate when section title is in view (entered the section)
      const sections = navItems.map(item => item.sectionId);
      let foundActive = false;
      
      for (const section of sections) {
        const element = document.getElementById(section);
        if (element) {
          const rect = element.getBoundingClientRect();
          // Check if section title is in viewport (between 100px and 350px from top)
          // This ensures the title is visible and we've entered the section
          if (rect.top <= 350 && rect.top >= 100 && rect.bottom >= 150) {
            setActiveTab(section);
            foundActive = true;
            break;
          }
        }
      }
      
      // If no section title is in view (scrolling between sections), 
      // wait a moment then clear active state to show white text with no underline
      if (!foundActive) {
        scrollTimeout = setTimeout(() => {
          setActiveTab('');
        }, 300); // Wait 300ms after scrolling stops before clearing
      }
    };
    
    // Initial check
    handleScroll();
    
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => {
      window.removeEventListener('scroll', handleScroll);
      clearTimeout(scrollTimeout);
    };
  }, [navItems]);

  // Show loading state but don't hide completely
  if (loading) {
    return (
      <div className="bg-[#7dc244] border-b border-[#6db038]">
        <div className="w-full px-6">
          <nav className="flex items-center justify-end gap-8 h-14">
            <div className="text-white text-sm">Loading navigation...</div>
          </nav>
        </div>
      </div>
    );
  }

  // If no nav items, show empty nav bar (don't hide completely)
  if (navItems.length === 0) {
    return (
      <div className="bg-[#7dc244] border-b border-[#6db038]">
        <div className="w-full px-6">
          <nav className="flex items-center justify-end gap-8 h-14">
            {/* Empty navigation */}
          </nav>
        </div>
      </div>
    );
  }

  return (
    <div className={`bg-[#7dc244] border-b border-[#6db038] transition-all duration-300 ${isSticky ? 'fixed top-[108px] left-0 right-0 z-40 shadow-md' : ''}`}>
      <div className="w-full px-6">
        <nav className="flex items-center justify-end gap-8 h-14">
          {navItems.map((item) => (
            <a
              key={item.id}
              href={item.href}
              onClick={() => setActiveTab(item.sectionId)}
              className={`relative text-base font-normal transition-colors cursor-pointer whitespace-nowrap pb-1 ${
                activeTab === item.sectionId 
                  ? 'text-black after:absolute after:bottom-0 after:left-0 after:right-0 after:h-0.5 after:bg-black' 
                  : 'text-white hover:text-black hover:after:absolute hover:after:bottom-0 hover:after:left-0 hover:after:right-0 hover:after:h-0.5 hover:after:bg-black'
              }`}
            >
              {item.name}
            </a>
          ))}
        </nav>
      </div>
    </div>
  );
}
