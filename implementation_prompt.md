# Implementation Guide: Global Date Visibility Pattern

This guide outlines how to implement a dual-toggle system for date visibility: one for the CMS input field and another for the public website.

## 1. CMS Frontend (Admin Dashboard)

### A. State & Interface Update
- Add `showPublishDate: boolean` and `showCmsPublishDate: boolean` to your page interface.
- Default both to `false` (unchecked).

### B. UI Component (General Settings)
Add two checkboxes in the page configuration section:

```tsx
<div className="flex items-center gap-4">
  <div className="flex items-center">
    <input
      type="checkbox"
      id="showCmsPublishDate"
      checked={pageContent.showCmsPublishDate}
      onChange={(e) => setPageContent({ ...pageContent, showCmsPublishDate: e.target.checked })}
      className="h-4 w-4 rounded"
    />
    <label htmlFor="showCmsPublishDate" className="ml-2 text-sm font-medium">Show Input in CMS</label>
  </div>
  <div className="flex items-center">
    <input
      type="checkbox"
      id="showPublishDate"
      checked={pageContent.showPublishDate}
      onChange={(e) => setPageContent({ ...pageContent, showPublishDate: e.target.checked })}
      className="h-4 w-4 rounded"
    />
    <label htmlFor="showPublishDate" className="ml-2 text-sm font-medium">Show on Website</label>
  </div>
</div>
```

### C. Conditional Form Rendering
Show the date input only when the CMS toggle is active:

```tsx
{pageContent.showCmsPublishDate && (
  <div>
    <label>Published Date</label>
    <input value={doc.date} onChange={...} />
  </div>
)}
```

---

## 2. Backend (Server)

### A. Model Definition
Add both columns to the Sequelize model:

```javascript
showPublishDate: { type: DataTypes.BOOLEAN, defaultValue: false },
showCmsPublishDate: { type: DataTypes.BOOLEAN, defaultValue: false }
```

### B. Controller (Handling Duality)
Ensure the controller handles both cases (camel/snake) during upserts:

```javascript
const payload = {
  showPublishDate: req.body.showPublishDate !== undefined 
    ? !!req.body.showPublishDate 
    : (req.body.show_publish_date !== undefined ? !!req.body.show_publish_date : page.showPublishDate),
  showCmsPublishDate: req.body.showCmsPublishDate !== undefined 
    ? !!req.body.showCmsPublishDate 
    : (req.body.show_cms_publish_date !== undefined ? !!req.body.show_cms_publish_date : page.showCmsPublishDate)
};
```

---

## 3. Public Frontend (Website)

### A. Conditional Rendering
Display the date based on the `showPublishDate` toggle:

```tsx
{pageContent.showPublishDate && doc.date && (
  <span>Published: {doc.date}</span>
)}
```

---

## 4. Database Migration
Ensure columns are added to existing tables:

```javascript
await queryInterface.addColumn('table', 'show_cms_publish_date', {
  type: Sequelize.BOOLEAN,
  defaultValue: false
});
```
