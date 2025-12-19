import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface Leader {
  id: number;
  name: string;
  position: string;
  image?: string;
  linkedin?: string;
  biography?: string;
  order: number;
  isActive: boolean;
}

function LeadershipTeamSection() {
  const [leaders, setLeaders] = useState<Leader[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedLeader, setSelectedLeader] = useState<Leader | null>(null);

  useEffect(() => {
    const fetchLeaders = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getLeadershipTeam();
        const activeLeaders = (data || [])
          .filter((item: Leader) => item.isActive)
          .sort((a: Leader, b: Leader) => (a.order || 0) - (b.order || 0));

        setLeaders(activeLeaders);
      } catch (error) {
        console.error('Failed to fetch leadership team:', error);

        // Fallback Data
        setLeaders([
          {
            id: 1,
            name: "Purvesh Kapadia",
            position: "Group CHRO",
            linkedin: "https://www.linkedin.com",
            biography: "Biography will be updated soon.",
            image: "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/a3cdce632dade111205dc229ca702480.jpeg",
            order: 1,
            isActive: true,
          }
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchLeaders();
  }, []);

  if (loading) {
    return (
      <div className="py-20 text-center">
        <div className="animate-spin h-12 w-12 border-b-2 border-blue-600 rounded-full mx-auto"></div>
        <p className="mt-4 text-gray-600">Loading leadership team...</p>
      </div>
    );
  }

  if (leaders.length === 0) return null;

  return (
    <div id="leadership-team" className="py-16 bg-gray-50">
      <div className="max-w-7xl mx-auto px-6">

        <h4
          className="text-center mb-12"
          style={{ fontSize: "34px", color: "#1f1f1f", fontWeight: 600 }}
        >
          LEADERSHIP TEAM
        </h4>

        {/* GRID */}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {leaders.map((leader) => (
            <div
              key={leader.id}
              className="group cursor-pointer relative"
              onClick={() => setSelectedLeader(leader)}
            >
              <div className="relative overflow-hidden">
                <div className="aspect-[3/4] overflow-hidden">
                  <img
                    src={leader.image}
                    alt={leader.name}
                    className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                  />
                </div>
                <div className="flex flex-col justify-center p-2">
                  <h3
                    className="font-bold mb-1 text-center"
                    style={{ fontSize: "23px", color: "#3f444b" }}
                  >
                    {leader.name}
                  </h3>
                  <p
                    className="text-center"
                    style={{ fontSize: "16px", color: "#3f444b" }}
                  >
                    {leader.position}
                  </p>
                </div>
              </div>

              <div className="absolute bottom-0 left-0 right-0 h-0.5 bg-[#7dc244] w-0 group-hover:w-full transition-all duration-300"></div>
            </div>
          ))}
        </div>
      </div>

      {/* ----------------------- POPUP MODAL ------------------------ */}
      {selectedLeader && (
        <div
          className="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4"
          onClick={() => setSelectedLeader(null)}
        >
          <div
            className="bg-white rounded-xl max-w-4xl w-full max-h-[90vh] overflow-y-auto relative"
            onClick={(e) => e.stopPropagation()}
            style={{ boxShadow: "0 20px 50px rgba(0,0,0,0.25)" }}
          >
            {/* Close */}
            <button
              onClick={() => setSelectedLeader(null)}
              className="absolute top-4 right-4 w-10 h-10 bg-black text-white flex items-center justify-center rounded-md text-2xl hover:bg-gray-800 transition"
            >
              ×
            </button>

            <div className="px-8 py-10">

              {/* Name */}
              <h2
                className="text-center font-bold uppercase"
                style={{ fontSize: "34px", color: "#1f1f1f" }}
              >
                {selectedLeader.name}
              </h2>

              {/* Position */}
              <p
                className="text-center mt-2 mb-6"
                style={{ fontSize: "18px", color: "#1f1f1f" }}
              >
                {selectedLeader.position}
              </p>

              {/* LinkedIn icon — only if URL exists */}
              {selectedLeader.linkedin &&
                selectedLeader.linkedin.trim() !== "" && (
                  <div className="flex justify-center mb-6">
                    <a
                      href={selectedLeader.linkedin}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="w-12 h-12 rounded-md flex items-center justify-center"
                      style={{ backgroundColor: "#0a66c2" }}
                    >
                      <i
                        className="ri-linkedin-fill text-3xl"
                        style={{ color: "#ffffff" }}
                      ></i>
                    </a>
                  </div>
                )}

              {/* Biography */}
              <div
                className="text-left mb-10"
                style={{
                  color: "#1f1f1f",
                  fontSize: "16px",
                  lineHeight: "1.7",
                }}
              >
                {(selectedLeader.biography?.trim() ||
                  "Biography will be updated soon.")
                  .split("\n")
                  .map((p, i) => (
                    <p key={i} className="mb-4">
                      {p}
                    </p>
                  ))}
              </div>


            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default LeadershipTeamSection;
