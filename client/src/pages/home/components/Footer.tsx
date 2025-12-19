import { useState, useEffect } from 'react';
import { footerCmsApi } from '../../../services/api';

interface FooterLink {
  name: string;
  href: string;
  target?: string;
}

interface FooterSection {
  title: string;
  links: FooterLink[];
  subsections?: Array<{
    title: string;
    links: FooterLink[];
  }>;
}

interface SocialLink {
  platform: string;
  url: string;
  icon: string;
}

interface FooterData {
  sections?: FooterSection[];
  socialLinks?: SocialLink[];
  contactEmail?: string;
  cin?: string;
  nseScripCode?: string;
  bseScripSymbol?: string;
  isin?: string;
  complaintsTitle?: string;
  complaintsPhone?: string;
  complaintsPhoneUrl?: string;
  complaintsEmail?: string;
  copyrightText?: string;
  copyrightLink?: string;
  copyrightLinkText?: string;
  bottomLinks?: FooterLink[];
  backgroundImage?: string;
  backgroundImageOpacity?: number;
  isActive?: boolean;
}

// Default footer data
function getDefaultFooterData(): FooterData {
  return {
    sections: [
      {
        title: 'About Us',
        links: [
          { name: 'Core Values', href: '/about-us#core-values' },
          { name: 'Our Presence', href: '/about-us#our-presence' },
          { name: 'Diversity & Inclusion', href: 'https://www.refex.group/diversity-inclusion/', target: '_blank' },
          { name: 'Newsroom', href: '/newsroom/' },
          { name: 'Gallery', href: 'https://www.refex.group/gallery/', target: '_blank' },
          { name: 'Careers', href: 'https://www.refex.group/careers/', target: '_blank' },
          { name: 'ESOP Testimonials', href: 'https://www.refex.group/careers/?slide=3', target: '_blank' },
        ],
      },
      {
        title: 'Business',
        links: [
          { name: 'Ash Utilization and Coal Handling', href: '/ash-utilization/' },
          { name: 'Green Mobility', href: '/green-mobility/' },
          { name: 'Venwind Refex', href: '/venwind-refex/' },
          { name: 'Refrigerant Gas', href: '/refrigerant-gas/' },
        ],
      },
      {
        title: 'Sustainability',
        links: [
          { name: 'Refex on ESG', href: '/esg/#refex-esg' },
          { name: 'ESG Policies', href: '/esg/#esg-policies' },
        ],
      },
      {
        title: 'Investors',
        links: [
          { name: 'Financial Results', href: '/investors/financial-information/' },
          { name: 'Annual Reports', href: '/investors/annual-reports/' },
          { name: 'Notice of Board Meetings', href: '/investors/general-meeting-updates/' },
          { name: 'Policies', href: '/investors/policies/' },
          { name: 'Credit Ratings', href: '/investors/credit-ratings/' },
          { name: 'Investor Information', href: '/investors/investor-information/' },
          { name: 'Newspaper Publication', href: '/investors/newspaper-publication/' },
        ],
      },
    ],
    socialLinks: [
      { platform: 'Facebook', url: 'https://www.facebook.com/refexindustrieslimited/', icon: 'ri-facebook-fill' },
      { platform: 'Twitter/X', url: 'https://x.com/GroupRefex', icon: 'ri-twitter-x-fill' },
      { platform: 'YouTube', url: 'https://www.youtube.com/@refexgroup', icon: 'ri-youtube-fill' },
      { platform: 'LinkedIn', url: 'https://www.linkedin.com/company/refex-group/', icon: 'ri-linkedin-fill' },
      { platform: 'Instagram', url: 'https://www.instagram.com/refexgroup/', icon: 'ri-instagram-fill' },
    ],
    contactEmail: 'investor.relations@refex.co.in',
    cin: 'L45200TN2002PLC049601',
    nseScripCode: 'REFEX',
    bseScripSymbol: '532884',
    isin: 'INE056I01025',
    complaintsTitle: 'For any Complaints',
    complaintsPhone: '+91 96297 38734',
    complaintsPhoneUrl: 'https://web.whatsapp.com/',
    complaintsEmail: 'refexcares@refex.co.in',
    copyrightText: `© ${new Date().getFullYear()}`,
    copyrightLink: 'https://refex.co.in/#',
    copyrightLinkText: 'Refex Industries',
    bottomLinks: [
      { name: 'Privacy Policy', href: '/privacy-policy' },
      { name: 'Terms of Use', href: '/terms-of-use' },
    ],
    isActive: true,
  };
}

