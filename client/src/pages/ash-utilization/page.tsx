import { useEffect } from 'react';
import AOS from 'aos';
import 'aos/dist/aos.css';
import HeroSection from './components/HeroSection';
import WhoWeAreSection from './components/WhyWeAreSection';
import WhyChooseUsSection from './components/WhyChooseUsSection';
import OurImpactSection from './components/OurImpactSection';
import ServicesSection from './components/ServicesSection';
import ClientsSection from './components/ClientsSection';
import Footer from '../home/components/Footer';
import Header from '../home/components/Header';
import ScrollToTop from '../home/components/ScrollToTop';

export default function AshUtilizationPage() {
  useEffect(() => {
    AOS.init({
      duration: 1000,
      easing: 'ease-in-out',
      once: true,
      offset: 100,
      delay: 0,
    });
  }, []);

  return (
    <div className="min-h-screen bg-white" style={{ fontFamily: '"Open Sans", sans-serif' }}>
      <Header />
      <main className="pt-[116px]">
        <div data-aos="fade-up">
          <HeroSection />
        </div>
        <div data-aos="fade-up" data-aos-delay="100">
          <WhoWeAreSection />
        </div>
        <div data-aos="fade-up" data-aos-delay="200">
          <WhyChooseUsSection />
        </div>
        <div data-aos="fade-up" data-aos-delay="300">
          <OurImpactSection />
        </div>
        <div data-aos="fade-up" data-aos-delay="400">
          <ServicesSection />
        </div>
        <div data-aos="fade-up" data-aos-delay="500">
          <ClientsSection />
        </div>
      </main>
      <Footer />
      <ScrollToTop />
    </div>
  );
}
