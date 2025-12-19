import { useEffect } from 'react';
import AOS from 'aos';
import 'aos/dist/aos.css';
import Header from '../home/components/Header';
import Footer from '../home/components/Footer';
import HeroSection from './components/HeroSection';
import AboutSection from './components/AboutSection';
import MissionVisionSection from './components/MissionVisionSection';
import CoreValuesSection from './components/CoreValuesSection';
import BoardMembersSection from './components/BoardMembersSection';
import CommitteesSection from './components/CommitteesSection';
import LeadershipTeamSection from './components/LeadershipTeamSection';
import OurPresenceSection from './components/OurPresenceSection';
import JourneySection from './components/JourneySection';
import StickyNav from './components/StickyNav';

export default function AboutUsPage() {
  useEffect(() => {
    AOS.init({
      duration: 1000,
      easing: 'ease-in-out',
      once: true,
      offset: 100,
      delay: 0,
    });
  }, []);

  console.log('AboutUsPage rendering');
  return (
    <div className="min-h-screen bg-white" style={{ fontFamily: '"Open Sans", sans-serif' }}>
      <Header />
      <main className="pt-[116px]">
        <HeroSection />
        <StickyNav />
        <AboutSection />
        <MissionVisionSection />
        <CoreValuesSection />
        <BoardMembersSection />
        <CommitteesSection />
        <LeadershipTeamSection />
        <OurPresenceSection />
        <JourneySection />
      </main>
      <Footer />
    </div>
  );
}