export default function Footer() {
  const [footerData, setFooterData] = useState<FooterData | null>(null);

  useEffect(() => {
    const fetchFooterData = async () => {
      try {
        const data = await footerCmsApi.get();
        if (data && data.isActive !== false) {
          setFooterData(data);
        } else {
          setFooterData(getDefaultFooterData());
        }
      } catch (error) {
        console.error('Failed to fetch footer data from CMS:', error);
        setFooterData(getDefaultFooterData());
      }
    };
    fetchFooterData();
  }, []);

  // Use CMS data or fallback to defaults
  const sections = footerData?.sections && footerData.sections.length > 0 
    ? footerData.sections 
    : getDefaultFooterData().sections || [];
  
  const socialLinks = footerData?.socialLinks && footerData.socialLinks.length > 0
    ? footerData.socialLinks
    : getDefaultFooterData().socialLinks || [];

  const contactEmail = footerData?.contactEmail || getDefaultFooterData().contactEmail || '';
  const cin = footerData?.cin || getDefaultFooterData().cin || '';
  const nseScripCode = footerData?.nseScripCode || getDefaultFooterData().nseScripCode || '';
  const bseScripSymbol = footerData?.bseScripSymbol || getDefaultFooterData().bseScripSymbol || '';
  const isin = footerData?.isin || getDefaultFooterData().isin || '';
  const complaintsTitle = footerData?.complaintsTitle || getDefaultFooterData().complaintsTitle || '';
  const complaintsPhone = footerData?.complaintsPhone || getDefaultFooterData().complaintsPhone || '';
  const complaintsPhoneUrl = footerData?.complaintsPhoneUrl || getDefaultFooterData().complaintsPhoneUrl || '';
  const complaintsEmail = footerData?.complaintsEmail || getDefaultFooterData().complaintsEmail || '';
  const copyrightText = footerData?.copyrightText || getDefaultFooterData().copyrightText || '';
  const copyrightLink = footerData?.copyrightLink || getDefaultFooterData().copyrightLink || '';
  const copyrightLinkText = footerData?.copyrightLinkText || getDefaultFooterData().copyrightLinkText || '';
  const bottomLinks = footerData?.bottomLinks && footerData.bottomLinks.length > 0
    ? footerData.bottomLinks
    : getDefaultFooterData().bottomLinks || [];

  const backgroundImage = footerData?.backgroundImage || null;
  const backgroundImageOpacity = footerData?.backgroundImageOpacity !== undefined 
    ? footerData.backgroundImageOpacity 
    : 0.1;

  return (
    <footer className="bg-gray-900 text-white relative overflow-hidden">
      {/* Background Image */}
      {backgroundImage && (
        <div 
          className="absolute inset-0 bg-cover bg-center bg-no-repeat"
          style={{
            backgroundImage: `url("${backgroundImage}")`,
            opacity: backgroundImageOpacity,
          }}
        ></div>
      )}
      {/* Content */}
      <div className="relative z-10 max-w-7xl mx-auto px-4 py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-12 mb-12 items-start">
          {/* Render Sections */}
          {sections.map((section, sectionIndex) => (
            <div key={sectionIndex} className="flex flex-col">
              <h3 className="text-[20px] font-bold mb-6 h-[28px] flex items-center">{section.title}</h3>
              <ul className="space-y-3">
                {section.links.map((link, linkIndex) => (
                  <li key={linkIndex}>
                    <a
                      href={link.href}
                      {...(link.target && { target: link.target, rel: 'noopener noreferrer' })}
                      className="text-[#d0d6df] hover:text-[#7cd144] transition-colors duration-300 cursor-pointer inline-block group"
                    >
                      <span className="inline-flex items-center group-hover:translate-x-[6px] transition-transform duration-300">
                        <i className="ri-arrow-right-line mr-0 opacity-0 group-hover:mr-2 group-hover:opacity-100 transition-all duration-300 text-[#7cd144] w-0 group-hover:w-auto overflow-hidden"></i>
                        <span>{link.name}</span>
                      </span>
                    </a>
                  </li>
                ))}
              </ul>
              {/* Render Subsections (for backward compatibility) */}
              {section.subsections && section.subsections.length > 0 && (
                <>
                  <div className="border-t border-gray-700 py-2.5 mt-[30px] mb-0"></div>
                  {section.subsections.map((subsection, subsectionIndex) => (
                    <div key={subsectionIndex} className="mt-0">
                      <h3 className="text-[20px] font-bold mb-6 h-[28px] flex items-center">{subsection.title}</h3>
                      <ul className="space-y-3">
                        {subsection.links.map((link, linkIndex) => (
                          <li key={linkIndex}>
                            <a
                              href={link.href}
                              {...(link.target && { target: link.target, rel: 'noopener noreferrer' })}
                              className="text-[#d0d6df] hover:text-[#7cd144] transition-colors duration-300 cursor-pointer inline-block group"
                            >
                              <span className="inline-flex items-center group-hover:translate-x-[6px] transition-transform duration-300">
                                <i className="ri-arrow-right-line mr-0 opacity-0 group-hover:mr-2 group-hover:opacity-100 transition-all duration-300 text-[#7cd144] w-0 group-hover:w-auto overflow-hidden"></i>
                                <span>{link.name}</span>
                              </span>
                            </a>
                          </li>
                        ))}
                      </ul>
                    </div>
                  ))}
                </>
              )}
            </div>
          ))}

          {/* Follow Us Section */}
          <div className="flex flex-col">
            <h3 className="text-[20px] font-bold mb-6 h-[28px] flex items-center text-[#ffffff]">Follow Us</h3>
            <div className="flex gap-4 mb-8">
              {socialLinks.map((social, index) => {
                // Get background color based on platform
                const getBgColor = (platform: string) => {
                  const platformLower = platform.toLowerCase();
                  if (platformLower.includes('facebook')) return 'bg-[#1877F2]';
                  if (platformLower.includes('twitter') || platformLower.includes('x')) return 'bg-black';
                  if (platformLower.includes('youtube')) return 'bg-[#FF0000]';
                  if (platformLower.includes('linkedin')) return 'bg-[#0077B5]';
                  if (platformLower.includes('instagram')) return 'bg-[#E4405F]';
                  return 'bg-gray-800';
                };

                return (
                  <a
                    key={index}
                    href={social.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className={`w-10 h-10 ${getBgColor(social.platform)} rounded flex items-center justify-center hover:opacity-80 transition-opacity cursor-pointer`}
                  >
                    <i className={`${social.icon} text-xl text-white`}></i>
                  </a>
                );
              })}
            </div>

            <div className="space-y-2 text-sm text-[#ffffff] mb-8">
              {contactEmail && (
                <p className="flex items-center">
                  <i className="ri-mail-line mr-2 text-[#7cd144]"></i>
                  {contactEmail}
                </p>
              )}
              {cin && <p>CIN: {cin}</p>}
              {nseScripCode && <p>NSE Scrip Code: {nseScripCode}</p>}
              {bseScripSymbol && <p>BSE Scrip Symbol: {bseScripSymbol}</p>}
              {isin && <p>ISIN: {isin}</p>}
            </div>

            {complaintsTitle && (
              <div className="mt-8">
                <h3 className="text-[20px] font-bold mb-4 h-[28px] flex items-center text-[#ffffff]">{complaintsTitle}</h3>
                <div className="space-y-2 text-sm text-[#ffffff]">
                  {complaintsPhone && (
                    <a
                      href={complaintsPhoneUrl || '#'}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center hover:text-[#7cd144] transition-colors cursor-pointer text-[#ffffff]"
                    >
                      <i className="ri-phone-line mr-2 text-[#7cd144]"></i>
                      {complaintsPhone}
                    </a>
                  )}
                  {complaintsEmail && (
                    <a
                      href={`mailto:${complaintsEmail}`}
                      className="flex items-center hover:text-[#7cd144] transition-colors cursor-pointer text-[#ffffff]"
                    >
                      <i className="ri-mail-line mr-2 text-[#7cd144]"></i>
                      {complaintsEmail}
                    </a>
                  )}
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="border-t border-gray-800 pt-8">
          <div className="flex flex-col md:flex-row items-center justify-between gap-4">
            <p className="text-[#ffffff] text-sm">
              {copyrightText} {copyrightLink && copyrightLinkText && (
                <a
                  href={copyrightLink}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-[#7dc144] hover:text-[#7dc144] transition-colors cursor-pointer"
                >
                  {copyrightLinkText}
                </a>
              )} All rights reserved
            </p>
            <div className="flex gap-6 text-sm">
              {bottomLinks.map((link, index) => (
                <a
                  key={index}
                  href={link.href}
                  {...(link.target && { target: link.target, rel: 'noopener noreferrer' })}
                  className="text-[#ffffff] hover:text-[#7dc144] transition-colors cursor-pointer"
                >
                  {link.name}
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
