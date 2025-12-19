import { useState, useEffect } from 'react';
import { contactCmsApi } from '../../../services/api';

interface OfficeAddress {
  id: number;
  title: string;
  details: string[];
  image?: string;
  isTopOffice: boolean;
  order: number;
  isActive: boolean;
}

export default function OfficeAddresses() {
  const [offices, setOffices] = useState<OfficeAddress[]>([]);
  const [bottomOffices, setBottomOffices] = useState<OfficeAddress[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    // Default fallback data
    const fallbackTopOffices: OfficeAddress[] = [
      {
        id: 1,
        title: 'Registered Office',
        image: 'https://refex.co.in/wp-content/uploads/2025/07/Towers-289x300.jpg',
        details: [
          '2nd Floor, No.313, Refex Towers,',
          'Sterling Road, Valluvar Kottam High Road,',
          'Nungambakkam, Chennai,',
          'Tamil Nadu, India – 600034',
          'Phone: +91-44 – 3504 0050',
          'Email: info@refex.co.in'
        ],
        isTopOffice: true,
        order: 1,
        isActive: true,
      },
      {
        id: 2,
        title: 'Corporate Office',
        image: 'https://refex.co.in/wp-content/uploads/2025/07/Bazullah-Office-267x300.jpg',
        details: [
          'Refex, 67, Bazullah Road,',
          'Next to Sri Ramakrishna Mission',
          'Matriculation Higher Secondary School',
          'T Nagar, Chennai, Tamil Nadu, India – 600017'
        ],
        isTopOffice: true,
        order: 2,
        isActive: true,
      }
    ];

    const fallbackBottomOffices: OfficeAddress[] = [
      {
        id: 3,
        title: 'Factory',
        details: [
          'No: 1/171, Old Mahabalipuram Road,',
          'Thiruporur, Kanchipuram Dist – 603 110.',
          'Tamil Nadu, India – 600034',
          'Phone: +91-44 – 2744 5295',
          'Email: factory@refex.co.in'
        ],
        isTopOffice: false,
        order: 1,
        isActive: true,
      },
      {
        id: 4,
        title: 'Investors Grievances',
        details: [
          'Mr. Ankit Poddar',
          'Company Secretary / Compliance Officer',
          '2nd Floor, No.313, Refex Towers,',
          'Sterling Road, Valluvar Kottam High Road,',
          'Nungambakkam, Chennai,',
          'Tamil Nadu, India – 600034',
          'Phone: +91-44 – 3504 0050',
          'Email: investor.relations@refex.co.in'
        ],
        isTopOffice: false,
        order: 2,
        isActive: true,
      },
      {
        id: 5,
        title: 'For Determining Materiality of Events',
        details: [
          'Mr. Ankit Poddar – CS / Compliance Officer',
          '2nd Floor, No.313, Refex Towers,',
          'Sterling Road, Valluvar Kottam High Road,',
          'Nungambakkam, Chennai,',
          'Tamil Nadu, India – 600034',
          'Phone: +91-44 – 3504 0050',
          'Email: investor.relations@refex.co.in'
        ],
        isTopOffice: false,
        order: 3,
        isActive: true,
      }
    ];

    try {
      setLoading(true);
      const data = await contactCmsApi.getOfficeAddresses();
      const activeAddresses = (data || [])
        .filter((address: OfficeAddress) => address.isActive)
        .sort((a: OfficeAddress, b: OfficeAddress) => {
          // Sort by isTopOffice first (top offices first), then by order
          if (a.isTopOffice !== b.isTopOffice) {
            return a.isTopOffice ? -1 : 1;
          }
          return a.order - b.order;
        });
      
      const topOffices = activeAddresses.filter((a: OfficeAddress) => a.isTopOffice);
      const bottomOffices = activeAddresses.filter((a: OfficeAddress) => !a.isTopOffice);
      
      if (topOffices.length === 0 && bottomOffices.length === 0) {
        setOffices(fallbackTopOffices);
        setBottomOffices(fallbackBottomOffices);
      } else {
        setOffices(topOffices);
        setBottomOffices(bottomOffices);
      }
    } catch (error) {
      console.error('Failed to fetch office addresses:', error);
      // Fallback to default data on error
      setOffices(fallbackTopOffices);
      setBottomOffices(fallbackBottomOffices);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="py-16 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading office addresses...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  return (
    <section className="py-16 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4">
        <h2 className="font-bold text-center mb-12" style={{ fontSize: '34px', color: '#1f1f1f' }}>
          OUR OFFICE ADDRESSES
        </h2>

        {/* Top Row - Registered and Corporate Office */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
          {offices.map((office, index) => (
            <div 
              key={index}
              className="bg-white shadow-md overflow-hidden hover:shadow-lg transition-shadow"
            >
              <div className="bg-[#0066b2] text-white px-6 py-3">
                <h5 className="font-bold" style={{ fontSize: '21px', color: '#ffffff' }}>{office.title}</h5>
              </div>
              
              <div style={{ padding: '10px' }}>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <ul className="space-y-2">
                      {office.details.map((detail, idx) => (
                        <li key={idx} className="leading-relaxed" style={{ fontSize: '16px', color: '#1f1f1f' }}>
                          {detail}
                        </li>
                      ))}
                    </ul>
                  </div>
                  <div className="flex items-center justify-center">
                    <img 
                      src={office.image} 
                      alt={office.title}
                      className="rounded-lg shadow-sm"
                      style={{ width: '216px', height: '243px', objectFit: 'cover' }}
                    />
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Bottom Row - Factory, Investors Grievances, Materiality of Events */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {bottomOffices.map((office, index) => (
            <div 
              key={index}
              className="bg-white shadow-md overflow-hidden hover:shadow-lg transition-shadow"
            >
              <div className="bg-[#0066b2] text-white px-6 py-3">
                <h5 className="font-bold" style={{ fontSize: '21px', color: '#ffffff' }}>{office.title}</h5>
              </div>
              
              <div style={{ padding: '10px' }}>
                <ul className="space-y-2">
                  {office.details.map((detail, idx) => (
                    <li key={idx} className="leading-relaxed" style={{ fontSize: '16px', color: '#1f1f1f' }}>
                      {detail}
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
