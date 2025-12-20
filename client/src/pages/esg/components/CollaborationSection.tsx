import { useState, useEffect } from 'react';
import { esgCmsApi } from '../../../services/api';

const API_BASE_URL = import.meta.env.VITE_API_URL || "";

const getFullUrl = (url?: string): string | undefined => {
  if (!url) return undefined;
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return url;
  }
  if (url.startsWith('/')) {
    return `${API_BASE_URL}${url}`;
  }
  return `${API_BASE_URL}/${url}`;
};

interface DevelopmentalOrg {
  id: number;
  title: string;
  logo: string;
  content: string;
  order: number;
  isActive: boolean;
}

interface MainCollaboration {
  id: number;
  title: string;
  logo: string;
  content?: string;
  largeImage?: string;
  isActive: boolean;
}

interface CollaborationSectionHeader {
  id: number;
  title: string;
  isActive: boolean;
}

interface DevelopmentalOrgsSectionHeader {
  id: number;
  title: string;
  isActive: boolean;
}

export default function CollaborationSection() {
  const [sectionHeader, setSectionHeader] = useState<CollaborationSectionHeader | null>(null);
  const [mainCollaboration, setMainCollaboration] = useState<MainCollaboration | null>(null);
  const [orgsSectionHeader, setOrgsSectionHeader] = useState<DevelopmentalOrgsSectionHeader | null>(null);
  const [orgs, setOrgs] = useState<DevelopmentalOrg[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackSectionHeader: CollaborationSectionHeader = {
      id: 1,
      title: 'Collaboration & Membership',
      isActive: true,
    };
    
    const fallbackMainCollaboration: MainCollaboration = {
      id: 1,
      title: 'United Nations Global Compact – Network India (UNGC NI)',
      logo: 'https://refex.co.in/wp-content/uploads/2025/02/global-compact-india.jpg',
      content: 'The UN Global Compact Network India serves as a vital platform for advancing the ten universally endorsed principles within the Indian business landscape. These principles, integral to fostering sustainable and responsible corporate citizenship, align with broader global objectives like the Millennium Development Goals (MDGs) and post-2015 development agendas.',
      largeImage: 'https://refex.co.in/wp-content/uploads/2025/08/UNGCNI-name-in-Towers-building-01-new.jpg',
      isActive: true,
    };
    
    const fallbackOrgsSectionHeader: DevelopmentalOrgsSectionHeader = {
      id: 1,
      title: 'Developmental Organizations',
      isActive: true,
    };
    
    const fallbackOrgs: DevelopmentalOrg[] = [
      {
        id: 1,
        title: 'Damooga Foundation',
        logo: 'https://refex.co.in/wp-content/uploads/2025/02/images-1.png',
        content: 'Damooga Foundation is a leading IT-enabled environmental NGO in India. Founded in 2014, it is driven by a group of young and passionate nature lovers. Damooga collaborates with individuals, corporate houses, educational and non-educational institutions, social groups and communities, NGOs, social entrepreneurs, and anyone committed to creating a positive impact on society and the environment.',
        order: 1,
        isActive: true,
      },
      {
        id: 2,
        title: 'Friends of Tribals Society',
        logo: 'https://refex.co.in/wp-content/uploads/2025/06/FTS-logo.jpg',
        content: 'Friends of Tribals Society (FTS), established in 1989 and based in Kolkata, is a non-profit organization dedicated to uplifting underprivileged rural and tribal communities across India. Operating through 37 chapters in 25 states, its flagship initiative—the One Teacher School (OTS) or Ekal Vidyalaya—provides non-formal primary education to children aged 4 to 14. These schools focus on five key areas: functional literacy, healthcare, development education, empowerment, and value-based education (Sanskar). FTS was honored with the Gandhi Peace Prize in 2017 for its impactful grassroots work.',
        order: 2,
        isActive: true,
      },
    ];

    try {
      setLoading(true);
      
      // Try to fetch data, but handle errors gracefully
      let sectionHeaderData = null;
      let mainCollabData = null;
      let orgsSectionHeaderData = null;
      let orgsData: DevelopmentalOrg[] = [];
      
      try {
        sectionHeaderData = await esgCmsApi.getCollaborationSection();
      } catch (err: any) {
        console.warn('Failed to fetch collaboration section header:', err.message);
        sectionHeaderData = null;
      }
      
      try {
        mainCollabData = await esgCmsApi.getMainCollaboration();
      } catch (err: any) {
        console.warn('Failed to fetch main collaboration:', err.message);
        mainCollabData = null;
      }
      
      try {
        orgsSectionHeaderData = await esgCmsApi.getDevelopmentalOrgsSection();
      } catch (err: any) {
        console.warn('Failed to fetch developmental orgs section header:', err.message);
        orgsSectionHeaderData = null;
      }
      
      try {
        orgsData = await esgCmsApi.getDevelopmentalOrgs();
      } catch (err: any) {
        console.warn('Failed to fetch developmental organizations:', err.message);
        orgsData = [];
      }
      
      // Use API data if available and active, otherwise use fallback
      if (sectionHeaderData && (sectionHeaderData.isActive === true || sectionHeaderData.isActive === undefined || sectionHeaderData.isActive === null)) {
        setSectionHeader(sectionHeaderData);
      } else {
        setSectionHeader(fallbackSectionHeader);
      }
      
      if (mainCollabData && (mainCollabData.isActive === true || mainCollabData.isActive === undefined || mainCollabData.isActive === null)) {
        setMainCollaboration(mainCollabData);
      } else {
        setMainCollaboration(fallbackMainCollaboration);
      }
      
      if (orgsSectionHeaderData && (orgsSectionHeaderData.isActive === true || orgsSectionHeaderData.isActive === undefined || orgsSectionHeaderData.isActive === null)) {
        setOrgsSectionHeader(orgsSectionHeaderData);
      } else {
        setOrgsSectionHeader(fallbackOrgsSectionHeader);
      }
      
      const activeOrgs = (orgsData || [])
        .filter((org: DevelopmentalOrg) => org.isActive)
        .sort((a: DevelopmentalOrg, b: DevelopmentalOrg) => (a.order || 0) - (b.order || 0));
      
      // If no active orgs from API, use fallback
      if (activeOrgs.length === 0) {
        setOrgs(fallbackOrgs);
      } else {
        setOrgs(activeOrgs);
      }
    } catch (error: any) {
      console.error('Failed to fetch collaboration section:', error);
      // Fallback to default data on any error
      setSectionHeader(fallbackSectionHeader);
      setMainCollaboration(fallbackMainCollaboration);
      setOrgsSectionHeader(fallbackOrgsSectionHeader);
      setOrgs(fallbackOrgs);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-20 bg-white">
        <div className="container mx-auto px-4 max-w-7xl">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading collaboration section...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  // Ensure we have data (use defaults if not available)
  const displaySectionHeader = sectionHeader || {
    id: 1,
    title: 'Collaboration & Membership',
    isActive: true,
  };
  
  const displayMainCollaboration = mainCollaboration || {
    id: 1,
    title: 'United Nations Global Compact – Network India (UNGC NI)',
    logo: 'https://refex.co.in/wp-content/uploads/2025/02/global-compact-india.jpg',
    content: 'The UN Global Compact Network India serves as a vital platform for advancing the ten universally endorsed principles within the Indian business landscape. These principles, integral to fostering sustainable and responsible corporate citizenship, align with broader global objectives like the Millennium Development Goals (MDGs) and post-2015 development agendas.',
    largeImage: 'https://refex.co.in/wp-content/uploads/2025/08/UNGCNI-name-in-Towers-building-01-new.jpg',
    isActive: true,
  };
  
  const displayOrgsSectionHeader = orgsSectionHeader || {
    id: 1,
    title: 'Developmental Organizations',
    isActive: true,
  };

  if (!displayMainCollaboration.isActive && orgs.length === 0) {
    return null;
  }

  return (
    <section className="py-20 bg-white">
      <div className="container mx-auto px-4 max-w-7xl">
        <div className="text-center mb-16">
          <h3 
            className="text-[34px] font-semibold mb-4" 
            style={{ color: '#1f1f1f' }}
            data-aos="fade-right"
          >
            {displaySectionHeader.title}
          </h3>
        </div>

        <div className="space-y-16">
          {/* Main Collaboration */}
          {displayMainCollaboration.isActive && (
            <div className="grid md:grid-cols-2 gap-12 items-center">
              <div className="bg-gray-50 p-8 rounded-lg text-center">
                <h4 
                  className="font-bold mb-4" 
                  style={{ fontSize: '30px', color: '#7dc144' }}
                  data-aos="fade-up"
                  data-aos-delay="100"
                >
                  {displayMainCollaboration.title}
                </h4>
                {displayMainCollaboration.logo && (
                  <img
                    src={getFullUrl(displayMainCollaboration.logo)}
                    alt={displayMainCollaboration.title}
                    className="w-full max-w-md mb-6 mx-auto"
                    onError={(e) => {
                      // Hide broken images instead of requesting external placeholder
                      (e.target as HTMLImageElement).style.display = 'none';
                    }}
                  />
                )}
                {displayMainCollaboration.content && (
                  <p className="leading-relaxed" style={{ fontSize: '16px', color: '#1f1f1f' }}>{displayMainCollaboration.content}</p>
                )}
              </div>
              {displayMainCollaboration.largeImage && (
                <div className="flex items-center justify-center">
                  <img
                    src={getFullUrl(displayMainCollaboration.largeImage)}
                    alt={displayMainCollaboration.title}
                    className="object-cover rounded-lg"
                    style={{ width: '284px', height: '295px' }}
                    onError={(e) => {
                      // Hide broken images instead of requesting external placeholder
                      (e.target as HTMLImageElement).style.display = 'none';
                    }}
                  />
                </div>
              )}
            </div>
          )}

          {/* Developmental Organizations */}
          {orgs.length > 0 && (
            <>
              {displayMainCollaboration.isActive && (
                <div className="pt-16 w-full" style={{ borderTop: '0.8px solid #1f1f1f' }}></div>
              )}
              <div>
                <h4 
                  className="font-bold text-center mb-8" 
                  style={{ fontSize: '30px', color: '#7dc144' }}
                  data-aos="fade-right"
                  data-aos-delay="100"
                >
                  {displayOrgsSectionHeader.title}
                </h4>
                
                <div className="grid md:grid-cols-2 gap-12 max-w-6xl mx-auto">
                  {orgs.map((org) => (
                    <div key={org.id} className="bg-gray-50 p-8 rounded-lg text-center">
                      <h5 className="font-bold mb-4" style={{ fontSize: '22px', color: '#000000' }}>{org.title}</h5>
                      {org.logo && (
                        <img
                          src={getFullUrl(org.logo)}
                          alt={org.title}
                          className="w-full max-w-xs mb-6 mx-auto"
                          onError={(e) => {
                            // Hide broken images instead of requesting external placeholder
                            (e.target as HTMLImageElement).style.display = 'none';
                          }}
                        />
                      )}
                      {org.content && (
                        <p className="leading-relaxed" style={{ fontSize: '16px', color: '#1f1f1f' }}>{org.content}</p>
                      )}
                    </div>
                  ))}
                </div>
              </div>
            </>
          )}
        </div>
      </div>
    </section>
  );
}
