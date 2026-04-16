const express = require('express');
const router = express.Router();
const emailService = require('../services/email_service');
const { body, validationResult } = require('express-validator');
const { sendToKissflowWebhook } = require('../helpers/kissflowWebhook');
const { getRequestMeta, phoneToDigitsOnly } = require('../helpers/requestMeta');

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

    const meta = getRequestMeta(req);
    const phoneDigits = phoneToDigitsOnly(phone);
    const websiteName = 'Refex Industries Limited';

    // Prepare form data for email
    const formData = {
      name: fullName,
      email,
      phone: phoneDigits,
      company: salesSupport || 'Not specified',
      message,
      recaptchaToken: 'Verified', // Simple checkbox verification
      ipAddress: meta.ipAddress,
      timestamp: meta.timestamp
    };

    const webhookData = {
      name: fullName,
      email,
      phone: phoneDigits,
      Phone_Number: phoneDigits,
      company: salesSupport || 'Not specified',
      message,
      ...meta,
    };

    // Fire-and-forget queueing, do not await to avoid blocking API response.
    sendToKissflowWebhook(websiteName, 'Contact form', webhookData);

    let emailResult = null;
    let emailErrorMessage = null;

    try {
      // Send email to info@refex.co.in
      emailResult = await emailService.sendContactFormEmail(formData);

      // Send auto-reply to customer (optional)
      try {
        await emailService.sendAutoReply(email, fullName);
      } catch (autoReplyError) {
        console.warn('Auto-reply failed:', autoReplyError.message);
      }
    } catch (emailError) {
      emailErrorMessage = emailError.message;
      console.error('Primary email sending failed. Submission retained via webhook queue:', emailErrorMessage);
    }

    // Log successful submission
    console.log(`Contact form submitted successfully by ${fullName} (${email}) at ${new Date().toISOString()}`);

    // Return success response
    res.status(200).json({
      success: true,
      message: 'Thank you for your message! We will get back to you within 24 hours.',
      data: {
        messageId: emailResult?.messageId || null,
        timestamp: formData.timestamp,
        emailAccepted: !!emailResult,
        ...(emailErrorMessage ? { emailError: emailErrorMessage } : {}),
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

