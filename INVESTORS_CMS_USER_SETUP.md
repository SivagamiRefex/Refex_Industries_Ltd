# Investors CMS User Setup Guide

## Overview
A new user type `InvestorsCMS` has been added to the system. Users with this type can only access the Investors CMS page and cannot access any other CMS pages.

## Changes Made

### Backend Changes

1. **User Model** (`server/models/user.js`)
   - Added `"InvestorsCMS"` to the `user_type` ENUM

2. **User Types** (`server/utils/userTypes.js`)
   - Added `InvestorsCMS: "InvestorsCMS"` constant

3. **Authentication Middleware** (`server/middlewares/auth.js`)
   - Added `blockInvestorsCMS` middleware to block InvestorsCMS users from other CMS routes
   - Added `authInvestorsCMSOnly` middleware (for future use)

4. **Investors CMS Routes** (`server/routes/investors_cms.js`)
   - Added `checkInvestorsCMSAccess` middleware to allow Admin, CHRO, HR, and InvestorsCMS users

### Frontend Changes

1. **Auth Context** (`client/src/contexts/AuthContext.tsx`)
   - Updated to use real backend authentication
   - Added `user_type` to User interface
   - Fallback to mock auth for development

2. **Protected Route** (`client/src/components/ProtectedRoute.tsx`)
   - Added check to redirect InvestorsCMS users to investors-cms page if they try to access other pages

3. **Admin Dashboard** (`client/src/pages/admin/dashboard/page.tsx`)
   - Hide all CMS buttons except Investors CMS for InvestorsCMS users
   - Auto-redirect InvestorsCMS users to investors-cms page

## Database Migration

### Step 1: Run the Migration Script

```bash
node server/scripts/add_investors_cms_user_type.js
```

This script will:
- Check if the `InvestorsCMS` user type already exists
- Add it to the `user_type` ENUM if it doesn't exist
- Update the Users table structure

### Step 2: Create an InvestorsCMS User

You can create an InvestorsCMS user through your admin panel or directly in the database:

```sql
-- Example: Create an InvestorsCMS user
-- Note: Replace the password hash with a bcrypt hash of your desired password
INSERT INTO Users (id, first_name, last_name, email, password, user_type, is_active, created_at, modified_at)
VALUES (
  UUID(),
  'Investors',
  'User',
  'investors@refex.co.in',
  '$2b$10$...', -- bcrypt hash of password
  'InvestorsCMS',
  1,
  NOW(),
  NOW()
);
```

Or use the admin panel to create a user and set their `user_type` to `InvestorsCMS`.

## Usage

### For InvestorsCMS Users

1. Login with an InvestorsCMS account
2. Upon login, they will be automatically redirected to `/admin/dashboard/investors-cms`
3. They can only see and access the Investors CMS page
4. If they try to access any other CMS page, they will be redirected back to Investors CMS
5. They have full access to all Investors CMS features:
   - Hero section
   - Stock Quote
   - Stock Chart
   - Historical Stock Quote
   - Related Links
   - Key Personnel
   - Investor Page Content

### For Admins

- Admin, CHRO, and HR users have full access to all CMS pages including Investors CMS
- They can create and manage InvestorsCMS users through the admin panel

## Security

- Backend routes are protected with middleware that checks user type
- Frontend routes are protected with `ProtectedRoute` component
- InvestorsCMS users cannot access other CMS API endpoints
- All authentication is handled through JWT tokens

## Testing

1. Create a test InvestorsCMS user
2. Login with that user
3. Verify:
   - User is redirected to investors-cms page
   - Dashboard only shows Investors CMS button
   - Cannot access other CMS pages (will be redirected)
   - Can access all Investors CMS features

## Notes

- The migration script is safe to run multiple times (it checks if the type already exists)
- If you're using a different database system (not MySQL), you may need to adjust the migration script
- The frontend will fall back to mock authentication if the backend is not available (for development)

