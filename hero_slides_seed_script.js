/**
 * Seed script to populate hero slides in your database
 * Run this with: node hero_slides_seed_script.js
 */

const slides = [
  {
    title: 'Ash Utilization And Coal Handling',
    image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/0c27f725583f8aa18523ff9ba98c7283.png',
    order: 1,
    isActive: true
  },
  {
    title: 'Green Mobility',
    image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/5e71896259f48aee41bb484bef88a501.png',
    order: 2,
    isActive: true
  },
  {
    title: 'Venwind Refex',
    image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/d1f932b601a9dab855d409f970966b38.png',
    order: 3,
    isActive: true
  },
  {
    title: 'Refrigerant Gas',
    image: 'https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/09e6f2b1e185a6c3f96a07b03bf381bc.png',
    order: 4,
    isActive: true
  }
];

// For use with your backend API
async function seedHeroSlides() {
  const API_BASE_URL = "";
  
  for (const slide of slides) {
    try {
      const response = await fetch(`${API_BASE_URL}/api/cms/home/slides`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(slide),
      });
      
      const result = await response.json();
      
      if (response.ok) {
        console.log(`✅ Created slide: ${slide.title}`);
      } else {
        console.error(`❌ Failed to create slide: ${slide.title}`, result);
      }
    } catch (error) {
      console.error(`❌ Error creating slide: ${slide.title}`, error.message);
    }
  }
}

// Uncomment to run:
// seedHeroSlides();

module.exports = { slides, seedHeroSlides };

