import { useEffect } from 'react';
import AOS from 'aos';
import 'aos/dist/aos.css';
import Header from '../home/components/Header';
import Footer from '../home/components/Footer';
import ScrollToTop from '../home/components/ScrollToTop';
import HeroSection from './components/HeroSection';
import RefexOnESGSection from './components/RefexOnESGSection';
import SustainableBusinessSection from './components/SustainableBusinessSection';
import ESGPoliciesSection from './components/ESGPoliciesSection';
import ReportsSection from './components/ReportsSection';
import ProgramsSection from './components/ProgramsSection';
import SDGSection from './components/SDGSection';
import UNSDGActionsSection from './components/UNSDGActionsSection';
import AwardsSection from './components/AwardsSection';
import CollaborationSection from './components/CollaborationSection';
import GovernanceSection from './components/GovernanceSection';
import HRSection from './components/HRSection';

export default function ESGPage() {
  useEffect(() => {
    AOS.init({
      duration: 1000,
      easing: 'ease-in-out',
      once: true,
      offset: 100,
      delay: 0,
    });
    window.scrollTo(0, 0);
  }, []);

  return (
    <div className="min-h-screen bg-white" style={{ fontFamily: '"Open Sans", sans-serif' }}>
      <Header />
      <HeroSection />
      <RefexOnESGSection />
      <SustainableBusinessSection />
      <ESGPoliciesSection />
      <ReportsSection />
      <ProgramsSection />
      <SDGSection />
      <UNSDGActionsSection />
      <AwardsSection />
      <CollaborationSection />
      <GovernanceSection />
      <HRSection />
      <Footer />
      <ScrollToTop />
    </div>
  );
}
