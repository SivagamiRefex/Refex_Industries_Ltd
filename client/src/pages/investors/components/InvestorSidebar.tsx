import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { investorsCmsApi } from '../../../services/api';

interface RelatedLink {
  id?: number;
  name: string;
  href: string;
  displayOrder: number;
  isActive: boolean;
}

interface InvestorSidebarProps {
  currentPath: string;
}

export default function InvestorSidebar({ currentPath }: InvestorSidebarProps) {
  const [links, setLinks] = useState<RelatedLink[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadLinks();
  }, []);

  const loadLinks = async () => {
    try {
      setLoading(true);
      const allLinks: RelatedLink[] = [];
      
      // Load related links from CMS
      try {
        const linksData = await investorsCmsApi.getRelatedLinks();
        const activeLinks = (linksData || []).filter((link: RelatedLink) => link.isActive);
        allLinks.push(...activeLinks);
      } catch (err) {
        console.error('Failed to load related links:', err);
      }
      
      // Load pages from Investor Pages CMS and add them as links if not already present
      try {
        const pagesData = await investorsCmsApi.getAllPageContent();
        const activePages = (pagesData || []).filter((page: any) => page.isActive);
        
        activePages.forEach((page: any) => {
          const pageHref = `/investors/${page.slug}/`;
          // Check if link already exists
          const linkExists = allLinks.some(link => link.href === pageHref || link.href.replace(/\/$/, '') === pageHref.replace(/\/$/, ''));
          
          if (!linkExists) {
            allLinks.push({
              name: page.title,
              href: pageHref,
              displayOrder: allLinks.length,
              isActive: true,
            });
          }
        });
      } catch (err) {
        console.error('Failed to load investor pages:', err);
      }
      
      setLinks(allLinks);
    } catch (err) {
      console.error('Failed to load investor links:', err);
      setLinks([]);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="lg:col-span-3">
        <div className="bg-white shadow-sm">
          <div className="p-4 text-center text-gray-500">Loading...</div>
        </div>
      </div>
    );
  }

  const sortedLinks = [...links].sort((a, b) => (a.displayOrder || 0) - (b.displayOrder || 0));

  return (
    <div className="lg:col-span-3">
      <div className="bg-white shadow-sm">
        <nav className="space-y-0">
          {sortedLinks.map((link) => {
            // Extract slug from href (e.g., "/investors/financial-information/" -> "financial-information")
            const hrefPath = link.href.replace(/\/investors\//, '').replace(/\/$/, '');
            const currentSlug = currentPath.replace(/\/investors\//, '').replace(/\/$/, '');
            const isActive = hrefPath === currentSlug || link.href.replace(/\/$/, '') === currentPath.replace(/\/$/, '');
            
            // Use Link for React Router navigation if it's a dynamic route, otherwise use regular anchor
            const linkPath = hrefPath ? `/investors/${hrefPath}` : link.href;
            
            return (
              <Link
                key={link.id || link.name}
                to={linkPath}
                className={`block w-72 px-4 py-3 text-base transition-colors cursor-pointer  ${
                  isActive
                    ? 'bg-white text-[#61CE70]'
                    : 'bg-white text-[#1f1f1f] hover:text-[#61CE70]'
                }`}
              >
                {link.name}
              </Link>
            );
          })}
        </nav>
      </div>
    </div>
  );
}

