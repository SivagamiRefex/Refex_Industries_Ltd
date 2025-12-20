import { useState, useEffect } from 'react';
import { investorsCmsApi } from '../../../../services/api';

const API_BASE_URL = "";

interface Document {
  title: string;
  publishedDate: string;
  pdfUrl: string;
  year: string;
}

interface SecretarialComplianceReportPageContent {
  id?: number;
  slug: string;
  title: string;
  hasYearFilter: boolean;
  filterItems?: string[];
  sections: { title: string; documents: Document[] }[];
  isActive: boolean;
}

export default function InvestorSecretarialComplianceReportCMS() {
  const [pageContent, setPageContent] = useState<SecretarialComplianceReportPageContent>({
    slug: 'secretarial-compliance-report',
    title: 'Secretarial Compliance Report',
    hasYearFilter: true,
    filterItems: [],
    sections: [{ title: 'Secretarial Compliance Report', documents: [] }],
    isActive: true,
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [editingDocument, setEditingDocument] = useState<{ document: Document | null; documentIndex: number } | null>(null);
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

      // Upload to secretarial-compliance-report subfolder
      const response = await fetch(`${API_BASE_URL}/api/upload/pdf/secretarial-compliance-report`, {
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
      const data = await investorsCmsApi.getPageContentBySlug('secretarial-compliance-report');
      if (data) {
        setPageContent({
          ...data,
          sections: data.sections || [{ title: 'Secretarial Compliance Report', documents: [] }],
          filterItems: data.filterItems || [],
        });
      }
    } catch (err: any) {
      if (err.message && !err.message.includes('Backend server not available')) {
        setError(err.message || 'Failed to load Secretarial Compliance Report page');
      }
      // Use default structure if not found
      setPageContent({
        slug: 'secretarial-compliance-report',
        title: 'Secretarial Compliance Report',
        hasYearFilter: true,
        filterItems: [],
        sections: [{ title: 'Secretarial Compliance Report', documents: [] }],
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
        existingPage = await investorsCmsApi.getPageContentBySlug('secretarial-compliance-report');
      } catch (e) {
        // Page doesn't exist yet
      }

      if (existingPage && existingPage.id) {
        await investorsCmsApi.updatePageContent(existingPage.id, pageContent);
        setSuccess('Secretarial Compliance Report page updated successfully');
      } else {
        await investorsCmsApi.createPageContent(pageContent);
        setSuccess('Secretarial Compliance Report page created successfully');
      }
      
      // Reload the data to ensure we have the latest from the server
      await loadPageContent();
      setTimeout(() => setSuccess(''), 3000);
    } catch (err: any) {
      setError(err.message || 'Failed to save Secretarial Compliance Report page');
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

  const handleAddDocument = () => {
    setEditingDocument({
      document: {
        title: '',
        publishedDate: '',
        pdfUrl: '',
        year: '',
      },
      documentIndex: -1,
    });
    setShowDocumentForm(true);
    setError('');
  };

  const handleEditDocument = (documentIndex: number) => {
    const documents = pageContent.sections[0]?.documents || [];
    const document = documents[documentIndex];
    setEditingDocument({
      document: { ...document },
      documentIndex,
    });
    setShowDocumentForm(true);
    setError('');
  };

  const handleDeleteDocument = (documentIndex: number) => {
    if (!confirm('Are you sure you want to delete this document?')) {
      return;
    }
    const updatedSections = [...pageContent.sections];
    updatedSections[0].documents.splice(documentIndex, 1);
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
    if (!doc.publishedDate.trim()) {
      setError('Published date is required');
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
    if (!updatedSections[0]) {
      updatedSections[0] = { title: 'Secretarial Compliance Report', documents: [] };
    }
    
    if (editingDocument.documentIndex >= 0) {
      // Update existing document
      updatedSections[0].documents[editingDocument.documentIndex] = doc;
    } else {
      // Add new document
      updatedSections[0].documents.push(doc);
    }

    setPageContent({ ...pageContent, sections: updatedSections });
    setShowDocumentForm(false);
    setEditingDocument(null);
    setError('');
  };

  const documents = pageContent.sections[0]?.documents || [];

  if (loading) {
    return (
      <div className="bg-white rounded-lg shadow-sm p-6">
        <div className="text-center py-12">
          <div className="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <p className="mt-2 text-gray-600">Loading Secretarial Compliance Report page...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-lg shadow-sm p-6">
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Secretarial Compliance Report Page CMS</h2>
        <p className="text-sm text-gray-600 mt-1">Manage documents for the Secretarial Compliance Report page</p>
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
              placeholder="Secretarial Compliance Report"
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

      {/* Documents */}
      <div className="mb-6">
        <div className="flex justify-between items-center mb-4">
          <h3 className="text-lg font-semibold text-gray-900">Documents ({documents.length})</h3>
          <button
            onClick={handleAddDocument}
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            <i className="ri-add-line mr-2"></i>
            Add Document
          </button>
        </div>

        {/* Documents List */}
        {documents.length === 0 ? (
          <div className="text-center py-8 text-gray-500">
            No documents found. Click "Add Document" to create one.
          </div>
        ) : (
          <div className="space-y-2">
            {documents.map((doc, docIndex) => (
              <div key={docIndex} className="flex items-center justify-between p-3 bg-gray-50 rounded border border-gray-200">
                <div className="flex-1">
                  <p className="text-sm font-medium text-gray-900">{doc.title}</p>
                  <p className="text-xs text-gray-500">Published: {doc.publishedDate} | Year: {doc.year}</p>
                </div>
                <div className="flex gap-2">
                  <button
                    onClick={() => handleEditDocument(docIndex)}
                    className="text-blue-600 hover:text-blue-800 text-sm"
                  >
                    Edit
                  </button>
                  <button
                    onClick={() => handleDeleteDocument(docIndex)}
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
                placeholder="e.g., RIL – 24A Compliance Report"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Published Date * (DD/MM/YYYY)
              </label>
              <input
                type="text"
                className="w-full border-gray-300 rounded-lg shadow-sm focus:border-blue-500 focus:ring-blue-500"
                value={editingDocument.document.publishedDate}
                onChange={(e) => setEditingDocument({
                  ...editingDocument,
                  document: { ...editingDocument.document, publishedDate: e.target.value }
                })}
                placeholder="31/03/2025"
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
                  id="secretarialCompliancePdfUpload"
                  disabled={uploadingPdf}
                />
                <label
                  htmlFor="secretarialCompliancePdfUpload"
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

