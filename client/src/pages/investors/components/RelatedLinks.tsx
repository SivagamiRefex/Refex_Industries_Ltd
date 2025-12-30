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

interface KeyPersonnel {
  id?: number;
  name: string;
  position?: string;
  company?: string;
  address?: string;
  address2?: string;
  address3?: string;
  phone?: string;
  email?: string;
  displayOrder: number;
  isActive: boolean;
}

// Fallback data
const fallbackLinks: RelatedLink[] = [
  { name: 'Key Managerial Personnel', href: '/investors/key-managerial-personnel/', displayOrder: 0, isActive: true },
  { name: 'Financial Information', href: '/investors/financial-information/', displayOrder: 1, isActive: true },
  { name: 'Annual Reports', href: '/investors/annual-reports/', displayOrder: 2, isActive: true },
  { name: 'General Meeting Updates', href: '/investors/general-meeting-updates/', displayOrder: 3, isActive: true },
  { name: 'Investor Presentation', href: '/investors/investor-presentation/', displayOrder: 4, isActive: true },
  { name: 'Code of fair Disclosure UPSI', href: '/investors/code-of-fair-disclosure-upsi/', displayOrder: 5, isActive: true },
  { name: 'Policies', href: '/investors/policies/', displayOrder: 6, isActive: true },
  { name: 'Credit Ratings', href: '/investors/credit-ratings/', displayOrder: 7, isActive: true },
  { name: 'Recording & Transcripts of Post Earnings / Quarterly Calls', href: '/investors/recording-transcripts-of-post-earnings-quarterly-calls/', displayOrder: 8, isActive: true },
  { name: 'Disclosure of Material Events or Information', href: '/investors/disclosure-of-material-events-or-information/', displayOrder: 9, isActive: true },
  { name: 'Stock Exchange Quarterly Compliance', href: '/investors/stock-exchange-quarterly-compliance/', displayOrder: 10, isActive: true },
  { name: 'Familiarization Programme for Independent Directors', href: '/investors/familiarization-programme-for-independent-directors/', displayOrder: 11, isActive: true },
  { name: 'Terms and Conditions of Appointment of ID', href: '/investors/terms-and-conditions-of-appointment-of-id/', displayOrder: 12, isActive: true },
  { name: 'IPO', href: '/investors/ipo/', displayOrder: 13, isActive: true },
  { name: 'Rights Issue', href: '/investors/rights-issue/', displayOrder: 14, isActive: true },
  { name: 'Financial Statement of Subsidiary', href: '/investors/financial-statement-of-subsidiary/', displayOrder: 15, isActive: true },
  { name: 'Annual Return', href: '/investors/annual-return/', displayOrder: 16, isActive: true },
  { name: 'Book Closure of Members Register / Record Date', href: '/investors/book-closure-of-members-register-record-date/', displayOrder: 17, isActive: true },
  { name: 'Secretarial Compliance Report', href: '/investors/secretarial-compliance-report/', displayOrder: 18, isActive: true },
  { name: 'Investor Information', href: '/investors/investor-information/', displayOrder: 19, isActive: true },
  { name: 'Registrar & Transfer Agent', href: '/investors/registrar-transfer-agent/', displayOrder: 20, isActive: true },
  { name: 'Newspaper Publication', href: '/investors/newspaper-publication/', displayOrder: 21, isActive: true },
  { name: 'Unpaid Dividend List and IEPF Shares', href: '/investors/unpaid-dividend-list-and-iepf-shares/', displayOrder: 22, isActive: true },
  { name: 'Disclosures under SAST Regulations 2011', href: '/investors/disclosures-under-sast-regulations-2011/', displayOrder: 23, isActive: true },
  { name: 'Employee Stock Option Scheme', href: '/investors/employee-stock-option-scheme/', displayOrder: 24, isActive: true },
  { name: 'Monitoring Agency Report', href: '/investors/monitoring-agency-report/', displayOrder: 25, isActive: true },
  { name: 'Statement of Deviation', href: '/investors/statement-of-deviation/', displayOrder: 26, isActive: true },
  { name: 'CSR Activities', href: '/investors/csr-activities/', displayOrder: 27, isActive: true },
  { name: 'Charter Documents', href: '/investors/charter-documents/', displayOrder: 28, isActive: true },
  { name: 'Scheme of Amalgamation / Arrangement', href: '/investors/scheme-of-amalgamation-arrangement/', displayOrder: 29, isActive: true },
];

const fallbackPersonnel: KeyPersonnel[] = [
  {
    name: 'Mr. Anil Jain',
    position: 'Managing Director',
    company: 'Refex Industries Limited',
    phone: '+91-44 – 3504 0050',
    displayOrder: 0,
    isActive: true,
  },
  {
    name: 'Mr. Dinesh Kumar Agarwal',
    position: 'Whole-time Director & Chief Financial Officer',
    company: 'Refex Industries Limited',
    phone: '+91-44 – 3504 0050',
    displayOrder: 1,
    isActive: true,
  },
  {
    name: 'Mr. Ankit Poddar',
    position: 'Company Secretary / Compliance Officer',
    company: 'Refex Industries Limited,',
    address: '2nd Floor, No.313, Refex Towers, Sterling Road,',
    address2: 'Valluvar Kottam High Road, Nungambakkam,',
    address3: 'Chennai – 600034, Tamil Nadu.',
    phone: '+91-44 – 3504 0050',
    email: 'investor.relations@refex.co.in',
    displayOrder: 2,
    isActive: true,
  },
];

