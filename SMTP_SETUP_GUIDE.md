# SMTP Mail Configuration Guide for Contact Form

This guide explains how to set up SMTP email configuration for the contact form on the contact us page.

## Overview

The contact form now sends emails via SMTP when users click the "Send Message" button. The system:
- Sends a notification email to `info@refex.co.in` with form details
- Sends an auto-reply confirmation email to the customer
- Validates form input on the server
- Logs submission details

## Setup Instructions

### 1. Add SMTP Configuration to `.env` File

Add the following variables to your `server/.env` file:

```env
# SMTP Email Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password
```

### 2. Gmail Setup (Recommended)

If using Gmail:

1. **Enable 2-Factor Authentication** on your Gmail account
2. **Generate App Password**:
   - Go to [Google Account Settings](https://myaccount.google.com/)
   - Navigate to: Security → 2-Step Verification → App passwords
   - Select "Mail" and your device
   - Generate and copy the 16-character password
   - Use this password in `SMTP_PASS` (not your regular Gmail password)

### 3. Alternative Email Providers

#### Outlook/Hotmail:
```env
SMTP_HOST=smtp-mail.outlook.com
SMTP_PORT=587
SMTP_USER=your-email@outlook.com
SMTP_PASS=your-password
```

#### Yahoo:
```env
SMTP_HOST=smtp.mail.yahoo.com
SMTP_PORT=587
SMTP_USER=your-email@yahoo.com
SMTP_PASS=your-app-password
```

#### Custom SMTP Server:
```env
SMTP_HOST=mail.yourdomain.com
SMTP_PORT=587
SMTP_USER=noreply@yourdomain.com
SMTP_PASS=your-password
```

### 4. Test Email Configuration

After setting up SMTP, test the connection:

1. **Via Browser/API Client:**
   ```
   GET http://localhost:8080/api/test-email
   ```

2. **Expected Response:**
   ```json
   {
     "success": true,
     "message": "Email service is working correctly"
   }
   ```

### 5. Frontend Integration

The contact form automatically sends data to:
```
POST /api/contact-form
```

**Form Fields:**
- `fullName` - User's full name
- `email` - User's email address
- `phone` - User's phone number
- `salesSupport` - Either "Sales" or "Support"
- `message` - User's message (10-500 characters)

### 6. Email Templates

#### Notification Email (to info@refex.co.in)
- Professional HTML template with company branding
- Includes all form details
- Shows submission timestamp and IP address

#### Auto-Reply Email (to customer)
- Thank you message
- Confirmation of receipt
- Expected response time (24 hours)
- Company contact information

### 7. Troubleshooting

#### Emails Not Sending

1. **Check SMTP Credentials:**
   - Verify `SMTP_USER` and `SMTP_PASS` are correct
   - For Gmail, ensure you're using an App Password, not your regular password

2. **Check Firewall/Security:**
   - Ensure port 587 (or 465 for SSL) is not blocked
   - Some networks block SMTP ports

3. **Check Spam Folder:**
   - Emails might be going to spam
   - Check spam folder for test emails

4. **Check Server Logs:**
   - Look for error messages in the console
   - Common errors:
     - `Invalid login`: Wrong credentials
     - `Connection timeout`: Firewall/network issue
     - `Authentication failed`: App password not set up correctly

5. **Test Connection:**
   ```bash
   # Visit in browser or use curl
   curl http://localhost:8080/api/test-email
   ```

#### Common Errors

**Error: "Invalid login"**
- Solution: Check `SMTP_USER` and `SMTP_PASS` are correct
- For Gmail: Use App Password, not regular password

**Error: "Connection timeout"**
- Solution: Check firewall settings, try port 465 with `secure: true`

**Error: "Authentication failed"**
- Solution: Enable 2FA and generate App Password for Gmail
- For other providers, check if "Less secure app access" needs to be enabled

### 8. Production Deployment

For production environments:

1. **Use Dedicated Email Service:**
   - Consider services like SendGrid, Mailgun, or AWS SES
   - Better deliverability and tracking

2. **Set Up DNS Records:**
   - SPF record
   - DKIM record
   - DMARC record

3. **Monitor Email Delivery:**
   - Track bounce rates
   - Monitor spam complaints
   - Set up email alerts for failures

4. **Security Best Practices:**
   - Never commit `.env` file to version control
   - Use environment-specific credentials
   - Rotate passwords regularly
   - Use strong, unique passwords

### 9. API Endpoints

#### Submit Contact Form
```
POST /api/contact-form
Content-Type: application/json

{
  "fullName": "John Doe",
  "email": "john@example.com",
  "phone": "1234567890",
  "salesSupport": "Sales",
  "message": "Your message here"
}
```

#### Test Email Service
```
GET /api/test-email
```

### 10. Environment Variables Summary

Add these to `server/.env`:

```env
# SMTP Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password

# Other required variables (see ENV_SETUP.md)
PORT=8080
NODE_ENV=development
DB_HOST=localhost
DB_PORT=3306
DB_NAME=refex_industries
DB_USER=root
DB_PASSWORD=
APP_KEY=your-secret-key
API_KEY=your-api-key
FRONT_END_URL=http://localhost:3000
DEFAULT_PASSWORD=Default@123
```

## Support

If you encounter issues:
1. Check server logs for detailed error messages
2. Test email connection using `/api/test-email` endpoint
3. Verify SMTP credentials are correct
4. Ensure firewall/network allows SMTP connections

