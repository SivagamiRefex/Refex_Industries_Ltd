import { useState, useEffect, useRef } from 'react';
import { headerCmsApi, stockApi } from '../../../services/api';

interface NavigationItem {
  name: string;
  href: string;
  dropdown?: Array<{
    name: string;
    href: string;
    hasSubmenu?: boolean;
    submenu?: Array<{ name: string; href: string }>;
  }>;
}

interface HeaderData {
  logoUrl?: string;
  logoAlt?: string;
  showStockInfo?: boolean;
  bsePrice?: string;
  bseChange?: string;
  bseChangeIndicator?: 'up' | 'down';
  nsePrice?: string;
  nseChange?: string;
  nseChangeIndicator?: 'up' | 'down';
  navigationItems?: NavigationItem[];
  contactButtonText?: string;
  contactButtonHref?: string;
  isActive?: boolean;
}

// Default values
const defaultNavItems: NavigationItem[] = [
  { 
    name: 'Home', 
    href: '/',
    dropdown: []
  },
  { 
    name: 'About Us', 
    href: '/about-us',
    dropdown: [
      { name: 'Vision & Mission', href: '/about-us#mission-vision' },
      { name: 'Core Values', href: '/about-us#core-values' },
      { name: 'Board Members', href: '/about-us#board-members' },
      { name: 'Our Presence', href: '/about-us#our-presence' },
      { name: 'Diversity & Inclusion', href: 'https://www.refex.group/diversity-inclusion/' },
      { name: 'Newsroom', href: '/newsroom/' },
      { name: 'Gallery', href: 'https://www.refex.group/gallery/' },
      { name: 'Careers', href: 'https://www.refex.group/careers/' },
    ]
  },
  { 
    name: 'Business', 
    href: '#business',
    dropdown: [
      { name: 'Ash Utilization and Coal Handling', href: '/ash-utilization' },
      { name: 'Green Mobility', href: '/green-mobility' },
      { name: 'Venwind Refex', href: '/venwind-refex' },
      { name: 'Refrigerant Gas', href: '/refrigerant-gas' },
    ]
  },
  { 
    name: 'Investors', 
    href: '/investors',
    dropdown: [
      { name: 'Smart ODR', href: '#', hasSubmenu: true, submenu: [
        { name: 'SEBI Circular or ODR', href: 'https://www.sebi.gov.in/legal/master-circulars/aug-2023/online-resolution-of-disputes-in-the-indian-securities-market_75220.html' },
        { name: 'Online Dispute Resolution', href: '/uploads/pdfs/Online-Resolution-Of-Disputes.pdf' },
        { name: 'Link to Smart ODR', href: 'https://smartodr.in/login' },
      ]},
    ]
  },
  { 
    name: 'ESG', 
    href: '/esg',
    dropdown: []
  },
];