export default function RelatedLinks() {
  const [sectionTitle, setSectionTitle] = useState('Related Links');
  const [investorLinks, setInvestorLinks] = useState<RelatedLink[]>([]);
  const [keyPersonnel, setKeyPersonnel] = useState<KeyPersonnel[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      setLoading(true);
      
      // Load section settings
      try {
        const sectionData = await investorsCmsApi.getRelatedLinksSection();
        if (sectionData && sectionData.isActive) {
          setSectionTitle(sectionData.title || 'Related Links');
        }
      } catch (err) {
        console.error('Failed to load section settings:', err);
      }

      // Load links
      try {
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
            const linkExists = allLinks.some(link => {
              const linkHref = link.href.replace(/\/$/, '');
              const pageHrefNormalized = pageHref.replace(/\/$/, '');
              return linkHref === pageHrefNormalized;
            });
            
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
        
        setInvestorLinks(allLinks.length > 0 ? allLinks : fallbackLinks);
      } catch (err) {
        console.error('Failed to load links:', err);
        setInvestorLinks(fallbackLinks);
      }

      // Load personnel
      try {
        const personnelData = await investorsCmsApi.getKeyPersonnel();
        const activePersonnel = (personnelData || []).filter((person: KeyPersonnel) => person.isActive);
        setKeyPersonnel(activePersonnel.length > 0 ? activePersonnel : fallbackPersonnel);
      } catch (err) {
        console.error('Failed to load personnel:', err);
        setKeyPersonnel(fallbackPersonnel);
      }
    } catch (err) {
      console.error('Failed to load related links data:', err);
      setInvestorLinks(fallbackLinks);
      setKeyPersonnel(fallbackPersonnel);
    } finally {
      setLoading(false);
    }
  };
  if (loading) {
    return (
      <section className="py-16 bg-[#f1f1f1]" id="investor-compliance">
        <div className="max-w-7xl mx-auto px-6">
          <div className="flex items-center justify-center py-12">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-[#7cd244]"></div>
              <p className="mt-4 text-gray-600">Loading related links...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  // Sort links and personnel by displayOrder
  const sortedLinks = [...investorLinks].sort((a, b) => (a.displayOrder || 0) - (b.displayOrder || 0));
  const sortedPersonnel = [...keyPersonnel].sort((a, b) => (a.displayOrder || 0) - (b.displayOrder || 0));

  return (
    <section className="py-16 bg-[#f1f1f1]" id="investor-compliance">
      <div className="max-w-7xl mx-auto px-6">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold text-black">
            {sectionTitle}
          </h2>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
          {/* Left Sidebar - Links */}
          <div className="lg:col-span-4">
            <div className="bg-white shadow-sm p-6">
              <nav className="space-y-1">
                {sortedLinks.map((link, index) => {
                  // Extract slug from href for React Router navigation
                  const hrefPath = link.href.replace(/\/investors\//, '').replace(/\/$/, '');
                  const linkPath = hrefPath ? `/investors/${hrefPath}` : link.href;
                  
                  return (
                    <Link
                      key={link.id || index}
                      to={linkPath}
                      className="block px-4 py-3 text -[#1f1f1f] hover:text-[#61CE70] transition-colors cursor-pointer text-base border-b-2 border-transparent hover:border-[#61CE70]"
                    >
                      {link.name}
                    </Link>
                  );
                })}
              </nav>
            </div>
          </div>

          {/* Right Content - Key Personnel */}
          <div className="lg:col-span-8">
            <div className="grid grid-cols-1 gap-6">
              {sortedPersonnel.map((person, index) => (
                <div key={person.id || index} className="bg-white shadow-sm p-8">
                  <div className="text-left">
                    <h3 className="text-xl font-bold text-gray-900 mb-2">{person.name}</h3>
                    {person.position && <p className="text-gray-600 mb-1">{person.position}</p>}
                    {person.company && <p className="text-gray-600 mb-3">{person.company}</p>}
                    {(person.address || person.address2 || person.address3) && (
                      <>
                        {person.address && <p className="text-gray-600">{person.address}</p>}
                        {person.address2 && <p className="text-gray-600">{person.address2}</p>}
                        {person.address3 && <p className="text-gray-600 mb-3">{person.address3}</p>}
                      </>
                    )}
                    {person.phone && (
                      <p className="text-gray-700">
                        Phone: <a href={`tel:${person.phone.replace(/[^0-9+]/g, '')}`} className="text-gray-700 hover:text-[#7cd244] transition-colors cursor-pointer">{person.phone}</a>
                      </p>
                    )}
                    {person.email && (
                      <p className="text-gray-700">
                        Email: <a href={`mailto:${person.email}`} className="text-gray-700 hover:text-[#7cd244] transition-colors cursor-pointer">{person.email}</a>
                      </p>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
