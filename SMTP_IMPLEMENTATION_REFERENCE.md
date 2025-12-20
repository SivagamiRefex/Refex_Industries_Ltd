# SMTP Email Service - Reference Implementation

This document shows the exact code structure for the SMTP email service implementation.

## File Structure

```
server/
├── services/
│   └── email_service.js      # Email service with nodemailer
├── routes/
│   └── contact.js            # Contact form API route
└── .env                      # Environment variables
```

## 1. Email Service (`server/services/email_service.js`)

```javascript
const nodemailer = require('nodemailer');

class EmailService {
  constructor() {
    // Create transporter using SMTP configuration
    this.transporter = nodemailer.createTransport({
      host: process.env.SMTP_HOST || 'smtp.gmail.com',
      port: process.env.SMTP_PORT || 587,
      secure: false, // true for 465, false for other ports
      auth: {
        user: process.env.SMTP_USER || 'your-email@gmail.com',
        pass: process.env.SMTP_PASS || 'your-app-password'
      },
      tls: {
        rejectUnauthorized: false
      }
    });
  }

  // Send contact form email
  async sendContactFormEmail(formData) {
    try {
      const { name, email, phone, company, message } = formData;

      // Email content
      const mailOptions = {
        from: 'Contact Form <info@yourdomain.com>', // Customize this
        to: 'admin@yourdomain.com', // Customize receiver email
        subject: 'Contact Form',
        html: `
          <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
            <p>Name: ${name}</p>
            <p>Email: ${email}</p>
            <p>Phone: ${phone || 'Not provided'}</p>
            <p>Sales/Support: ${company || 'Not specified'}</p>
            <p>Message: ${message}</p>
            <br>
            <p>This is a notification that a contact form was submitted on your website (${process.env.SITE_TITLE || 'Your Site'} ${process.env.SITE_URL || 'https://yourdomain.com'}).</p>
          </div>
        `,
        text: `
Name: ${name}
Email: ${email}
Phone: ${phone || 'Not provided'}
Sales/Support: ${company || 'Not specified'}
Message: ${message}

This is a notification that a contact form was submitted on your website (${process.env.SITE_TITLE || 'Your Site'} ${process.env.SITE_URL || 'https://yourdomain.com'}).
        `
      };

      // Send email
      const result = await this.transporter.sendMail(mailOptions);
      console.log('Email sent successfully:', result.messageId);
      
      return {
        success: true,
        messageId: result.messageId,
        message: 'Email sent successfully'
      };

    } catch (error) {
      console.error('Error sending email:', error);
      throw new Error(`Failed to send email: ${error.message}`);
    }
  }

  // Send auto-reply to customer
  async sendAutoReply(customerEmail, customerName) {
    try {
      const mailOptions = {
        from: 'Contact Form <info@yourdomain.com>', // Customize this
        to: customerEmail,
        subject: 'Thank you for contacting us',
        html: `
          <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
            <div style="background: linear-gradient(135deg, #2879b6, #7dc244); color: white; padding: 30px; border-radius: 10px 10px 0 0; text-align: center;">
              <h2 style="margin: 0; font-size: 28px;">Thank You!</h2>
              <p style="margin: 10px 0 0 0; opacity: 0.9; font-size: 16px;">We've received your message</p>
            </div>
            
            <div style="padding: 30px; background: #f9f9f9;">
              <div style="background: white; padding: 25px; border-radius: 8px;">
                <p style="color: #333; font-size: 16px; line-height: 1.6;">
                  Dear ${customerName},
                </p>
                
                <p style="color: #666; font-size: 15px; line-height: 1.6;">
                  Thank you for reaching out to us. We have received your inquiry and our team will review it carefully.
                </p>
                
                <p style="color: #666; font-size: 15px; line-height: 1.6;">
                  We typically respond to all inquiries within 24 hours during business days.
                </p>
                
                <p style="color: #333; font-size: 15px; line-height: 1.6; margin-top: 20px;">
                  Best regards,<br>
                  <strong>Your Company Team</strong>
                </p>
              </div>
            </div>
          </div>
        `
      };

      const result = await this.transporter.sendMail(mailOptions);
      console.log('Auto-reply sent successfully:', result.messageId);
      
      return {
        success: true,
        messageId: result.messageId,
        message: 'Auto-reply sent successfully'
      };

    } catch (error) {
      console.error('Error sending auto-reply:', error);
      throw new Error(`Failed to send auto-reply: ${error.message}`);
    }
  }

  // Test email configuration
  async testConnection() {
    try {
      await this.transporter.verify();
      console.log('Email service connection verified successfully');
      return true;
    } catch (error) {
      console.error('Email service connection failed:', error);
      return false;
    }
  }
}

module.exports = new EmailService();
```

