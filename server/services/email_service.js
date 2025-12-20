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
      const { name, email, phone, company, message, recaptchaToken } = formData;

      // Email content
      const mailOptions = {
        from: 'Contact Form <info@refex.co.in>',
        to: 'raghul.je@refex.co.in',
        subject: 'Contact Form',
        html: `
          <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
            <p>Name: ${name}</p>
            <p>Email: ${email}</p>
            <p>Phone: ${phone || 'Not provided'}</p>
            <p>Sales/Support: ${company || 'Not specified'}</p>
            <p>Message: ${message}</p>
            <br>
            <p>This is a notification that a contact form was submitted on your website (${process.env.SITE_TITLE || 'Refex Industries'} ${process.env.SITE_URL || 'https://refex.co.in'}).</p>
          </div>
        `,
        text: `
Name: ${name}
Email: ${email}
Phone: ${phone || 'Not provided'}
Sales/Support: ${company || 'Not specified'}
Message: ${message}

This is a notification that a contact form was submitted on your website (${process.env.SITE_TITLE || 'Refex Industries'} ${process.env.SITE_URL || 'https://refex.co.in'}).
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
        from: 'Contact Form <info@refex.co.in>',
        to: customerEmail,
        subject: 'Thank you for contacting Refex Industries Lt',
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
                  Thank you for reaching out to Refex Industries Ltd. We have received your inquiry, and our team will review it carefully.
                </p>
                
                <p style="color: #666; font-size: 15px; line-height: 1.6;">
                  We typically respond to all inquiries within 24 hours during business days. If your inquiry is urgent, please call us directly at <strong>+91-44-43405900</strong>.
                </p>
                
                <div style="background: #e8f4fd; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2879b6;">
                  <h4 style="color: #2879b6; margin-top: 0;">What happens next?</h4>
                  <ul style="color: #666; padding-left: 20px;">
                    <li>Our team will review your inquiry</li>
                    <li>We'll assign it to the appropriate department</li>
                    <li>You'll receive a detailed response within 24 hours</li>
                    <li>If needed, we'll schedule a follow-up call</li>
                  </ul>
                </div>
                
                <p style="color: #666; font-size: 15px; line-height: 1.6;">
                  In the meantime, we invite you to explore our website to learn more about our diversified businesses, including Ash Utilization, Green Mobility, Refrigerants, and Wind Energy solutions.
                </p>
                
                <p style="color: #333; font-size: 15px; line-height: 1.6;">
                  Best regards,<br>
                  <strong>The Refex Industries Ltd Team</strong>
                </p>
              </div>
            </div>
            
            <div style="text-align: center; padding: 20px; background: #f0f0f0; border-radius: 0 0 10px 10px;">
              <p style="margin: 0; color: #666; font-size: 14px;">
                Refex Industries Ltd | Driving Sustainable Industrial Solutions
              </p>
              <p style="margin: 5px 0 0 0; color: #999; font-size: 12px;">
                2nd Floor, No.313, Refex Towers, Sterling Road, Valluvar Kottam High Road,<br>
                Nungambakkam, Chennai – 600034, Tamil Nadu, India
              </p>
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
