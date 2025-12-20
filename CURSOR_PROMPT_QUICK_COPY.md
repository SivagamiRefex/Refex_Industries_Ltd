# Quick Copy-Paste Cursor Prompt

Copy and paste this entire prompt into Cursor for any new project:

---

I need to set up a complete SMTP email service for my contact form. Please implement the following:

## Requirements:

1. **Create an Email Service** (`server/services/email_service.js`):
   - Use nodemailer for SMTP email sending
   - Configure SMTP transporter with environment variables:
     - SMTP_HOST (default: smtp.gmail.com)
     - SMTP_PORT (default: 587)
     - SMTP_USER (email address for authentication)
     - SMTP_PASS (app password or regular password)
   - Set secure: false for port 587
   - Include TLS configuration with rejectUnauthorized: false

2. **Email Service Methods**:
   - `sendContactFormEmail(formData)`: Send notification email to admin
     - From: "Contact Form <info@yourdomain.com>" (customize domain)
     - To: Configure via environment variable or hardcode receiver email
     - Subject: "Contact Form"
     - Email body format (Contact Form 7 style - simple text):
       ```
       Name: [name]
       Email: [email]
       Phone: [phone]
       Sales/Support: [sales-support or company field]
       Message: [message]
       
       This is a notification that a contact form was submitted on your website ([SITE_TITLE] [SITE_URL]).
       ```
     - Include both HTML and plain text versions
     - Use environment variables SITE_TITLE and SITE_URL for the notification message
   
   - `sendAutoReply(customerEmail, customerName)`: Send auto-reply to customer
     - Professional HTML template with thank you message
     - Include company branding and contact information
   
   - `testConnection()`: Test SMTP connection
     - Verify transporter connection
     - Return boolean result

3. **Create Contact Form Route** (`server/routes/contact.js`):
   - POST `/api/contact-form` endpoint
   - Use express-validator for input validation:
     - fullName: 2-100 chars, letters/spaces/hyphens/apostrophes only
     - email: valid email format
     - phone: 10-15 characters
     - salesSupport: optional, must be 'Sales' or 'Support'
     - message: 10-500 characters
   - Extract client IP address from request
   - Map form fields to email service format:
     - fullName → name
     - salesSupport → company
   - Send notification email to admin
   - Send auto-reply to customer (with error handling - don't fail if auto-reply fails)
   - Return JSON response with success/error status
   - Log successful submissions

   - GET `/api/test-email` endpoint:
     - Test SMTP connection
     - Return JSON with connection status

4. **Environment Variables** (`.env` file):
   Add these variables to your server/.env file:
   ```
   # SMTP Email Configuration
   SMTP_HOST=smtp.gmail.com
   SMTP_PORT=587
   SMTP_USER=your-email@yourdomain.com
   SMTP_PASS=your-app-password
   SITE_TITLE=Your Company Name
   SITE_URL=https://yourdomain.com
   ```

5. **Package Dependencies**:
   Ensure these packages are installed:
   - nodemailer
   - express-validator
   - dotenv (if not already using)

6. **Integration**:
   - Register the contact route in your main server file (e.g., `server/index.js`)
   - Ensure dotenv is configured at the top of your main server file
   - Make sure CORS is properly configured for the contact form endpoint

7. **Email Format Details**:
   - Notification email should be simple and clean (Contact Form 7 style)
   - Use plain text format with field labels
   - Include website notification message at the end
   - Auto-reply should be professional HTML with company branding

8. **Error Handling**:
   - Catch and log all email errors
   - Don't fail the main email if auto-reply fails
   - Return user-friendly error messages
   - Include detailed error info in development mode

## Customization Points:
- Replace "info@yourdomain.com" with your actual sender email
- Replace receiver email with your admin/notification email
- Update company name, contact info, and branding in auto-reply template
- Adjust validation rules as needed for your form fields
- Customize email templates to match your brand

## Testing:
After implementation, test the email service by:
1. Calling GET /api/test-email to verify SMTP connection
2. Submitting a test contact form via POST /api/contact-form
3. Checking that both notification and auto-reply emails are sent correctly

Please implement all of this following best practices and ensure proper error handling throughout.

