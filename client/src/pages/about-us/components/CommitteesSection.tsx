import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface CommitteeMember {
  id: number;
  name: string;
  designation: string;
  category: string;
  order: number;
  isActive: boolean;
}

interface Committee {
  id: number;
  name: string;
  order: number;
  isActive: boolean;
  members: CommitteeMember[];
}

function CommitteesSection() {
  const [committees, setCommittees] = useState<Committee[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCommittees = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getCommittees();
        const activeCommittees = (data || [])
          .filter((c: Committee) => c.isActive)
          .sort((a: Committee, b: Committee) => (a.order || 0) - (b.order || 0));
        setCommittees(activeCommittees);
      } catch (error) {
        console.error('Failed to fetch committees:', error);
        // Fallback to default data if API fails
        // Fallback data
        setCommittees([
          {
            id: 1,
            name: 'Audit Committee',
            order: 1,
            isActive: true,
            members: [
              { id: 1, name: 'Mr. Ramesh Dugar', designation: 'Independent Director', category: 'Chairman', order: 1, isActive: true },
              { id: 2, name: 'Mr. Dinesh Kumar Agarwal', designation: 'Whole-time Director & CFO', category: 'Member', order: 2, isActive: true },
              { id: 3, name: 'Mr. Sivaramakrishnan Vasudevan', designation: 'Independent Director', category: 'Member', order: 3, isActive: true }
            ]
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchCommittees();
  }, []);

  if (loading) {
    return (
      <div className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-6">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading committees...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (committees.length === 0) {
    return null;
  }

  return (
    <div className="py-16 bg-white">
      <div className="max-w-7xl mx-auto px-6">
        <div className="text-center mb-12">
          <h4 style={{ fontSize: '34px', color: '#1f1f1f', fontWeight: 600, lineHeight: '1.68' }}>COMPOSITION OF COMMITTEES</h4>
        </div>
        <div className="bg-white rounded-lg shadow-lg overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr style={{ backgroundColor: '#7cd244' }}>
                  <th className="px-6 py-4 text-left text-sm font-bold text-white">Name of Committee</th>
                  <th className="px-6 py-4 text-left text-sm font-bold text-white">Name of Committee Members</th>
                  <th className="px-6 py-4 text-left text-sm font-bold text-white">Designation</th>
                  <th className="px-6 py-4 text-left text-sm font-bold text-white">Category</th>
                </tr>
              </thead>
              <tbody>
                {committees.map((committee, index) => {
                  const activeMembers = (committee.members || []).filter(m => m.isActive);
                  return (
                    <tr 
                      key={committee.id || index} 
                      style={{ backgroundColor: index % 2 === 0 ? '#ffffff' : '#f2f2f2' }}
                      className="border-b border-gray-200 hover:opacity-90 transition-opacity"
                    >
                      <td className="px-6 py-4 text-sm text-gray-900 font-medium align-top">
                        {committee.name}
                      </td>
                      <td className="px-6 py-4 text-sm text-gray-700 align-top">
                        {activeMembers.map((member, idx) => (
                          <div key={member.id || idx} className={idx > 0 ? 'mt-2' : ''}>
                            {member.name}
                          </div>
                        ))}
                      </td>
                      <td className="px-6 py-4 text-sm text-gray-700 align-top">
                        {activeMembers.map((member, idx) => (
                          <div key={member.id || idx} className={idx > 0 ? 'mt-2' : ''}>
                            {member.designation}
                          </div>
                        ))}
                      </td>
                      <td className="px-6 py-4 text-sm text-gray-700 align-top">
                        {activeMembers.map((member, idx) => (
                          <div key={member.id || idx} className={idx > 0 ? 'mt-2' : ''}>
                            {member.category}
                          </div>
                        ))}
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}

export default CommitteesSection;
