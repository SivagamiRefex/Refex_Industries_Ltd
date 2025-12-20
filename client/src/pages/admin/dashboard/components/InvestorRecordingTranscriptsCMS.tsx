import { useState, useEffect } from 'react';
import { investorsCmsApi } from '../../../../services/api';

const API_BASE_URL = "";

interface Audio {
  name: string;
  year: string;
  audioUrl: string;
  pdfUrl: string;
}

interface RecordingTranscriptsPage {
  id?: number;
  slug: string;
  title: string;
  hasYearFilter: boolean;
  filterItems?: string[]; // Array of filter items (years) for the filter dropdown
  audios: Audio[];
  isActive: boolean;
}

export default function InvestorRecordingTranscriptsCMS() {
  const [pageContent, setPageContent] = useState<RecordingTranscriptsPage>({
    slug: 'recording-transcripts-of-post-earnings-quarterly-calls',
    title: 'Recording & Transcripts of Post Earnings / Quarterly Calls',
    hasYearFilter: true,
    filterItems: [],
    audios: [],
    isActive: true,
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [editingAudio, setEditingAudio] = useState<{ audio: Audio | null; audioIndex: number } | null>(null);
  const [showAudioForm, setShowAudioForm] = useState(false);
  const [showFilterItemForm, setShowFilterItemForm] = useState(false);
  const [editingFilterItem, setEditingFilterItem] = useState<string>('');
  const [editingFilterIndex, setEditingFilterIndex] = useState<number>(-1);
  const [uploadingAudio, setUploadingAudio] = useState(false);
  const [uploadingPdf, setUploadingPdf] = useState(false);

  const handlePdfUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !editingAudio?.audio) return;

    if (file.type !== 'application/pdf') {
      setError('Please select a PDF file');
      return;
    }

    if (file.size > 50 * 1024 * 1024) {
      setError('PDF size should be less than 50MB');
      return;
    }

    setUploadingPdf(true);
    setError('');

    try {
      const formData = new FormData();
      formData.append('pdf', file);

      // Upload transcript PDFs to recording-transcripts subfolder
      const response = await fetch(`${API_BASE_URL}/api/upload/pdf/recording-transcripts`, {
        method: 'POST',
        body: formData,
      });

      if (!response.ok) {
        throw new Error('Failed to upload PDF');
      }

      const data = await response.json();
      setEditingAudio({
        ...editingAudio,
        audio: { ...editingAudio.audio, pdfUrl: data.pdfUrl }
      });
      setSuccess('PDF uploaded successfully');
      setTimeout(() => setSuccess(''), 3000);
    } catch (err: any) {
      setError(err.message || 'Failed to upload PDF');
    } finally {
      setUploadingPdf(false);
    }
  };

  useEffect(() => {
    loadPageContent();
  }, []);

  const loadPageContent = async () => {
    try {
      setLoading(true);
      setError('');
      const data = await investorsCmsApi.getPageContentBySlug('recording-transcripts-of-post-earnings-quarterly-calls');
      if (data) {
        // Handle both camelCase and snake_case from API response
        const filterItems = (data.filterItems || (data as any).filter_items || []);
        // Handle audios - could be in sections[0].audios or directly in audios
        let audios: Audio[] = [];
        if (data.audios && Array.isArray(data.audios)) {
          audios = data.audios;
        } else if (data.sections && data.sections.length > 0 && data.sections[0].audios) {
          audios = data.sections[0].audios;
        }
        
        const pageData = {
          ...data,
          filterItems: Array.isArray(filterItems) ? filterItems : [],
          audios: audios,
        };
        setPageContent(pageData);
      }
    } catch (err: any) {
      if (err.message && !err.message.includes('Backend server not available')) {
        setError(err.message || 'Failed to load recording transcripts page');
      }
      // Use default structure if not found
      setPageContent({
        slug: 'recording-transcripts-of-post-earnings-quarterly-calls',
        title: 'Recording & Transcripts of Post Earnings / Quarterly Calls',
        hasYearFilter: true,
        filterItems: [],
        audios: [],
        isActive: true,
      });
    } finally {
      setLoading(false);
    }
  };

  const handleSave = async () => {
    try {
      setError('');
      setSuccess('');
      
      // Ensure filterItems is included and is an array
      // Store audios in sections[0].audios for consistency with other pages
      const saveData = {
        ...pageContent,
        filterItems: pageContent.filterItems || [],
        sections: [
          {
            title: 'Recording and Transcripts',
            documents: [],
            contents: [],
            audios: pageContent.audios || [],
          }
        ],
      };
      
      // Check if page exists
      let existingPage;
      try {
        existingPage = await investorsCmsApi.getPageContentBySlug('recording-transcripts-of-post-earnings-quarterly-calls');
      } catch (e) {
        // Page doesn't exist yet
      }

      if (existingPage && existingPage.id) {
        await investorsCmsApi.updatePageContent(existingPage.id, saveData);
        setSuccess('Recording Transcripts page updated successfully');
      } else {
        await investorsCmsApi.createPageContent(saveData);
        setSuccess('Recording Transcripts page created successfully');
      }
      
      // Reload the data to ensure we have the latest from the server
      await loadPageContent();
      setTimeout(() => setSuccess(''), 3000);
    } catch (err: any) {
      setError(err.message || 'Failed to save recording transcripts page');
    }
  };

  const handleAddAudio = () => {
    setEditingAudio({
      audio: {
        name: '',
        year: '',
        audioUrl: '',
        pdfUrl: '',
      },
      audioIndex: -1,
    });
    setShowAudioForm(true);
    setError('');
  };

  const handleEditAudio = (audioIndex: number) => {
    const audio = pageContent.audios[audioIndex];
    setEditingAudio({
      audio: { ...audio },
      audioIndex,
    });
    setShowAudioForm(true);
    setError('');
  };

  const handleDeleteAudio = (audioIndex: number) => {
    if (!confirm('Are you sure you want to delete this audio recording?')) {
      return;
    }
    const updatedAudios = [...pageContent.audios];
    updatedAudios.splice(audioIndex, 1);
    setPageContent({ ...pageContent, audios: updatedAudios });
  };

  const handleSaveAudio = () => {
    if (!editingAudio || !editingAudio.audio) {
      return;
    }

    const audio = editingAudio.audio;
    if (!audio.name.trim()) {
      setError('Audio name is required');
      return;
    }
    if (!audio.audioUrl.trim()) {
      setError('Audio URL is required');
      return;
    }
    if (!audio.pdfUrl.trim()) {
      setError('Transcript PDF URL is required');
      return;
    }
    if (pageContent.hasYearFilter && !audio.year.trim()) {
      setError('Year is required when year filter is enabled');
      return;
    }

    const updatedAudios = [...pageContent.audios];
    if (editingAudio.audioIndex >= 0) {
      // Update existing audio
      updatedAudios[editingAudio.audioIndex] = audio;
    } else {
      // Add new audio
      updatedAudios.push(audio);
    }

    setPageContent({ ...pageContent, audios: updatedAudios });
    setShowAudioForm(false);
    setEditingAudio(null);
    setError('');
  };

  const handleAudioFileUpload = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) return;

    // Validate file type
    const allowedTypes = ['audio/mpeg', 'audio/mp3', 'audio/wav', 'audio/m4a', 'audio/ogg', 'audio/aac'];
    if (!allowedTypes.includes(file.type)) {
      setError('Please upload a valid audio file (mp3, wav, m4a, ogg, aac)');
      return;
    }

    // Validate file size (50MB limit)
    if (file.size > 50 * 1024 * 1024) {
      setError('Audio file size must be less than 50MB');
      return;
    }

    try {
      setUploadingAudio(true);
      setError('');

      const formData = new FormData();
      formData.append('audio', file);

      const response = await fetch('http://localhost:8080/api/upload/audio', {
        method: 'POST',
        body: formData,
      });

      if (!response.ok) {
        throw new Error('Failed to upload audio file');
      }

      const data = await response.json();
      if (data.success && data.audioUrl) {
        // Use the full URL from the server
        const fullAudioUrl = data.audioUrl.startsWith('http') 
          ? data.audioUrl 
          : `http://localhost:8080${data.audioUrl}`;
        
        if (editingAudio) {
          setEditingAudio({
            ...editingAudio,
            audio: {
              ...editingAudio.audio!,
              audioUrl: fullAudioUrl,
            }
          });
        }
        setSuccess('Audio file uploaded successfully');
        setTimeout(() => setSuccess(''), 3000);
      } else {
        throw new Error(data.error || 'Failed to upload audio');
      }
    } catch (err: any) {
      setError(err.message || 'Failed to upload audio file');
    } finally {
      setUploadingAudio(false);
    }
  };

  const handleAddFilterItem = () => {
    setEditingFilterItem('');
    setEditingFilterIndex(-1);
    setShowFilterItemForm(true);
    setError('');
  };

  const handleEditFilterItem = (index: number) => {
    const filterItems = pageContent.filterItems || [];
    setEditingFilterItem(filterItems[index]);
    setEditingFilterIndex(index);
    setShowFilterItemForm(true);
    setError('');
  };

  const handleDeleteFilterItem = (index: number) => {
    if (!confirm('Are you sure you want to delete this filter item?')) {
      return;
    }
    const filterItems = [...(pageContent.filterItems || [])];
    filterItems.splice(index, 1);
    setPageContent({ ...pageContent, filterItems });
  };

  const handleSaveFilterItem = () => {
    if (!editingFilterItem.trim()) {
      setError('Filter item (year) is required');
      return;
    }

    const filterItems = [...(pageContent.filterItems || [])];
    
    // Check for duplicates
    if (filterItems.includes(editingFilterItem.trim()) && editingFilterIndex < 0) {
      setError('This filter item already exists');
      return;
    }

    if (editingFilterIndex >= 0) {
      // Update existing filter item
      filterItems[editingFilterIndex] = editingFilterItem.trim();
    } else {
      // Add new filter item
      filterItems.push(editingFilterItem.trim());
    }

    // Sort filter items in descending order (newest first)
    filterItems.sort((a, b) => b.localeCompare(a));

    setPageContent({ ...pageContent, filterItems });
    setEditingFilterItem('');
    setEditingFilterIndex(-1);
    setShowFilterItemForm(false);
    setError('');
  };

  if (loading) {
    return (
      <div className="bg-white rounded-lg shadow-sm p-6">
        <div className="text-center py-12">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-gray-600">Loading recording transcripts page...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-lg shadow-sm p-6">
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Recording Transcripts Page CMS</h2>
        <p className="text-sm text-gray-600 mt-1">Manage audio recordings and transcripts for the Recording & Transcripts page</p>
      </div>

      {/* Messages */}
      {error && (
        <div className="mb-4 p-4 bg-red-50 border border-red-200 text-red-700 rounded-lg">
          {error}
        </div>
      )}
      {success && (
        <div className="mb-4 p-4 bg-green-50 border border-green-200 text-green-700 rounded-lg">
          {success}
        </div>
      )}

      {/* General Settings */}
      <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">General Settings</h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Page Title *
            </label>
            <input
              type="text"
              className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
              value={pageContent.title}
              onChange={(e) => setPageContent({ ...pageContent, title: e.target.value })}
              placeholder="Recording & Transcripts of Post Earnings / Quarterly Calls"
            />
          </div>
          <div className="flex items-center">
            <input
              type="checkbox"
              id="hasYearFilter"
              checked={pageContent.hasYearFilter}
              onChange={(e) => setPageContent({ ...pageContent, hasYearFilter: e.target.checked })}
              className="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
            />
            <label htmlFor="hasYearFilter" className="ml-2 block text-sm text-gray-900">
              Enable Year Filter
            </label>
          </div>
          <div className="flex items-center">
            <input
              type="checkbox"
              id="isActive"
              checked={pageContent.isActive}
              onChange={(e) => setPageContent({ ...pageContent, isActive: e.target.checked })}
              className="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
            />
            <label htmlFor="isActive" className="ml-2 block text-sm text-gray-900">
              Active
            </label>
          </div>
        </div>
      </div>

      {/* Filter Items Management */}
      {pageContent.hasYearFilter && (
        <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
          <div className="flex justify-between items-center mb-4">
            <div>
              <h3 className="text-lg font-semibold text-gray-900">Filter Items (Years)</h3>
              <p className="text-sm text-gray-600 mt-1">Manage the years available in the filter dropdown</p>
            </div>
            <button
              onClick={handleAddFilterItem}
              className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
            >
              <i className="ri-add-line mr-2"></i>
              Add Filter Item
            </button>
          </div>

          {/* Filter Item Form */}
          {showFilterItemForm && (
            <div className="mb-4 p-4 bg-white rounded-lg border border-gray-300">
              <h4 className="text-md font-semibold text-gray-900 mb-4">
                {editingFilterIndex >= 0 ? 'Edit Filter Item' : 'Add New Filter Item'}
              </h4>
              <div className="flex gap-3">
                <input
                  type="text"
                  className="flex-1 border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                  value={editingFilterItem}
                  onChange={(e) => setEditingFilterItem(e.target.value)}
                  placeholder="e.g., 2025-26"
                />
                <button
                  onClick={handleSaveFilterItem}
                  className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Save
                </button>
                <button
                  onClick={() => {
                    setEditingFilterItem('');
                    setEditingFilterIndex(-1);
                    setShowFilterItemForm(false);
                    setError('');
                  }}
                  className="px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors"
                >
                  Cancel
                </button>
              </div>
            </div>
          )}

          {/* Filter Items List */}
          {pageContent.filterItems && Array.isArray(pageContent.filterItems) && pageContent.filterItems.length > 0 ? (
            <div className="space-y-2">
              {pageContent.filterItems.map((item, index) => (
                <div key={index} className="flex items-center justify-between p-3 bg-white rounded border border-gray-200">
                  <span className="text-sm font-medium text-gray-900">FY {item}</span>
                  <div className="flex gap-2">
                    <button
                      onClick={() => handleEditFilterItem(index)}
                      className="text-blue-600 hover:text-blue-800 text-sm"
                    >
                      Edit
                    </button>
                    <button
                      onClick={() => handleDeleteFilterItem(index)}
                      className="text-red-600 hover:text-red-800 text-sm"
                    >
                      Delete
                    </button>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className="text-center py-4 text-gray-500 text-sm">
              No filter items found. Click "Add Filter Item" to create one.
            </div>
          )}
        </div>
      )}

      {/* Audio Recordings */}
      <div className="mb-6">
        <div className="flex justify-between items-center mb-4">
          <h3 className="text-lg font-semibold text-gray-900">Audio Recordings ({pageContent.audios.length})</h3>
          <button
            onClick={handleAddAudio}
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            <i className="ri-add-line mr-2"></i>
            Add Audio Recording
          </button>
        </div>

        {/* Audio List */}
        {pageContent.audios.length === 0 ? (
          <div className="text-center py-8 text-gray-500">
            No audio recordings found. Click "Add Audio Recording" to create one.
          </div>
        ) : (
          <div className="space-y-2">
            {pageContent.audios.map((audio, audioIndex) => (
              <div key={audioIndex} className="flex items-center justify-between p-3 bg-gray-50 rounded border border-gray-200">
                <div className="flex-1">
                  <p className="text-sm font-medium text-gray-900">{audio.name}</p>
                  <p className="text-xs text-gray-500">
                    Year: {audio.year || 'N/A'}
                  </p>
                </div>
                <div className="flex gap-2">
                  <button
                    onClick={() => handleEditAudio(audioIndex)}
                    className="text-blue-600 hover:text-blue-800 text-sm"
                  >
                    Edit
                  </button>
                  <button
                    onClick={() => handleDeleteAudio(audioIndex)}
                    className="text-red-600 hover:text-red-800 text-sm"
                  >
                    Delete
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Audio Form */}
      {showAudioForm && editingAudio && editingAudio.audio && (
        <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
          <h4 className="text-md font-semibold text-gray-900 mb-4">
            {editingAudio.audioIndex >= 0 ? 'Edit Audio Recording' : 'Add New Audio Recording'}
          </h4>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Recording Name/Title *
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingAudio.audio.name}
                onChange={(e) => setEditingAudio({
                  ...editingAudio,
                  audio: { ...editingAudio.audio, name: e.target.value }
                })}
                placeholder="e.g., Audio Recordings of Earnings Conference Call – Q2 FY 26"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Year {pageContent.hasYearFilter ? '*' : ''}
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingAudio.audio.year}
                onChange={(e) => setEditingAudio({
                  ...editingAudio,
                  audio: { ...editingAudio.audio, year: e.target.value }
                })}
                placeholder="e.g., 2025-26"
              />
            </div>
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Audio File *
              </label>
              <div className="flex gap-3">
                <input
                  type="file"
                  accept="audio/*"
                  onChange={handleAudioFileUpload}
                  disabled={uploadingAudio}
                  className="flex-1 border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                />
                {uploadingAudio && (
                  <div className="flex items-center text-sm text-gray-600">
                    <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-blue-600 mr-2"></div>
                    Uploading...
                  </div>
                )}
              </div>
              {editingAudio.audio.audioUrl && (
                <p className="mt-2 text-xs text-gray-500">
                  Current: <a href={editingAudio.audio.audioUrl} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">{editingAudio.audio.audioUrl}</a>
                </p>
              )}
            </div>
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Audio URL (Manual Entry) *
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingAudio.audio.audioUrl}
                onChange={(e) => setEditingAudio({
                  ...editingAudio,
                  audio: { ...editingAudio.audio, audioUrl: e.target.value }
                })}
                placeholder="https://example.com/audio.mp3 or upload file above"
              />
            </div>
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Transcript PDF *
              </label>
              <div className="flex items-center gap-4 mb-2">
                <input
                  type="file"
                  accept="application/pdf"
                  onChange={handlePdfUpload}
                  className="hidden"
                  id="transcriptPdfUpload"
                  disabled={uploadingPdf}
                />
                <label
                  htmlFor="transcriptPdfUpload"
                  className={`px-4 py-2 rounded-lg cursor-pointer transition-colors ${
                    uploadingPdf
                      ? 'bg-gray-400 text-white cursor-not-allowed'
                      : 'bg-green-600 text-white hover:bg-green-700'
                  }`}
                >
                  {uploadingPdf ? 'Uploading...' : 'Upload PDF'}
                </label>
                {editingAudio.audio.pdfUrl && (
                  <span className="text-sm text-gray-600 truncate max-w-md">
                    {editingAudio.audio.pdfUrl}
                  </span>
                )}
              </div>
            </div>
            <div className="md:col-span-2 flex gap-3">
              <button
                onClick={handleSaveAudio}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                Save Audio Recording
              </button>
              <button
                onClick={() => {
                  setShowAudioForm(false);
                  setEditingAudio(null);
                  setError('');
                }}
                className="px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-colors"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Save Button */}
      <div className="mt-6 flex justify-end">
        <button
          onClick={handleSave}
          className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
        >
          Save All Changes
        </button>
      </div>
    </div>
  );
}

