import { useState, useEffect } from 'react';
import { aboutCmsApi } from '../../../services/api';

interface BoardMember {
  id: number;
  name: string;
  position: string;
  image?: string;
  biography?: string;
  linkedin?: string;
  directorshipDetails?: string; // MULTILINE CMS FIELD
  order: number;
  isActive: boolean;
}

function BoardMembersSection() {
  const [boardMembers, setBoardMembers] = useState<BoardMember[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedMember, setSelectedMember] = useState<BoardMember | null>(null);
  const [showDirectorship, setShowDirectorship] = useState(false);

  useEffect(() => {
    const fetchBoardMembers = async () => {
      try {
        setLoading(true);
        const data = await aboutCmsApi.getBoardMembers();
        const activeMembers = (data || [])
          .filter((item: BoardMember) => item.isActive)
          .sort((a: BoardMember, b: BoardMember) => (a.order || 0) - (b.order || 0));

        setBoardMembers(activeMembers);
      } catch (error) {
        console.error('Failed to fetch board members:', error);

        // Fallback Data
        setBoardMembers([
          {
            id: 1,
            name: 'Anil Jain',
            position: 'Chairman & Managing Director',
            image:
              'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ed39453b975c767adc77858e9ce4ab7d.jpeg',
            biography: `Anil Jain is the Managing Director of Refex Group...`,
            linkedin: 'https://www.linkedin.com/in/anil-jain-refex',
            directorshipDetails: `Refex Renewables and Infrastructure Limited
Sherisha Technologies Private Limited
Lee Pharma Limited
Refex Green Power Limited`,
            order: 1,
            isActive: true,
          },
        ]);
      } finally {
        setLoading(false);
      }
    };

    fetchBoardMembers();
  }, []);

  if (loading) {
    return (
      <div className="py-20 text-center">
        <div className="animate-spin h-12 w-12 border-b-2 border-blue-600 rounded-full mx-auto"></div>
        <p className="mt-4 text-gray-600">Loading...</p>
      </div>
    );
  }

  return (
    <div id="board-members" className="py-16 bg-gray-50">
      <div className="max-w-7xl mx-auto px-6">

        {/* Heading */}
        <h4
          className="text-center mb-12"
          style={{ fontSize: '34px', color: '#1f1f1f', fontWeight: 600 }}
        >
          Board Members
        </h4>

        {/* Board Members Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {boardMembers.map((member) => (
            <div
              key={member.id}
              className="group cursor-pointer"
              onClick={() => {
                setSelectedMember(member);
                setShowDirectorship(false);
              }}
            >
              <div className="overflow-hidden aspect-[3/4] rounded-lg">
                <img
                  src={member.image}
                  alt={member.name}
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                  onError={(e) =>
                    ((e.target as HTMLImageElement).src =
                      'https://via.placeholder.com/300x400?text=No+Image')
                  }
                />
              </div>

              <div className="pt-4 pb-6 text-center">
                <h3 className="font-bold" style={{ fontSize: '23px', color: '#3f444b' }}>
                  {member.name}
                </h3>
                <p className="mt-1" style={{ fontSize: '16px', color: '#3f444b' }}>
                  {member.position}
                </p>
              </div>

              {/* Hover underline */}
              <div className="h-0.5 bg-[#7dc144] w-0 group-hover:w-full transition-all duration-300"></div>
            </div>
          ))}
        </div>
      </div>

      {/* ----------------------- POPUP MODAL -------------------------- */}
      {/* --------------------- POPUP MODAL ---------------------- */}
{selectedMember && (
  <div
    className="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4"
    onClick={() => {
      setSelectedMember(null);
      setShowDirectorship(false);
    }}
  >
    <div
      className="bg-white rounded-xl max-w-4xl w-full max-h-[90vh] overflow-y-auto relative"
      onClick={(e) => e.stopPropagation()}
      style={{ boxShadow: "0 20px 50px rgba(0,0,0,0.25)" }}
    >
      {/* Close Button */}
      <button
        onClick={() => {
          setSelectedMember(null);
          setShowDirectorship(false);
        }}
        className="absolute top-4 right-4 w-10 h-10 bg-black text-white flex items-center justify-center rounded-md text-2xl hover:bg-gray-800 transition"
      >
        ×
      </button>

      <div className="px-8 py-10">

        {/* Name */}
        <h2
          className="text-center font-bold uppercase"
          style={{ fontSize: "30px", color: "#1f1f1f", letterSpacing: "1px" }}
        >
          {selectedMember.name}
        </h2>

        {/* Position */}
        <p
          className="text-center mt-2 mb-4"
          style={{ fontSize: "18px", color: "#1f1f1f" }}
        >
          {selectedMember.position}
        </p>

        {/* LinkedIn icon — SQUARE BLUE BACKGROUND */}
        {/* Show ONLY if LinkedIn URL exists */}
{selectedMember.linkedin && selectedMember.linkedin.trim() !== "" && (
  <div className="flex justify-center mb-6">
    <a
      href={selectedMember.linkedin}
      target="_blank"
      rel="noopener noreferrer"
      className="w-12 h-12 rounded-md flex items-center justify-center"
      style={{ backgroundColor: "#0a66c2" }}
    >
      <i className="ri-linkedin-fill text-3xl" style={{ color: "#ffffff" }}></i>
    </a>
  </div>
)}


        {/* Biography */}
        <div
          className="text-left mb-10"
          style={{ color: "#1f1f1f", fontSize: "16px", lineHeight: "1.7" }}
        >
          {(selectedMember.biography?.trim() || "Biography will be updated soon.")
            .split("\n")
            .map((p, i) => (
              <p key={i} className="mb-4">
                {p}
              </p>
            ))}
        </div>

        {/* DIRECTORSHIP DETAILS BUTTON — LEFT ALIGNED */}
        <div
  className="rounded-md mb-6"
  style={{ backgroundColor: "#7dc144" }}
>
  {/* BUTTON AREA */}
  <button
    onClick={() => setShowDirectorship(!showDirectorship)}
    className="w-full text-left px-6 py-3 text-white font-bold uppercase tracking-wide"
    style={{ fontSize: "16px" }}
  >
    Directorship Details
  </button>

  {/* EXPANDED CONTENT INSIDE GREEN BOX */}
  {showDirectorship && (
    <div className="px-6 pb-4 pt-2">
      <ol
        className="space-y-3"
        style={{
          paddingLeft: "20px",
          color: "#ffffff",
          fontSize: "16px",
          lineHeight: "1.7",
        }}
      >
        {(selectedMember.directorshipDetails?.trim() ||
          "No directorship details available.")
          .split("\n")
          .map((item, index) => (
            <li key={index}>{item}</li>
          ))}
      </ol>
    </div>
  )}
</div>
      </div>
    </div>
  </div>
)}

    </div>
  );
}

export default BoardMembersSection;
