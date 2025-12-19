# Investor Pages Dynamic Implementation - Summary

## ✅ Completed Components

### 1. URL Auto-Generation
- Created `client/src/utils/slugify.ts` utility
- Updated `InvestorRelatedLinksCMS.tsx` to auto-generate URLs from link names
- URL format: `/investors/{slug}/` (e.g., "Financial Information" → "/investors/financial-information/")

### 2. Backend Infrastructure
- **Model**: `server/models/investors_page_content.js`
  - Stores: slug, title, hasYearFilter, sections (JSON), isActive
- **Controller**: Added to `server/controllers/investors_cms.js`
  - CRUD operations for page content
- **Routes**: Added to `server/routes/investors_cms.js`
  - GET `/api/cms/investors/page-content` - Get all pages
  - GET `/api/cms/investors/page-content/slug/:slug` - Get by slug
  - POST `/api/cms/investors/page-content` - Create page
  - PUT `/api/cms/investors/page-content/:id` - Update page
  - DELETE `/api/cms/investors/page-content/:id` - Delete page

### 3. Frontend API Methods
- Added to `client/src/services/api.ts`
  - `getAllPageContent()`
  - `getPageContentBySlug(slug)`
  - `createPageContent(pageContent)`
  - `updatePageContent(id, pageContent)`
  - `deletePageContent(id)`

## 📋 Remaining Implementation Steps

### Step 1: Create Generic Page Template Component
**File**: `client/src/pages/investors/[slug]/page.tsx`

This component should:
- Fetch page content by slug from API
- Display sidebar with related links (from RelatedLinks component)
- Show sections with documents (similar to financial-information page)
- Support year filter if `hasYearFilter` is true
- Handle view/download for PDF documents

### Step 2: Create CMS Component for Page Content
**File**: `client/src/pages/admin/dashboard/components/InvestorPageContentCMS.tsx`

This component should:
- List all investor pages
- Allow creating new pages (with slug auto-generated)
- Edit page content:
  - Title
  - Enable/disable year filter
  - Manage sections (add/edit/delete)
  - Manage documents within sections (add/edit/delete)
  - Each document: title, date, PDF URL, year

### Step 3: Add Dynamic Routing
**File**: `client/src/router/config.tsx`

Add a catch-all route:
```typescript
{
  path: '/investors/:slug',
  element: <InvestorDynamicPage />,
}
```

### Step 4: Update RelatedLinks CMS
When a new link is added:
- Option to automatically create a page
- Or show prompt to create page later

### Step 5: Page Content Structure
The `sections` JSON field should store:
```json
[
  {
    "title": "Financial Results",
    "documents": [
      {
        "title": "Un-Audited Financial Results – Q2 FY26",
        "date": "2025-11-04",
        "year": "2025-26",
        "pdfUrl": "https://example.com/doc.pdf"
      }
    ]
  },
  {
    "title": "Notice Of Board Meetings",
    "documents": [...]
  }
]
```

## 🎯 Quick Start Guide

1. **Add a new link in CMS**:
   - Go to Investors CMS → Related Links tab
   - Click "Add Link"
   - Enter link name (e.g., "Financial Information")
   - URL will be auto-generated
   - Save

2. **Create page content**:
   - Go to Investors CMS → Investor Pages tab (to be created)
   - Create new page with matching slug
   - Add sections and documents

3. **Access the page**:
   - Navigate to `/investors/{slug}` route

## 📝 Notes

- The generic page template should match the design of `/investors/financial-information/`
- All pages should use the same sidebar (RelatedLinks component)
- Year filter is optional per page
- Documents can have different sections per page

## 🔧 Next Actions

1. Implement the generic page template component
2. Create the CMS interface for page content management
3. Set up dynamic routing
4. Test end-to-end flow

