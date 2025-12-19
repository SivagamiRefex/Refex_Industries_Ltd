import Header from '../home/components/Header';
import Footer from '../home/components/Footer';
import HeroSection from './components/HeroSection';
import OfficeAddresses from './components/OfficeAddresses';
import ContactForm from './components/ContactForm';
import ScrollToTop from '../home/components/ScrollToTop';

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-white" style={{ fontFamily: '"Open Sans", sans-serif' }}>
      <Header />
      <main className="pt-[116px]">
        <HeroSection />
        <OfficeAddresses />
        <ContactForm />
      </main>
      <Footer />
      <ScrollToTop />
    </div>
  );
}
