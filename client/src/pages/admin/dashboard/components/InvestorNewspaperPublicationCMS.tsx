import { useState, useEffect } from 'react';
import { investorsCmsApi } from '../../../../services/api';

const API_BASE_URL = "";

interface Document {
  title: string;
  publishedDate?: string;
  pdfUrl: string;
  year: string;
}

interface Section {
  title: string;
  documents: Document[];
}

interface NewspaperPublicationPageContent {
  id?: number;
  slug: string;
  title: string;
  hasYearFilter: boolean;
  filterItems?: string[];
  sections: Section[];
  isActive: boolean;
}

export default function InvestorNewspaperPublicationCMS() {
  const [pageContent, setPageContent] = useState<NewspaperPublicationPageContent>({
    slug: 'newspaper-publication',
    title: 'Newspaper Publication',
    hasYearFilter: true,
    filterItems: [],
    sections: [],
    isActive: true,
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [editingSection, setEditingSection] = useState<{ section: Section | null; sectionIndex: number } | null>(null);
  const [showSectionForm, setShowSectionForm] = useState(false);
  const [editingDocument, setEditingDocument] = useState<{ document: Document | null; sectionIndex: number; documentIndex: number } | null>(null);
  const [showDocumentForm, setShowDocumentForm] = useState(false);
  const [newFilterItem, setNewFilterItem] = useState('');
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

      // Upload to newspaper-publication subfolder
      const response = await fetch(`${API_BASE_URL}/api/upload/pdf/newspaper-publication`, {
        method: 'POST',
        body: formData,
      });

      if (!response.ok) {
        throw new Error('Failed to upload PDF');
      }

      const data = await response.json();
      setEditingDocument({
        ...editingDocument,
        document: { ...editingDocument.document, pdfUrl: data.pdfUrl }
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
      const data = await investorsCmsApi.getPageContentBySlug('newspaper-publication');
      if (data) {
        setPageContent({
          ...data,
          sections: data.sections || [],
          filterItems: data.filterItems || [],
        });
      }
    } catch (err: any) {
      if (err.message && !err.message.includes('Backend server not available')) {
        setError(err.message || 'Failed to load Newspaper Publication page');
      }
      // Use default structure if not found
      setPageContent({
        slug: 'newspaper-publication',
        title: 'Newspaper Publication',
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
      
      // Check if page exists
      let existingPage;
      try {
        existingPage = await investorsCmsApi.getPageContentBySlug('newspaper-publication');
      } catch (e) {
        // Page doesn't exist yet
      }

      if (existingPage && existingPage.id) {
        await investorsCmsApi.updatePageContent(existingPage.id, pageContent);
        setSuccess('Newspaper Publication page updated successfully');
      } else {
        await investorsCmsApi.createPageContent(pageContent);
        setSuccess('Newspaper Publication page created successfully');
      }
      
      // Reload the data to ensure we have the latest from the server
      await loadPageContent();
      setTimeout(() => setSuccess(''), 3000);
    } catch (err: any) {
      setError(err.message || 'Failed to save Newspaper Publication page');
    }
  };

  const handleAddFilterItem = () => {
    if (!newFilterItem.trim()) {
      setError('Please enter a year (e.g., 2024-25)');
      return;
    }
    const filterItems = pageContent.filterItems || [];
    if (filterItems.includes(newFilterItem)) {
      setError('This year already exists in the filter list');
      return;
    }
    setPageContent({
      ...pageContent,
      filterItems: [...filterItems, newFilterItem].sort((a, b) => {
        const yearA = parseInt(a.split('-')[0]);
        const yearB = parseInt(b.split('-')[0]);
        return yearB - yearA;
      }),
    });
    setNewFilterItem('');
    setError('');
  };

  const handleDeleteFilterItem = (item: string) => {
    const filterItems = pageContent.filterItems || [];
    setPageContent({
      ...pageContent,
      filterItems: filterItems.filter(f => f !== item),
    });
  };

  const handleAddSection = () => {
    setEditingSection({
      section: {
        title: '',
        documents: [],
      },
      sectionIndex: -1,
    });
    setShowSectionForm(true);
    setError('');
  };

  const handleEditSection = (sectionIndex: number) => {
    const section = pageContent.sections[sectionIndex];
    setEditingSection({
      section: { ...section },
      sectionIndex,
    });
    setShowSectionForm(true);
    setError('');
  };

  const handleDeleteSection = (sectionIndex: number) => {
    if (!confirm('Are you sure you want to delete this category? All documents in this category will be deleted.')) {
      return;
    }
    const updatedSections = [...pageContent.sections];
    updatedSections.splice(sectionIndex, 1);
    setPageContent({ ...pageContent, sections: updatedSections });
  };

  const handleSaveSection = () => {
    if (!editingSection || !editingSection.section) {
      return;
    }

    const section = editingSection.section;
    if (!section.title.trim()) {
      setError('Category title is required');
      return;
    }

    const updatedSections = [...pageContent.sections];
    if (editingSection.sectionIndex >= 0) {
      // Update existing section
      updatedSections[editingSection.sectionIndex] = section;
    } else {
      // Add new section
      updatedSections.push(section);
    }

    setPageContent({ ...pageContent, sections: updatedSections });
    setShowSectionForm(false);
    setEditingSection(null);
    setError('');
  };

  const handleAddDocument = (sectionIndex: number) => {
    setEditingDocument({
      document: {
        title: '',
        publishedDate: '',
        pdfUrl: '',
        year: '',
      },
      sectionIndex,
      documentIndex: -1,
    });
    setShowDocumentForm(true);
    setError('');
  };

  const handleEditDocument = (sectionIndex: number, documentIndex: number) => {
    const document = pageContent.sections[sectionIndex].documents[documentIndex];
    setEditingDocument({
      document: { ...document },
      sectionIndex,
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
    if (!doc.year.trim()) {
      setError('Year is required');
      return;
    }
    if (!doc.pdfUrl.trim()) {
      setError('PDF URL is required');
      return;
    }

    // Add year to filterItems if not already present
    const filterItems = pageContent.filterItems || [];
    if (!filterItems.includes(doc.year)) {
      const updatedFilterItems = [...filterItems, doc.year].sort((a, b) => {
        const yearA = parseInt(a.split('-')[0]);
        const yearB = parseInt(b.split('-')[0]);
        return yearB - yearA;
      });
      setPageContent({ ...pageContent, filterItems: updatedFilterItems });
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

  if (loading) {
    return (
      <div className="bg-white rounded-lg shadow-sm p-6">
        <div className="text-center py-12">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-gray-600">Loading Newspaper Publication page...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-lg shadow-sm p-6">
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Newspaper Publication Page CMS</h2>
        <p className="text-sm text-gray-600 mt-1">Manage categories and documents for the Newspaper Publication page</p>
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
              placeholder="Newspaper Publication"
            />
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

      {/* Year Filter Items */}
      <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Year Filter Items</h3>
        <div className="mb-4 flex gap-2">
          <input
            type="text"
            className="flex-1 border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
            value={newFilterItem}
            onChange={(e) => setNewFilterItem(e.target.value)}
            placeholder="e.g., 2024-25"
            onKeyPress={(e) => {
              if (e.key === 'Enter') {
                e.preventDefault();
                handleAddFilterItem();
              }
            }}
          />
          <button
            onClick={handleAddFilterItem}
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            Add Year
          </button>
        </div>
        <div className="flex flex-wrap gap-2">
          {(pageContent.filterItems || []).map((item, index) => (
            <span
              key={index}
              className="inline-flex items-center gap-2 px-3 py-1 bg-blue-100 text-blue-800 rounded-lg text-sm"
            >
              {item}
              <button
                onClick={() => handleDeleteFilterItem(item)}
                className="text-blue-600 hover:text-blue-800"
              >
                ×
              </button>
            </span>
          ))}
        </div>
      </div>

      {/* Categories (Sections) */}
      <div className="mb-6">
        <div className="flex justify-between items-center mb-4">
          <h3 className="text-lg font-semibold text-gray-900">Categories ({pageContent.sections.length})</h3>
          <button
            onClick={handleAddSection}
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            <i className="ri-add-line mr-2"></i>
            Add Category
          </button>
        </div>

        {/* Sections List */}
        {pageContent.sections.length === 0 ? (
          <div className="text-center py-8 text-gray-500">
            No categories found. Click "Add Category" to create one.
          </div>
        ) : (
          <div className="space-y-6">
            {pageContent.sections.map((section, sectionIndex) => (
              <div key={sectionIndex} className="border border-gray-200 rounded-lg p-4">
                <div className="flex justify-between items-center mb-4">
                  <h4 className="text-md font-semibold text-gray-900">{section.title}</h4>
                  <div className="flex gap-2">
                    <button
                      onClick={() => handleEditSection(sectionIndex)}
                      className="text-blue-600 hover:text-blue-800 text-sm"
                    >
                      Edit Category
                    </button>
                    <button
                      onClick={() => handleDeleteSection(sectionIndex)}
                      className="text-red-600 hover:text-red-800 text-sm"
                    >
                      Delete Category
                    </button>
                  </div>
                </div>

                {/* Documents in Section */}
                <div className="mb-4">
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-sm text-gray-600">Documents ({section.documents.length})</span>
                    <button
                      onClick={() => handleAddDocument(sectionIndex)}
                      className="px-3 py-1 bg-green-600 text-white text-sm rounded hover:bg-green-700 transition-colors"
                    >
                      <i className="ri-add-line mr-1"></i>
                      Add Document
                    </button>
                  </div>

                  {section.documents.length === 0 ? (
                    <div className="text-sm text-gray-500 py-2">No documents in this category.</div>
                  ) : (
                    <div className="space-y-2">
                      {section.documents.map((doc, docIndex) => (
                        <div key={docIndex} className="flex items-center justify-between p-2 bg-gray-50 rounded border border-gray-200">
                          <div className="flex-1">
                            <p className="text-sm font-medium text-gray-900">{doc.title}</p>
                            <p className="text-xs text-gray-500">
                              {doc.publishedDate && `Published: ${doc.publishedDate} | `}Year: {doc.year}
                            </p>
                          </div>
                          <div className="flex gap-2">
                            <button
                              onClick={() => handleEditDocument(sectionIndex, docIndex)}
                              className="text-blue-600 hover:text-blue-800 text-sm"
                            >
                              Edit
                            </button>
                            <button
                              onClick={() => handleDeleteDocument(sectionIndex, docIndex)}
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
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Section Form */}
      {showSectionForm && editingSection && editingSection.section && (
        <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
          <h4 className="text-md font-semibold text-gray-900 mb-4">
            {editingSection.sectionIndex >= 0 ? 'Edit Category' : 'Add New Category'}
          </h4>
          <div className="grid grid-cols-1 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Category Title *
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingSection.section.title}
                onChange={(e) => setEditingSection({
                  ...editingSection,
                  section: { ...editingSection.section, title: e.target.value }
                })}
                placeholder="e.g., AGM, June 2025, Postal ballot"
              />
            </div>
            <div className="flex gap-3">
              <button
                onClick={handleSaveSection}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                Save Category
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

      {/* Document Form */}
      {showDocumentForm && editingDocument && editingDocument.document && (
        <div className="mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
          <h4 className="text-md font-semibold text-gray-900 mb-4">
            {editingDocument.documentIndex >= 0 ? 'Edit Document' : 'Add New Document'}
            {editingDocument.sectionIndex >= 0 && (
              <span className="text-sm text-gray-600 font-normal ml-2">
                (in {pageContent.sections[editingDocument.sectionIndex]?.title})
              </span>
            )}
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
                placeholder="e.g., 23rd AGM – Notice – Newspaper Publication – 2025"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Published Date (DD/MM/YYYY)
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingDocument.document.publishedDate || ''}
                onChange={(e) => setEditingDocument({
                  ...editingDocument,
                  document: { ...editingDocument.document, publishedDate: e.target.value }
                })}
                placeholder="e.g., 13/08/2025"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Year * (e.g., 2024-25)
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingDocument.document.year}
                onChange={(e) => setEditingDocument({
                  ...editingDocument,
                  document: { ...editingDocument.document, year: e.target.value }
                })}
                placeholder="2024-25"
              />
            </div>
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-2">
                PDF Document *
              </label>
              <div className="flex items-center gap-4 mb-2">
                <input
                  type="file"
                  accept="application/pdf"
                  onChange={handlePdfUpload}
                  className="hidden"
                  id="newspaperPdfUpload"
                  disabled={uploadingPdf}
                />
                <label
                  htmlFor="newspaperPdfUpload"
                  className={`px-4 py-2 rounded-lg cursor-pointer transition-colors ${
                    uploadingPdf
                      ? 'bg-gray-400 text-white cursor-not-allowed'
                      : 'bg-green-600 text-white hover:bg-green-700'
                  }`}
                >
                  {uploadingPdf ? 'Uploading...' : 'Upload PDF'}
                </label>
                {editingDocument.document.pdfUrl && (
                  <span className="text-sm text-gray-600 truncate max-w-md">
                    {editingDocument.document.pdfUrl}
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

