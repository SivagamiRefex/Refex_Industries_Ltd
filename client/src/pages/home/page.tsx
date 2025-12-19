import Header from './components/Header';
import HeroSlider from './components/HeroSlider';
import AboutSection from './components/AboutSection';
import BusinessSection from './components/BusinessSection';
import AtGlanceSection from './components/AtGlanceSection';
import FlipCardsSection from './components/FlipCardsSection';
import NewsroomSection from './components/NewsroomSection';
import AwardsSection from './components/AwardsSection';
import Footer from './components/Footer';
import ScrollToTop from './components/ScrollToTop';

export default function HomePage() {
  return (
    <div className="min-h-screen bg-white" style={{ fontFamily: '"Open Sans", sans-serif' }}>
      <Header />
      <main>
        <HeroSlider />
        <AboutSection />
        <BusinessSection />
        <AtGlanceSection />
        <FlipCardsSection />
        <NewsroomSection />
        <AwardsSection />
      </main>
      <Footer />
      <ScrollToTop />
    </div>
  );
}
