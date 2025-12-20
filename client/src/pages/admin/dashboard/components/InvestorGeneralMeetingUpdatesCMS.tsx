import { useState, useEffect } from 'react';
import { investorsCmsApi } from '../../../../services/api';

const API_BASE_URL = "";

interface Document {
  title: string;
  year: string;
  link: string;
  publishedDate?: string;
}

interface Section {
  title: string;
  documents: Document[];
}

interface GeneralMeetingUpdatesPage {
  id?: number;
  slug: string;
  title: string;
  hasYearFilter: boolean;
  filterItems?: string[]; // Array of filter items (years) for the filter dropdown
  sections: Section[];
  isActive: boolean;
}

export default function InvestorGeneralMeetingUpdatesCMS() {
  const [pageContent, setPageContent] = useState<GeneralMeetingUpdatesPage>({
    slug: 'general-meeting-updates',
    title: 'General Meeting Updates',
    hasYearFilter: true,
    filterItems: [],
    sections: [],
    isActive: true,
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [editingSection, setEditingSection] = useState<Section | null>(null);
  const [editingDocument, setEditingDocument] = useState<{ sectionIndex: number; document: Document | null; documentIndex: number } | null>(null);
  const [showSectionForm, setShowSectionForm] = useState(false);
  const [showDocumentForm, setShowDocumentForm] = useState(false);
  const [showFilterItemForm, setShowFilterItemForm] = useState(false);
  const [editingFilterItem, setEditingFilterItem] = useState<string>('');
  const [editingFilterIndex, setEditingFilterIndex] = useState<number>(-1);
  const [uploadingPdf, setUploadingPdf] = useState(false);

  const handlePdfUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !editingDocument?.document) return;

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

      const response = await fetch(`${API_BASE_URL}/api/upload/pdf/general-meeting-updates`, {
        method: 'POST',
        body: formData,
      });

      if (!response.ok) {
        throw new Error('Failed to upload PDF');
      }

      const data = await response.json();
      setEditingDocument({
        ...editingDocument,
        document: { ...editingDocument.document, link: data.pdfUrl }
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
      const data = await investorsCmsApi.getPageContentBySlug('general-meeting-updates');
      if (data) {
        // Handle both camelCase and snake_case from API response
        const filterItems = (data.filterItems || (data as any).filter_items || []);
        const pageData = {
          ...data,
          filterItems: Array.isArray(filterItems) ? filterItems : [],
        };
        setPageContent(pageData);
      }
    } catch (err: any) {
      if (err.message && !err.message.includes('Backend server not available')) {
        setError(err.message || 'Failed to load general meeting updates page');
      }
      // Use default structure if not found
      setPageContent({
        slug: 'general-meeting-updates',
        title: 'General Meeting Updates',
        hasYearFilter: true,
        filterItems: [],
        sections: [],
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
      const saveData = {
        ...pageContent,
        filterItems: pageContent.filterItems || [],
      };
      
      // Check if page exists
      let existingPage;
      try {
        existingPage = await investorsCmsApi.getPageContentBySlug('general-meeting-updates');
      } catch (e) {
        // Page doesn't exist yet
      }

      if (existingPage && existingPage.id) {
        await investorsCmsApi.updatePageContent(existingPage.id, saveData);
        setSuccess('General Meeting Updates page updated successfully');
      } else {
        await investorsCmsApi.createPageContent(saveData);
        setSuccess('General Meeting Updates page created successfully');
      }
      
      // Reload the data to ensure we have the latest from the server
      await loadPageContent();
      setTimeout(() => setSuccess(''), 3000);
    } catch (err: any) {
      setError(err.message || 'Failed to save general meeting updates page');
    }
  };

  const handleAddSection = () => {
    setEditingSection({
      title: '',
      documents: [],
    });
    setShowSectionForm(true);
    setError('');
  };

  const handleEditSection = (section: Section, index: number) => {
    setEditingSection({ ...section });
    setShowSectionForm(true);
    setError('');
  };

  const handleDeleteSection = (index: number) => {
    if (!confirm('Are you sure you want to delete this section? All documents in this section will also be deleted.')) {
      return;
    }
    const updatedSections = [...pageContent.sections];
    updatedSections.splice(index, 1);
    setPageContent({ ...pageContent, sections: updatedSections });
  };

  const handleSaveSection = () => {
    if (!editingSection || !editingSection.title.trim()) {
      setError('Section title is required');
      return;
    }

    const updatedSections = [...pageContent.sections];
    const existingIndex = updatedSections.findIndex(s => s.title === editingSection.title && s !== editingSection);
    
    if (existingIndex >= 0) {
      setError('A section with this title already exists');
      return;
    }

    const sectionIndex = updatedSections.findIndex(s => s.title === editingSection.title);
    if (sectionIndex >= 0) {
      // Update existing section
      updatedSections[sectionIndex] = editingSection;
    } else {
      // Add new section
      updatedSections.push(editingSection);
    }

    setPageContent({ ...pageContent, sections: updatedSections });
    setShowSectionForm(false);
    setEditingSection(null);
    setError('');
  };

  const handleAddDocument = (sectionIndex: number) => {
    setEditingDocument({
      sectionIndex,
      document: {
        title: '',
        year: '',
        link: '',
        publishedDate: '',
      },
      documentIndex: -1,
    });
    setShowDocumentForm(true);
    setError('');
  };

  const handleEditDocument = (sectionIndex: number, documentIndex: number) => {
    const document = pageContent.sections[sectionIndex].documents[documentIndex];
    setEditingDocument({
      sectionIndex,
      document: { ...document },
      documentIndex,
    });
    setShowDocumentForm(true);
    setError('');
  };

  const handleDeleteDocument = (sectionIndex: number, documentIndex: number) => {
    if (!confirm('Are you sure you want to delete this document?')) {
      return;
    }
    const updatedSections = [...pageContent.sections];
    updatedSections[sectionIndex].documents.splice(documentIndex, 1);
    setPageContent({ ...pageContent, sections: updatedSections });
  };

  const handleSaveDocument = () => {
    if (!editingDocument || !editingDocument.document) {
      return;
    }

    const doc = editingDocument.document;
    if (!doc.title.trim()) {
      setError('Document title is required');
      return;
    }
    if (!doc.link.trim()) {
      setError('Document link (URL) is required');
      return;
    }
    if (pageContent.hasYearFilter && !doc.year.trim()) {
      setError('Year is required when year filter is enabled');
      return;
    }

    const updatedSections = [...pageContent.sections];
    if (editingDocument.documentIndex >= 0) {
      // Update existing document
      updatedSections[editingDocument.sectionIndex].documents[editingDocument.documentIndex] = doc;
    } else {
      // Add new document
      updatedSections[editingDocument.sectionIndex].documents.push(doc);
    }

    setPageContent({ ...pageContent, sections: updatedSections });
    setShowDocumentForm(false);
    setEditingDocument(null);
    setError('');
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
          <p className="mt-2 text-gray-600">Loading general meeting updates page...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-lg shadow-sm p-6">
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-gray-900">General Meeting Updates Page CMS</h2>
        <p className="text-sm text-gray-600 mt-1">Manage sections and documents for the General Meeting Updates page</p>
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
              placeholder="General Meeting Updates"
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

      {/* Sections */}
      <div className="mb-6">
        <div className="flex justify-between items-center mb-4">
          <h3 className="text-lg font-semibold text-gray-900">Sections</h3>
          <button
            onClick={handleAddSection}
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            <i className="ri-add-line mr-2"></i>
            Add Section
          </button>
        </div>

        {/* Section Form */}
        {showSectionForm && editingSection && (
          <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
            <h4 className="text-md font-semibold text-gray-900 mb-4">
              {pageContent.sections.find(s => s.title === editingSection.title && s !== editingSection) ? 'Edit Section' : 'Add New Section'}
            </h4>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Section Title *
                </label>
                <input
                  type="text"
                  className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                  value={editingSection.title}
                  onChange={(e) => setEditingSection({ ...editingSection, title: e.target.value })}
                  placeholder="e.g., AGM Notice & Annual Report"
                />
              </div>
              <div className="flex gap-3">
                <button
                  onClick={handleSaveSection}
                  className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Save Section
                </button>
                <button
                  onClick={() => {
                    setShowSectionForm(false);
                    setEditingSection(null);
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

        {/* Sections List */}
        {pageContent.sections.length === 0 ? (
          <div className="text-center py-8 text-gray-500">
            No sections found. Click "Add Section" to create one.
          </div>
        ) : (
          <div className="space-y-4">
            {pageContent.sections.map((section, sectionIndex) => (
              <div key={sectionIndex} className="border border-gray-200 rounded-lg p-4">
                <div className="flex justify-between items-center mb-4">
                  <h4 className="text-md font-semibold text-gray-900">{section.title}</h4>
                  <div className="flex gap-2">
                    <button
                      onClick={() => handleEditSection(section, sectionIndex)}
                      className="text-blue-600 hover:text-blue-800 text-sm"
                    >
                      Edit
                    </button>
                    <button
                      onClick={() => handleDeleteSection(sectionIndex)}
                      className="text-red-600 hover:text-red-800 text-sm"
                    >
                      Delete
                    </button>
                  </div>
                </div>

                {/* Documents */}
                <div className="mb-4">
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-sm text-gray-600">Documents ({section.documents.length})</span>
                    <button
                      onClick={() => handleAddDocument(sectionIndex)}
                      className="text-sm text-blue-600 hover:text-blue-800"
                    >
                      + Add Document
                    </button>
                  </div>
                  {section.documents.length === 0 ? (
                    <p className="text-sm text-gray-500">No documents in this section.</p>
                  ) : (
                    <div className="space-y-2">
                      {section.documents.map((doc, docIndex) => (
                        <div key={docIndex} className="flex items-center justify-between p-2 bg-gray-50 rounded">
                          <div className="flex-1">
                            <p className="text-sm font-medium text-gray-900">{doc.title}</p>
                            <p className="text-xs text-gray-500">
                              Year: {doc.year || 'N/A'} {doc.publishedDate ? `| Published: ${doc.publishedDate}` : ''}
                            </p>
                          </div>
                          <div className="flex gap-2">
                            <button
                              onClick={() => handleEditDocument(sectionIndex, docIndex)}
                              className="text-blue-600 hover:text-blue-800 text-xs"
                            >
                              Edit
                            </button>
                            <button
                              onClick={() => handleDeleteDocument(sectionIndex, docIndex)}
                              className="text-red-600 hover:text-red-800 text-xs"
                            >
                              Delete
                            </button>
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Document Form */}
      {showDocumentForm && editingDocument && editingDocument.document && (
        <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
          <h4 className="text-md font-semibold text-gray-900 mb-4">
            {editingDocument.documentIndex >= 0 ? 'Edit Document' : 'Add New Document'}
          </h4>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Document Title *
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingDocument.document.title}
                onChange={(e) => setEditingDocument({
                  ...editingDocument,
                  document: { ...editingDocument.document, title: e.target.value }
                })}
                placeholder="e.g., AGM Notice & Annual Report 2025"
              />
            </div>
            {pageContent.hasYearFilter && (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Year *
                </label>
                <input
                  type="text"
                  className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                  value={editingDocument.document.year}
                  onChange={(e) => setEditingDocument({
                    ...editingDocument,
                    document: { ...editingDocument.document, year: e.target.value }
                  })}
                  placeholder="e.g., 2025-26"
                />
              </div>
            )}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Published Date (Optional)
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingDocument.document.publishedDate || ''}
                onChange={(e) => setEditingDocument({
                  ...editingDocument,
                  document: { ...editingDocument.document, publishedDate: e.target.value }
                })}
                placeholder="e.g., 30/06/2024"
              />
            </div>
            <div className={pageContent.hasYearFilter ? '' : 'md:col-span-2'}>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                PDF Document *
              </label>
              <div className="flex items-center gap-4 mb-2">
                <input
                  type="file"
                  accept="application/pdf"
                  onChange={handlePdfUpload}
                  className="hidden"
                  id="meetingPdfUpload"
                  disabled={uploadingPdf}
                />
                <label
                  htmlFor="meetingPdfUpload"
                  className={`px-4 py-2 rounded-lg cursor-pointer transition-colors ${
                    uploadingPdf
                      ? 'bg-gray-400 text-white cursor-not-allowed'
                      : 'bg-green-600 text-white hover:bg-green-700'
                  }`}
                >
                  {uploadingPdf ? 'Uploading...' : 'Upload PDF'}
                </label>
                {editingDocument.document.link && (
                  <span className="text-sm text-gray-600 truncate max-w-md">
                    {editingDocument.document.link}
                  </span>
                )}
              </div>
            </div>
            <div className="md:col-span-2 flex gap-3">
              <button
                onClick={handleSaveDocument}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                Save Document
              </button>
              <button
                onClick={() => {
                  setShowDocumentForm(false);
                  setEditingDocument(null);
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

