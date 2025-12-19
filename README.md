# Refex Industries Website

A full-stack web application for Refex Industries featuring investor relations, stock charts, and company information.

## Tech Stack

### Frontend
- React 19.1.0
- TypeScript
- Vite
- Tailwind CSS
- React Router

### Backend
- Node.js
- Express.js
- Puppeteer (for web scraping)
- Axios (for API calls)

## Project Structure

```
refex_industries/
├── client/          # React frontend application
├── server/          # Node.js backend API
└── README.md        # This file
```

## Features

- **Investor Relations**: Stock quotes, historical data, and interactive charts
- **Stock Charts**: Real-time and historical stock price visualization with NSE/BSE support
- **CMS**: Content management system for various pages
- **Multi-page Website**: About Us, Products, ESG, Newsroom, and more

## Getting Started

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd refex_industries
```

2. Install server dependencies:
```bash
cd server
npm install
```

3. Install client dependencies:
```bash
cd ../client
npm install
```

### Running the Application

1. Start the server:
```bash
cd server
npm start
# or for development
npm run dev
```

2. Start the client (in a new terminal):
```bash
cd client
npm run dev
```

## API Endpoints

### Stock Data
- `GET /api/stock/current-price` - Get current stock price (NSE/BSE)
- `GET /api/stock/quote` - Get stock quote data
- `GET /api/stock/intraday-chart` - Get intraday chart data
- `GET /api/stock/chart` - Get historical chart data
- `GET /api/stock/historical/:type` - Get historical stock data (NSE/BSE)

## Environment Variables

Create `.env` files in both `client/` and `server/` directories with necessary configuration.

## License

Proprietary - Refex Industries

