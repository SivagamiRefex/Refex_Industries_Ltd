# Flip Cards CMS Data - Summary

## 📋 Data Overview

Converted **3 flip cards** from the home page into CMS-ready formats.

---

## 📊 Card Details

### Card 1: Sustainability & ESG
- **Title**: Sustainability & ESG
- **Description**: Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.
- **Front Image**: `5c9042a5517cccc81c390f42360622c6.png`
- **Back Image**: `ff134ade3e7cdb06a591b9f787f35d1d.png`
- **Link**: `/esg/`
- **Slug**: `sustainability-esg`
- **Order**: 1

### Card 2: Investors
- **Title**: Investors
- **Description**: Explore our financial reports, stock information, investor presentations, and key announcements to learn more about how we're building a future-focused business.
- **Front Image**: `857fbfe05f675330f7e584bf0ab44ecc.png`
- **Back Image**: `4fdca67bdfb39a83d2b83210bb1b5cf3.png`
- **Link**: `/investors/`
- **Slug**: `investors`
- **Order**: 2

### Card 3: Life At Refex
- **Title**: Life At Refex
- **Description**: Empowering people, celebrating diversity, and creating a culture where everyone feels valued.
- **Front Image**: `8818c5d55c5844bdefd4f3d1721b90ed.png`
- **Back Image**: `c46bbd8b593bd9cb6b8790cb61632cd7.png`
- **Link**: `https://www.refex.group/careers/` (external link)
- **Slug**: `life-at-refex`
- **Order**: 3

---

## 📁 Generated Files

1. **`flip_cards_cms_data.json`** - Clean JSON format ready for import
2. **`flip_cards_cms_data.csv`** - CSV format for spreadsheet imports
3. **`flip_cards_api_payloads.md`** - API examples for different CMS platforms

---

## 🔑 Key Features

- ✅ **Dual Images**: Each card has both front and back images for flip animation
- ✅ **SEO-Friendly Slugs**: Auto-generated from titles
- ✅ **Order Management**: Cards can be reordered via the `order` field
- ✅ **Active Status**: Cards can be enabled/disabled via `isActive`
- ✅ **Flexible Links**: Supports both relative (`/esg/`) and absolute URLs (`https://...`)

---

## 🚀 Quick Copy-Paste Data

### Card 1
```json
{
  "title": "Sustainability & ESG",
  "description": "Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.",
  "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png",
  "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png",
  "link": "/esg/",
  "order": 1,
  "isActive": true
}
```

### Card 2
```json
{
  "title": "Investors",
  "description": "Explore our financial reports, stock information, investor presentations, and key announcements to learn more about how we're building a future-focused business.",
  "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/857fbfe05f675330f7e584bf0ab44ecc.png",
  "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/4fdca67bdfb39a83d2b83210bb1b5cf3.png",
  "link": "/investors/",
  "order": 2,
  "isActive": true
}
```

### Card 3
```json
{
  "title": "Life At Refex",
  "description": "Empowering people, celebrating diversity, and creating a culture where everyone feels valued.",
  "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/8818c5d55c5844bdefd4f3d1721b90ed.png",
  "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/c46bbd8b593bd9cb6b8790cb61632cd7.png",
  "link": "https://www.refex.group/careers/",
  "order": 3,
  "isActive": true
}
```

---

## 📝 Notes

- All images are hosted on `static.readdy.ai`
- Card 3 uses an external link (refex.group), while cards 1 & 2 use relative paths
- The flip animation is triggered on hover in the frontend component
- Back images are optional but recommended for better UX