export default function Header() {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [openDropdown, setOpenDropdown] = useState<string | null>(null);
  const [headerData, setHeaderData] = useState<HeaderData | null>(null);
  const stockIntervalRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    const fetchHeaderData = async () => {
      try {
        const data = await headerCmsApi.get();
        if (data && data.isActive !== false) {
          setHeaderData(data);
        }
      } catch (error) {
        console.error('Failed to fetch header data from CMS:', error);
        // Use default values on error
      }
    };
    fetchHeaderData();
  }, []);

  // Fetch stock prices every 30 seconds when header data is loaded
  useEffect(() => {
    // Only fetch if header data is loaded and stock info is enabled
    if (!headerData || headerData.showStockInfo === false) {
      // Clear interval if stock info is disabled
      if (stockIntervalRef.current) {
        clearInterval(stockIntervalRef.current);
        stockIntervalRef.current = null;
      }
      return;
    }

    // If interval is already set up, don't create another one
    if (stockIntervalRef.current) {
      return;
    }

    const fetchStockPrices = async () => {
      try {
        const stockData = await stockApi.getStockPriceFromExternal();
        
        // Log the full response for debugging
        console.log('=== Stock API Response ===');
        console.log('Full Response:', JSON.stringify(stockData, null, 2));
        console.log('Timestamp:', new Date().toISOString());
        
        // Log specific values for easy comparison
        if (stockData?.nse_data) {
          console.log('NSE Values:', {
            price: stockData.nse_data.price,
            index: stockData.nse_data.index,
            overall_index: stockData.nse_data.overall_index
          });
        }
        if (stockData?.bse_data) {
          console.log('BSE Values:', {
            price: stockData.bse_data.price,
            index: stockData.bse_data.index,
            overall_index: stockData.bse_data.overall_index
          });
        }
        console.log('==========================');
        
        if (!stockData) {
          console.warn('Stock API returned empty response');
          return;
        }
        
        setHeaderData((prevData) => {
          if (!prevData) {
            console.warn('No previous header data to update');
            return prevData;
          }
          
          const updated = { ...prevData };
          let hasUpdates = false;
          
          // Extract data - handle different wrapper formats
          let data = stockData;
          if (stockData.data) {
            data = stockData.data;
          }
          
          // Parse BSE data - looking for bse_data structure
          const bseData = data.bse_data || data.bseData || data.BSE || data.bse;
          if (bseData && bseData.price !== undefined) {
            // Extract price
            const bsePrice = typeof bseData.price === 'number' ? bseData.price.toFixed(2) : String(bseData.price);
            updated.bsePrice = bsePrice;
            hasUpdates = true;
            console.log('BSE Price updated:', bsePrice);
            
            // Extract overall_index value (this is the change percentage)
            if (bseData.overall_index !== undefined && bseData.overall_index !== null) {
              const rawIndex = bseData.overall_index;
              const indexStr = String(rawIndex);
              
              // Log the raw value received from API
              console.log('BSE Raw Overall Index from API:', rawIndex, 'Type:', typeof rawIndex);
              
              // Format: ensure it has % sign if not present
              const formattedIndex = indexStr.includes('%') ? indexStr : `${indexStr}%`;
              updated.bseChange = formattedIndex;
              
              // Determine indicator: positive (+) = up, negative (-) = down
              const isPositive = indexStr.trim().startsWith('+') || (parseFloat(indexStr) > 0);
              updated.bseChangeIndicator = isPositive ? 'up' : 'down';
              hasUpdates = true;
              console.log('BSE Overall Index updated:', formattedIndex, 'Indicator:', updated.bseChangeIndicator, 'Timestamp:', new Date().toISOString());
            } else {
              console.warn('BSE overall_index field not found in response. Available keys:', Object.keys(bseData));
            }
          }
          
          // Parse NSE data - looking for nse_data structure
          const nseData = data.nse_data || data.nseData || data.NSE || data.nse;
          if (nseData && nseData.price !== undefined) {
            // Extract price
            const nsePrice = typeof nseData.price === 'number' ? nseData.price.toFixed(2) : String(nseData.price);
            updated.nsePrice = nsePrice;
            hasUpdates = true;
            console.log('NSE Price updated:', nsePrice);
            
            // Extract overall_index value (this is the change percentage)
            if (nseData.overall_index !== undefined && nseData.overall_index !== null) {
              const rawIndex = nseData.overall_index;
              const indexStr = String(rawIndex);
              
              // Log the raw value received from API
              console.log('NSE Raw Overall Index from API:', rawIndex, 'Type:', typeof rawIndex);
              
              // Format: ensure it has % sign if not present
              const formattedIndex = indexStr.includes('%') ? indexStr : `${indexStr}%`;
              updated.nseChange = formattedIndex;
              
              // Determine indicator: positive (+) = up, negative (-) = down
              const isPositive = indexStr.trim().startsWith('+') || (parseFloat(indexStr) > 0);
              updated.nseChangeIndicator = isPositive ? 'up' : 'down';
              hasUpdates = true;
              console.log('NSE Overall Index updated:', formattedIndex, 'Indicator:', updated.nseChangeIndicator, 'Timestamp:', new Date().toISOString());
            } else {
              console.warn('NSE overall_index field not found in response. Available keys:', Object.keys(nseData));
            }
          }
          
          if (hasUpdates) {
            console.log('=== Stock Prices Updated Successfully ===');
            console.log('BSE:', { 
              price: updated.bsePrice, 
              change: updated.bseChange, 
              indicator: updated.bseChangeIndicator 
            });
            console.log('NSE:', { 
              price: updated.nsePrice, 
              change: updated.nseChange, 
              indicator: updated.nseChangeIndicator 
            });
            console.log('Update Timestamp:', new Date().toISOString());
            console.log('==========================================');
          } else {
            console.warn('No stock price updates made. Check API response format.');
            console.log('Full response structure:', JSON.stringify(data, null, 2));
          }
          
          return updated;
        });
      } catch (error: any) {
        console.error('Failed to fetch stock prices:', error);
        console.error('Error details:', error.message, error.stack);
        // Silently fail - don't update if API fails
      }
    };

    // Fetch immediately on mount
    fetchStockPrices();
    
    // Set up interval to fetch every 30 seconds
    stockIntervalRef.current = setInterval(() => {
      fetchStockPrices();
    }, 30000); // 30 seconds = 30000 milliseconds

    // Cleanup interval on unmount
    return () => {
      if (stockIntervalRef.current) {
        clearInterval(stockIntervalRef.current);
        stockIntervalRef.current = null;
      }
    };
  }, [headerData?.showStockInfo]); // Re-run when headerData first loads or stock info visibility changes

  const handleSectionClick = (e: React.MouseEvent<HTMLAnchorElement>, href: string) => {
    if (href.includes('#')) {
      e.preventDefault();
      const hash = href.split('#')[1];
      const element = document.getElementById(hash);
      
      if (element) {
        const offset = 220;
        const elementPosition = element.getBoundingClientRect().top + window.pageYOffset;
        const offsetPosition = elementPosition - offset;
        
        window.scrollTo({
          top: offsetPosition,
          behavior: 'smooth'
        });
      }
    }
  };

  // Use CMS data or fallback to defaults
  const navItems = (headerData?.navigationItems && headerData.navigationItems.length > 0) 
    ? headerData.navigationItems 
    : defaultNavItems;
  
  const logoUrl = headerData?.logoUrl || "https://refex.co.in/wp-content/uploads/2024/07/logo-refex.svg";
  const logoAlt = headerData?.logoAlt || "Refex Industries Limited";
  const showStockInfo = headerData?.showStockInfo !== false;
  const bsePrice = headerData?.bsePrice || "";
  const bseChange = headerData?.bseChange || "";
  const bseChangeIndicator = headerData?.bseChangeIndicator || "down";
  const nsePrice = headerData?.nsePrice || "";
  const nseChange = headerData?.nseChange || "";
  const nseChangeIndicator = headerData?.nseChangeIndicator || "down";
  const contactButtonText = headerData?.contactButtonText || "Contact Us";
  const contactButtonHref = headerData?.contactButtonHref || "/contact/";

  // Helper function to render navigation items
  const renderDesktopNav = () => {
    return navItems.map((item) => {
      if (item.dropdown && item.dropdown.length > 0) {
        return (
          <div key={item.name} className="relative group">
            <a 
              href={item.href}
              className="hover:text-[#7cd244] transition-colors font-medium flex items-center gap-1 cursor-pointer"
              style={{ color: '#000000' }}
            >
              {item.name}
              <i className="ri-arrow-down-s-line text-xs text-[#7cd244]"></i>
            </a>
            <div className="absolute top-full left-0 mt-2 w-56 bg-white shadow-lg rounded-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50">
              {item.dropdown.map((dropItem) => {
                if (dropItem.hasSubmenu && dropItem.submenu) {
                  return (
                    <div key={dropItem.name} className="relative group/submenu">
                      <div className="px-6 py-3 hover:bg-gray-50 hover:text-[#7cd244] transition-colors cursor-pointer flex items-center justify-between font-semibold"
                        style={{ color: '#000000' }}
                      >
                        {dropItem.name}
                        <i className="ri-arrow-right-s-line"></i>
                      </div>
                      <div className="absolute left-full top-0 ml-1 w-64 bg-white shadow-lg rounded-lg opacity-0 invisible group-hover/submenu:opacity-100 group-hover/submenu:visible transition-all duration-300 z-50">
                        {dropItem.submenu.map((subItem) => (
                          <a
                            key={subItem.name}
                            href={subItem.href}
                            target={subItem.href.startsWith('http') ? '_blank' : undefined}
                            rel={subItem.href.startsWith('http') ? 'noopener noreferrer' : undefined}
                            className="block px-6 py-3 hover:bg-gray-50 hover:text-[#7cd244] transition-colors cursor-pointer font-semibold"
                            style={{ color: '#000000' }}
                          >
                            {subItem.name}
                          </a>
                        ))}
                      </div>
                    </div>
                  );
                }
                return (
                  <a
                    key={dropItem.name}
                    href={dropItem.href}
                    target={dropItem.href.startsWith('http') ? '_blank' : undefined}
                    rel={dropItem.href.startsWith('http') ? 'noopener noreferrer' : undefined}
                    className="block px-6 py-3 hover:bg-gray-50 hover:text-[#7cd244] transition-colors cursor-pointer font-semibold"
                    style={{ color: '#000000' }}
                  >
                    {dropItem.name}
                  </a>
                );
              })}
            </div>
          </div>
        );
      }
      return (
        <a
          key={item.name}
          href={item.href}
          className="hover:text-[#7cd244] transition-colors font-medium cursor-pointer"
          style={{ color: '#000000' }}
        >
          {item.name}
        </a>
      );
    });
  };

  return (
    <header
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 bg-white shadow-sm`}
      style={{ paddingBottom: '28px' }}
    >
      {/* Top Bar with Stock Info */}
  

      {/* Main Header */}
      <div className="max-w-7xl mx-auto px-6">
        <div className="flex items-center justify-between h-20">
          {/* Logo - Left - Vertically Centered in Full Header Height */}
          <div className="flex items-center justify-center h-20">
            <a href="/" className="cursor-pointer flex items-center justify-center h-full">
              <img 
                src={logoUrl} 
                alt={logoAlt} 
                className="h-full object-contain"
                style={{ maxHeight: '70px' }}
              />
            </a>
          </div>
           <div>
           {showStockInfo && (
        <div className="bg-white border-b border-gray-200">
          <div className="max-w-7xl mx-auto ">
            <div className="flex  gap-6 h-9 text-xs">
              {bsePrice && (
                <div className="flex items-center gap-1.5">
                  <span className="text-gray-800">BSE</span>
                  <i 
                    className={`ri-arrow-${bseChangeIndicator === 'up' ? 'up' : 'down'}-line text-sm`}
                    style={{ color: bseChangeIndicator === 'up' ? '#008000' : '#dc2626' }}
                  ></i>
                  <span 
                    className="font-medium"
                    style={{ color: bseChangeIndicator === 'up' ? '#008000' : '#dc2626' }}
                  >
                    ₹ {bsePrice} ({bseChange})
                  </span>
                </div>
              )}
              {nsePrice && (
                <div className="flex items-center gap-1.5">
                  <span className="text-gray-800">NSE</span>
                  <i 
                    className={`ri-arrow-${nseChangeIndicator === 'up' ? 'up' : 'down'}-line text-sm`}
                    style={{ color: nseChangeIndicator === 'up' ? '#008000' : '#dc2626' }}
                  ></i>
                  <span 
                    className="font-medium"
                    style={{ color: nseChangeIndicator === 'up' ? '#008000' : '#dc2626' }}
                  >
                    ₹ {nsePrice} ({nseChange})
                  </span>
                </div>
              )}
            </div>
          </div>
        </div>
      )}
         <nav className="hidden lg:flex items-center space-x-8 mt-5">
            {renderDesktopNav()}
          </nav>
           </div>

          {/* Desktop Navigation - Centered */}
        

          <div className="hidden lg:flex items-center" style={{ marginTop: '55px' }}>
  <a
    href={contactButtonHref}
    className="
      relative
      text-[#7cd244]
      border border-[#7cd244]
      text-sm font-medium
      px-6 py-2.5
      rounded-full
      overflow-hidden
      cursor-pointer
      whitespace-nowrap
      inline-flex items-center gap-2
      group
      transition-colors
    "
  >
    {/* Background Animation */}
    <span
      className="
        absolute inset-0
        bg-[#7cd244]
        w-0
        group-hover:w-full
        transition-all duration-500
        rounded-full
      "
    ></span>

    {/* Text + Arrow */}
    <span className="relative z-10 group-hover:text-white transition-colors duration-300">
      {contactButtonText}
    </span>

    <i className="ri-arrow-right-line relative z-10 text-base group-hover:translate-x-1 group-hover:text-white transition-all duration-300"></i>
  </a>
</div>
          {/* Mobile Menu Button */}
          <button
  onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
  className="lg:hidden p-2 cursor-pointer text-gray-800 hover:bg-[#7cd244]/20 rounded-md transition-colors"
  aria-label="Toggle menu"
>
  <i className={`ri-${isMobileMenuOpen ? 'close' : 'menu'}-line text-2xl`}></i>
</button>
        </div>
      </div>

      {/* Mobile Menu */}
      {isMobileMenuOpen && (
        <div className="lg:hidden bg-white border-t">
          <nav className="w-full px-6 py-4 flex flex-col gap-2">
            {navItems.map((item) => (
              <div key={item.name}>
                <div className="flex items-center justify-between">
                  <a
                    href={item.href}
                    className="font-medium hover:text-[#7cd244] transition-colors py-2 flex-1 cursor-pointer"
                    style={{ color: '#000000' }}
                    onClick={() => {
                      setIsMobileMenuOpen(false);
                    }}
                  >
                    {item.name}
                  </a>
                  {item.dropdown && item.dropdown.length > 0 && (
                    <button
                      onClick={(e) => {
                        e.preventDefault();
                        setOpenDropdown(openDropdown === item.name ? null : item.name);
                      }}
                      className="p-2 hover:text-[#7cd244] transition-colors"
                      style={{ color: '#000000' }}
                      aria-label="Toggle dropdown"
                    >
                      <i className={`ri-arrow-${openDropdown === item.name ? 'up' : 'down'}-s-line text-lg`}></i>
                    </button>
                  )}
                </div>
                {item.dropdown && item.dropdown.length > 0 && openDropdown === item.name && (
                  <div className="pl-4 mt-2 space-y-2 bg-gray-50 py-2 rounded">
                    {item.dropdown.map((dropItem: any) => (
                      <div key={dropItem.name}>
                        {dropItem.hasSubmenu ? (
                          <>
                            <button
                              onClick={() => setOpenDropdown(openDropdown === 'Smart ODR' ? item.name : 'Smart ODR')}
                              className="w-full text-left text-sm hover:text-[#7cd244] transition-colors py-1.5 cursor-pointer flex items-center justify-between font-semibold"
                              style={{ color: '#000000' }}
                            >
                              {dropItem.name}
                              <i className={`ri-arrow-${openDropdown === 'Smart ODR' ? 'up' : 'down'}-s-line text-base`}></i>
                            </button>
                            {openDropdown === 'Smart ODR' && dropItem.submenu && (
                              <div className="pl-4 mt-2 space-y-2">
                                {dropItem.submenu.map((subItem: any) => (
                                  <a
                                    key={subItem.name}
                                    href={subItem.href}
                                    onClick={() => setIsMobileMenuOpen(false)}
                                    className="block text-sm hover:text-[#7cd244] transition-colors py-1.5 cursor-pointer font-semibold"
                                    style={{ color: '#000000' }}
                                    {...(subItem.href.startsWith('http') && { target: '_blank', rel: 'noopener noreferrer' })}
                                  >
                                    {subItem.name}
                                  </a>
                                ))}
                              </div>
                            )}
                          </>
                        ) : (
                          <a
                            href={dropItem.href}
                            onClick={(e) => {
                              handleSectionClick(e, dropItem.href);
                              setIsMobileMenuOpen(false);
                            }}
                            className="block text-sm hover:text-[#7cd244] transition-colors py-1.5 cursor-pointer font-semibold"
                            style={{ color: '#000000' }}
                            {...(dropItem.href.startsWith('http') && { target: '_blank', rel: 'noopener noreferrer' })}
                          >
                            {dropItem.name}
                          </a>
                        )}
                      </div>
                    ))}
                  </div>
                )}
              </div>
            ))}
            <a
              href={contactButtonHref}
              className="bg-[#7cd244] text-white text-sm font-medium px-6 py-2.5 rounded-full hover:bg-[#6db038] transition-colors cursor-pointer text-center mt-2 whitespace-nowrap"
              onClick={() => setIsMobileMenuOpen(false)}
            >
              {contactButtonText}
            </a>
          </nav>
        </div>
      )}
    </header>
  );
}
