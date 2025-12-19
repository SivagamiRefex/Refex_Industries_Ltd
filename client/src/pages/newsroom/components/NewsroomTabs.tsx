import { useState, useEffect } from 'react';
import { newsroomCmsApi } from '../../../services/api';
import PressReleases from './PressReleases';
import Events from './Events';

interface NewsroomTab {
  id: number;
  key: string;
  label: string;
  order: number;
  isActive: boolean;
  isDefault: boolean;
}

export default function NewsroomTabs() {
  const [tabs, setTabs] = useState<NewsroomTab[]>([]);
  const [activeTab, setActiveTab] = useState<string>('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadTabs();
  }, []);

  const loadTabs = async () => {
    // Default fallback tabs
    const fallbackTabs: NewsroomTab[] = [
      {
        id: 1,
        key: 'press',
        label: 'Press Releases',
        order: 1,
        isActive: true,
        isDefault: true,
      },
      {
        id: 2,
        key: 'events',
        label: 'Events',
        order: 2,
        isActive: true,
        isDefault: false,
      },
    ];

    try {
      setLoading(true);
      const data = await newsroomCmsApi.getTabs();
      const activeTabs = (data || [])
        .filter((tab: NewsroomTab) => tab.isActive)
        .sort((a: NewsroomTab, b: NewsroomTab) => a.order - b.order);
      
      if (activeTabs.length === 0) {
        setTabs(fallbackTabs);
        setActiveTab(fallbackTabs.find(t => t.isDefault)?.key || fallbackTabs[0].key);
      } else {
        setTabs(activeTabs);
        const defaultTab = activeTabs.find(t => t.isDefault);
        setActiveTab(defaultTab?.key || activeTabs[0].key);
      }
    } catch (error) {
      console.error('Failed to fetch tabs:', error);
      // Fallback to default data on error
      setTabs(fallbackTabs);
      setActiveTab(fallbackTabs.find(t => t.isDefault)?.key || fallbackTabs[0].key);
    } finally {
      setLoading(false);
    }
  };

  const renderTabContent = () => {
    switch (activeTab) {
      case 'press':
        return <PressReleases />;
      case 'events':
        return <Events />;
      default:
        return null;
    }
  };

  if (loading) {
    return (
      <div className="bg-white py-16">
        <div className="max-w-7xl mx-auto px-6">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading tabs...</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (tabs.length === 0) {
    return null;
  }

  return (
    <div className="bg-white py-16">
      <div className="max-w-7xl mx-auto px-6">
        {/* Tab Buttons */}
        <div className="flex items-center justify-center gap-4 mb-12">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.key)}
              className={`px-[35px] py-[15px] rounded-full text-[17px] font-semibold transition-all cursor-pointer whitespace-nowrap ${
                activeTab === tab.key
                  ? 'bg-[#7dc244] text-white'
                  : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        {/* Tab Content */}
        {renderTabContent()}
      </div>
    </div>
  );
}
