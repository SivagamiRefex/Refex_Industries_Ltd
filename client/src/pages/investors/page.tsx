import Header from '../home/components/Header';
import Footer from '../home/components/Footer';
import ScrollToTop from '../home/components/ScrollToTop';
import HeroSection from './components/HeroSection';
import StockQuote from './components/StockQuote';
import StockChart from './components/StockChart';
import RelatedLinks from './components/RelatedLinks';
import HistoricalStockQuote from './components/HistoricalStockQuote';
import WelcomeModal from '../home/components/WelcomeModal';

export default function InvestorsPage() {
  return (
    <div className="min-h-screen bg-white">
      <Header />
      <main className="pt-[116px]">
        <HeroSection />
        <StockQuote />
        <StockChart />
        <HistoricalStockQuote />
        <RelatedLinks />

      </main>
      <Footer />
      <WelcomeModal />

      <ScrollToTop />
    </div>
  );
}
