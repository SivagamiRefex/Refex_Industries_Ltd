# Flip Cards API POST Payloads

## Format 1: Single Object (Strapi/Directus Style)
```json
{
  "title": "Sustainability & ESG",
  "description": "Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.",
  "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png",
  "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png",
  "link": "/esg/",
  "slug": "sustainability-esg",
  "order": 1,
  "isActive": true
}
```

## Format 2: Batch Upload (Array)
```json
[
  {
    "title": "Sustainability & ESG",
    "description": "Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.",
    "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png",
    "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png",
    "link": "/esg/",
    "slug": "sustainability-esg",
    "order": 1,
    "isActive": true
  },
  {
    "title": "Investors",
    "description": "Explore our financial reports, stock information, investor presentations, and key announcements to learn more about how we're building a future-focused business.",
    "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/857fbfe05f675330f7e584bf0ab44ecc.png",
    "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/4fdca67bdfb39a83d2b83210bb1b5cf3.png",
    "link": "/investors/",
    "slug": "investors",
    "order": 2,
    "isActive": true
  },
  {
    "title": "Life At Refex",
    "description": "Empowering people, celebrating diversity, and creating a culture where everyone feels valued.",
    "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/8818c5d55c5844bdefd4f3d1721b90ed.png",
    "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/c46bbd8b593bd9cb6b8790cb61632cd7.png",
    "link": "https://www.refex.group/careers/",
    "slug": "life-at-refex",
    "order": 3,
    "isActive": true
  }
]
```

## Format 3: Sanity Style (with _type)
```json
{
  "_type": "flipCard",
  "title": "Sustainability & ESG",
  "description": "Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.",
  "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png",
  "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png",
  "link": "/esg/",
  "slug": {
    "_type": "slug",
    "current": "sustainability-esg"
  },
  "order": 1,
  "isActive": true
}
```

## Format 4: Your Backend API Format (if model exists)
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

## cURL Examples

### Single Flip Card
```bash
curl -X POST http://localhost:8080/api/cms/home/flip-cards \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Sustainability & ESG",
    "description": "Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.",
    "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png",
    "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png",
    "link": "/esg/",
    "order": 1,
    "isActive": true
  }'
```

### Strapi Example
```bash
curl -X POST http://localhost:1337/api/flip-cards \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d '{
    "data": {
      "title": "Sustainability & ESG",
      "description": "Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.",
      "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png",
      "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png",
      "link": "/esg/",
      "slug": "sustainability-esg",
      "order": 1,
      "isActive": true
    }
  }'
```

### Directus Example
```bash
curl -X POST http://localhost:8055/items/flip_cards \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "title": "Sustainability & ESG",
    "description": "Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.",
    "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5c9042a5517cccc81c390f42360622c6.png",
    "backImage": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/ff134ade3e7cdb06a591b9f787f35d1d.png",
    "link": "/esg/",
    "slug": "sustainability-esg",
    "order": 1,
    "isActive": true
  }'
```

## Data Structure Summary

Each flip card contains:
- **title**: Card title (e.g., "Sustainability & ESG")
- **description**: Card description text
- **image**: Front image URL
- **backImage**: Back image URL (shown when card flips)
- **link**: URL to navigate to (can be relative or absolute)
- **slug**: SEO-friendly URL slug (auto-generated)
- **order**: Display order (1, 2, 3...)
- **isActive**: Whether the card is active/visible