## 2. Contact Route (`server/routes/contact.js`)

```javascript
const express = require('express');
const router = express.Router();
const emailService = require('../services/email_service');
const { body, validationResult } = require('express-validator');

// Contact form submission endpoint
router.post('/contact-form', [
  // Validation rules
  body('fullName')
    .trim()
    .isLength({ min: 2, max: 100 })
    .withMessage('Name must be between 2 and 100 characters')
    .matches(/^[a-zA-Z\s\-']+$/)
    .withMessage('Name can only contain letters, spaces, hyphens, and apostrophes'),
  
  body('email')
    .isEmail()
    .normalizeEmail()
    .withMessage('Please provide a valid email address'),
  
  body('phone')
    .trim()
    .isLength({ min: 10, max: 15 })
    .withMessage('Please provide a valid phone number'),
  
  body('salesSupport')
    .optional()
    .isIn(['Sales', 'Support'])
    .withMessage('Invalid selection for Sales/Support'),
  
  body('message')
    .trim()
    .isLength({ min: 10, max: 500 })
    .withMessage('Message must be between 10 and 500 characters')
], async (req, res) => {
  try {
    // Check for validation errors
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({
        success: false,
        message: 'Validation failed',
        errors: errors.array()
      });
    }

    const { fullName, email, phone, salesSupport, message } = req.body;

    // Get client IP address
    const ipAddress = req.ip || req.connection.remoteAddress || req.headers['x-forwarded-for'] || 'Unknown';

    // Prepare form data for email
    const formData = {
      name: fullName,
      email,
      phone,
      company: salesSupport || 'Not specified',
      message,
      recaptchaToken: 'Verified',
      ipAddress,
      timestamp: new Date().toISOString()
    };

    // Send email to admin
    const emailResult = await emailService.sendContactFormEmail(formData);

    // Send auto-reply to customer (optional - don't fail if this fails)
    try {
      await emailService.sendAutoReply(email, fullName);
    } catch (autoReplyError) {
      console.warn('Auto-reply failed, but main email was sent:', autoReplyError.message);
    }

    // Log successful submission
    console.log(`Contact form submitted successfully by ${fullName} (${email}) at ${new Date().toISOString()}`);

    // Return success response
    res.status(200).json({
      success: true,
      message: 'Thank you for your message! We will get back to you within 24 hours.',
      data: {
        messageId: emailResult.messageId,
        timestamp: formData.timestamp
      }
    });

  } catch (error) {
    console.error('Contact form submission error:', error);
    
    // Return error response
    res.status(500).json({
      success: false,
      message: 'Sorry, there was an error sending your message. Please try again or contact us directly.',
      error: process.env.NODE_ENV === 'development' ? error.message : 'Internal server error'
    });
  }
});

// Test email service endpoint (for development/testing)
router.get('/test-email', async (req, res) => {
  try {
    const isConnected = await emailService.testConnection();
    
    if (isConnected) {
      res.json({
        success: true,
        message: 'Email service is working correctly'
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Email service connection failed'
      });
    }
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Email service test failed',
      error: error.message
    });
  }
});

module.exports = router;
```

## 3. Environment Variables (`server/.env`)

```env
# SMTP Email Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@yourdomain.com
SMTP_PASS=your-app-password
SITE_TITLE=Your Company Name
SITE_URL=https://yourdomain.com
```

## 4. Register Route in Main Server File

In your `server/index.js` or main server file:

```javascript
require("dotenv").config();
// ... other imports ...

const contactRoutes = require('./routes/contact');

// ... other middleware ...

app.use('/api', contactRoutes);

// ... rest of server setup ...
```

## 5. Package Installation

```bash
npm install nodemailer express-validator
```

## 6. Frontend Integration Example

```typescript
// Frontend contact form submission
const handleSubmit = async (e: React.FormEvent) => {
  e.preventDefault();
  
  const response = await fetch(`${API_BASE_URL}/api/contact-form`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      fullName: formData.fullName,
      email: formData.email,
      phone: formData.phone,
      salesSupport: formData.salesSupport,
      message: formData.message
    })
  });

  const data = await response.json();
  
  if (response.ok && data.success) {
    // Show success message
  } else {
    // Show error message
  }
};
```

## Customization Checklist

- [ ] Update sender email in `from` field
- [ ] Update receiver email in `to` field
- [ ] Customize company name in auto-reply template
- [ ] Update SITE_TITLE and SITE_URL in .env
- [ ] Adjust validation rules if needed
- [ ] Customize email templates to match your brand
- [ ] Test SMTP connection
- [ ] Test contact form submission

