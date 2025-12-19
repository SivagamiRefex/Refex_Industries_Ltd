import { Suspense } from 'react';
import Header from '../home/components/Header';
import Footer from '../home/components/Footer';
import HeroSection from './components/HeroSection';
import NewsroomTabs from './components/NewsroomTabs';
import ScrollToTop from '../home/components/ScrollToTop';

export default function NewsroomPage() {
  return (
    <div className="min-h-screen bg-white" style={{ fontFamily: '"Open Sans", sans-serif' }}>
      <Header />
      <Suspense fallback={<div className="min-h-screen" />}>
        <HeroSection />
        <NewsroomTabs />
      </Suspense>
      <Footer />
      <ScrollToTop />
    </div>
  );
}
