# Environment Variables Setup

## Issue
The error `"secretOrPrivateKey must have a value"` occurs because the `APP_KEY` environment variable is missing.

## Solution

Create a `.env` file in the `server/` directory with the following content:

```env
# Server Configuration
PORT=8080
NODE_ENV=development

# Database Configuration
# Update these with your actual database credentials
DB_HOST=localhost
DB_PORT=3306
DB_NAME=refex_industries
DB_USER=root
DB_PASSWORD=

# JWT Secrets (IMPORTANT: Change these in production!)
APP_KEY=refex-industries-app-secret-key-2024-change-in-production
API_KEY=refex-industries-api-secret-key-2024-change-in-production

# Frontend URL
FRONT_END_URL=http://localhost:3000

# Default Password for new users
DEFAULT_PASSWORD=Default@123

# SMTP Email Configuration (for Contact Form)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password
```

## Steps to Fix

1. Navigate to the `server/` directory
2. Create a new file named `.env` (no extension)
3. Copy the content above into the file
4. Update the database credentials (DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD) with your actual database settings
5. **Important**: Change the `APP_KEY` and `API_KEY` to strong, random strings in production
6. Restart your server

## Quick Fix (Windows PowerShell)

Run this command in the `server/` directory:

```powershell
@"
# Server Configuration
PORT=8080
NODE_ENV=development

# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_NAME=refex_industries
DB_USER=root
DB_PASSWORD=

# JWT Secrets
APP_KEY=refex-industries-app-secret-key-2024-change-in-production
API_KEY=refex-industries-api-secret-key-2024-change-in-production

# Frontend URL
FRONT_END_URL=http://localhost:3000

# Default Password for new users
DEFAULT_PASSWORD=Default@123
"@ | Out-File -FilePath .env -Encoding utf8
```

## After Creating .env File

1. Restart your backend server
2. Try logging in again with:
   - Email: `investors@refex.com`
   - Password: `Investors@2025`

The login should now work!

