# Stock Data Cron Job Setup

This document explains how the automated stock data update cron job works.

## Overview

The cron job automatically runs `npm run stock` and `npm run stockBse` every day at 8:00 PM (20:00) to update stock data.

## Installation

1. Install the required dependency:
```bash
cd server
npm install node-cron
```

## How It Works

### Automatic Startup (Recommended)
The cron job is automatically started when you start the server:
```bash
npm start
```

The cron job will initialize and run in the background, executing the stock scripts daily at 8:00 PM.

### Manual Startup (Alternative)
If you want to run the cron job separately from the main server:
```bash
npm run cron:start
```

## Configuration

### Time Schedule
The cron job is configured to run at **8:00 PM (20:00) every day**.

Cron expression: `0 20 * * *`
- `0` - minute (0th minute)
- `20` - hour (8 PM in 24-hour format)
- `*` - every day of month
- `*` - every month
- `*` - every day of week

### Timezone
Default timezone is set to `Asia/Kolkata`. To change it, edit `server/cronJobs.js`:
```javascript
timezone: "Your/Timezone" // e.g., "America/New_York", "Europe/London"
```

### Changing the Schedule
To change when the cron job runs, edit `server/cronJobs.js` and modify the cron expression:
```javascript
// Example: Run at 9:30 AM every day
const stockCronJob = cron.schedule('30 9 * * *', async () => {
  // ...
});
```

## Logs

The cron job logs all activities to the console:
- Start time of each script
- Completion status
- Any errors that occur

Example log output:
```
[2025-01-15T20:00:00.000Z] ===== Starting scheduled stock data update =====
[2025-01-15T20:00:00.100Z] Starting: npm run stock
[2025-01-15T20:00:05.200Z] Completed: npm run stock
[2025-01-15T20:00:05.300Z] Stock script completed successfully
[2025-01-15T20:00:07.400Z] Starting: npm run stockBse
[2025-01-15T20:00:12.500Z] Completed: npm run stockBse
[2025-01-15T20:00:12.600Z] StockBse script completed successfully
[2025-01-15T20:00:12.700Z] ===== Scheduled stock data update completed =====
```

## Manual Execution

You can still run the stock scripts manually at any time:
```bash
npm run stock
npm run stockBse
```

## Troubleshooting

### Cron job not running
1. Check if `node-cron` is installed: `npm list node-cron`
2. Check server logs for cron job initialization messages
3. Verify the server is running: `npm start`

### Scripts failing
1. Check the console logs for error messages
2. Test scripts manually: `npm run stock` and `npm run stockBse`
3. Verify database connection and API access

### Timezone issues
- Ensure the server timezone matches your expected schedule
- Check system time: `date` (Linux/Mac) or `date /t` (Windows)
- Adjust timezone in `cronJobs.js` if needed

## Files

- `server/cronJobs.js` - Main cron job configuration
- `server/stock.js` - NSE stock data script
- `server/stockBse.js` - BSE stock data script
- `server/index.js` - Server startup (auto-initializes cron jobs)

