# Hero Slides API POST Payloads

## Format 1: Strapi/Directus Style (Single Object)
```json
{
  "title": "Ash Utilization And Coal Handling",
  "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
  "slug": "ash-utilization-and-coal-handling",
  "order": 1,
  "isActive": true
}
```

## Format 2: Batch Upload (Array)
```json
[
  {
    "title": "Ash Utilization And Coal Handling",
    "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
    "slug": "ash-utilization-and-coal-handling",
    "order": 1,
    "isActive": true
  },
  {
    "title": "Green Mobility",
    "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5e71896259f48aee41bb484bef88a501.png",
    "slug": "green-mobility",
    "order": 2,
    "isActive": true
  },
  {
    "title": "Venwind Refex",
    "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/d1f932b601a9dab855d409f970966b38.png",
    "slug": "venwind-refex",
    "order": 3,
    "isActive": true
  },
  {
    "title": "Refrigerant Gas",
    "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/09e6f2b1e185a6c3f96a07b03bf381bc.png",
    "slug": "refrigerant-gas",
    "order": 4,
    "isActive": true
  }
]
```

## Format 3: Sanity Style (with _type)
```json
{
  "_type": "heroSlide",
  "title": "Ash Utilization And Coal Handling",
  "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
  "slug": {
    "_type": "slug",
    "current": "ash-utilization-and-coal-handling"
  },
  "order": 1,
  "isActive": true
}
```

## Format 4: Your Current Backend API Format
```json
{
  "title": "Ash Utilization And Coal Handling",
  "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
  "order": 1,
  "isActive": true
}
```

## cURL Examples

### Single Slide (Your Backend)
```bash
curl -X POST http://localhost:8080/api/cms/home/slides \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Ash Utilization And Coal Handling",
    "image": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
    "order": 1,
    "isActive": true
  }'
```

### Strapi Example
```bash
curl -X POST http://localhost:1337/api/hero-slides \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d '{
    "data": {
      "title": "Ash Utilization And Coal Handling",
      "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
      "slug": "ash-utilization-and-coal-handling",
      "order": 1,
      "isActive": true
    }
  }'
```

### Directus Example
```bash
curl -X POST http://localhost:8055/items/hero_slides \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "title": "Ash Utilization And Coal Handling",
    "image_url": "https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png",
    "slug": "ash-utilization-and-coal-handling",
    "order": 1,
    "isActive": true
  }'
```

