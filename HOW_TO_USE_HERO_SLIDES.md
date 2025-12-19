# How to Use Hero Slides CMS Data

This guide explains how to use the generated CMS data files to populate your hero slides.

## 📋 Available Files

1. **`hero_slides_cms_data.json`** - Clean JSON format
2. **`hero_slides_cms_data.csv`** - CSV format for spreadsheet imports
3. **`hero_slides_api_payloads.md`** - API examples for different CMS platforms
4. **`hero_slides_seed_script.js`** - Automated seeding script

---

## 🚀 Method 1: Using the Admin Panel (Easiest)

### Step 1: Access Admin Panel
1. Go to: `http://localhost:3000/admin/login`
2. Login with:
   - Email: `admin@refex.com`
   - Password: `admin123`

### Step 2: Navigate to Hero Section CMS
1. Click **"Manage Home CMS"** button
2. You'll see the **Hero Section** tab (already selected)

### Step 3: Add Slides Manually
1. Click **"Add New Slide"** button
2. Fill in the form:
   - **Title**: `Ash Utilization And Coal Handling`
   - **Image URL**: `https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png`
   - **Order**: `1`
   - **Active**: ✓ (checked)
3. Click **"Create Slide"**
4. Repeat for all 4 slides

---

## 🚀 Method 2: Using the Seed Script (Automated)

### Step 1: Make sure backend is running
```bash
# Check if backend is running on port 8080
netstat -ano | findstr :8080
```

### Step 2: Run the seed script
```bash
# Navigate to project root
cd d:\webite_code\refex_industries

# Run the seed script using Node.js
node hero_slides_seed_script.js
```

**Note**: You may need to modify the script to use `require` or convert it to use your database models directly.

### Alternative: Use the seed script with your existing seed files
```bash
# Copy the data to your server/seeds folder
# Then create a proper seed script in server/scripts/
```

---

## 🚀 Method 3: Using cURL (Command Line)

### For Your Current Backend API

Open PowerShell or Command Prompt and run:

```bash
# Slide 1: Ash Utilization
curl -X POST http://localhost:8080/api/cms/home/slides ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Ash Utilization And Coal Handling\",\"image\":\"https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png\",\"order\":1,\"isActive\":true}"

# Slide 2: Green Mobility
curl -X POST http://localhost:8080/api/cms/home/slides ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Green Mobility\",\"image\":\"https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5e71896259f48aee41bb484bef88a501.png\",\"order\":2,\"isActive\":true}"

# Slide 3: Venwind Refex
curl -X POST http://localhost:8080/api/cms/home/slides ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Venwind Refex\",\"image\":\"https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/d1f932b601a9dab855d409f970966b38.png\",\"order\":3,\"isActive\":true}"

# Slide 4: Refrigerant Gas
curl -X POST http://localhost:8080/api/cms/home/slides ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Refrigerant Gas\",\"image\":\"https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/09e6f2b1e185a6c3f96a07b03bf381bc.png\",\"order\":4,\"isActive\":true}"
```

---

## 🚀 Method 4: Using Postman or API Client

### Step 1: Import the JSON data
1. Open Postman (or any API client)
2. Create a new POST request
3. URL: `http://localhost:8080/api/cms/home/slides`
4. Headers:
   - `Content-Type: application/json`
5. Body (raw JSON):
   ```json
   {
     "title": "Ash Utilization And Coal Handling",
     "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
     "order": 1,
     "isActive": true
   }
   ```
6. Send the request
7. Repeat for all 4 slides (change the data each time)

---

## 🚀 Method 5: Direct Database Insert (Advanced)

If you have direct database access:

### Using MySQL Workbench or phpMyAdmin:

```sql
INSERT INTO hero_slides (title, image, `order`, is_active, created_at, updated_at) VALUES
('Ash Utilization And Coal Handling', 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png', 1, 1, NOW(), NOW()),
('Green Mobility', 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5e71896259f48aee41bb484bef88a501.png', 2, 1, NOW(), NOW()),
('Venwind Refex', 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/d1f932b601a9dab855d409f970966b38.png', 3, 1, NOW(), NOW()),
('Refrigerant Gas', 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/09e6f2b1e185a6c3f96a07b03bf381bc.png', 4, 1, NOW(), NOW());
```

---

## 📝 Quick Copy-Paste Data

### Slide 1
```
Title: Ash Utilization And Coal Handling
Image: https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png
Order: 1
```

### Slide 2
```
Title: Green Mobility
Image: https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5e71896259f48aee41bb484bef88a501.png
Order: 2
```

### Slide 3
```
Title: Venwind Refex
Image: https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/d1f932b601a9dab855d409f970966b38.png
Order: 3
```

### Slide 4
```
Title: Refrigerant Gas
Image: https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/09e6f2b1e185a6c3f96a07b03bf381bc.png
Order: 4
```

---

## ✅ Verify After Import

1. Go to: `http://localhost:3000/admin/dashboard/home-cms`
2. You should see all 4 slides listed in the table
3. Check the home page: `http://localhost:3000` - the hero slider should display your slides

---

## 🎯 Recommended Method

**For beginners**: Use **Method 1 (Admin Panel)** - it's the easiest and most visual.

**For developers**: Use **Method 2 (Seed Script)** or **Method 3 (cURL)** for automation.

---

## ❓ Troubleshooting

### Backend not responding?
- Make sure backend is running: `netstat -ano | findstr :8080`
- Check server logs for errors

### CORS errors?
- Backend CORS is already configured
- Make sure you're using `http://localhost:8080` (not `https`)

### Data not showing?
- Check browser console for errors
- Verify database connection
- Check if slides are marked as `isActive: true`

