import { useState, useEffect } from 'react';
import { contactCmsApi } from '../../../services/api';

interface ContactFormConfig {
  id: number;
  title: string;
  subtitle?: string;
  mapEmbedUrl?: string;
  formEndpointUrl: string;
  successMessage?: string;
  errorMessage?: string;
  isActive: boolean;
}

export default function ContactForm() {
  const [formConfig, setFormConfig] = useState<ContactFormConfig | null>(null);
  const [loading, setLoading] = useState(true);
  const [formData, setFormData] = useState({
    fullName: '',
    email: '',
    phone: '',
    salesSupport: 'Sales',
    message: ''
  });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [submitStatus, setSubmitStatus] = useState<'success' | 'error' | null>(null);
  const [isCaptchaChecked, setIsCaptchaChecked] = useState(false);

  useEffect(() => {
    loadFormConfig();
  }, []);

  const loadFormConfig = async () => {
    // Default fallback data
    const fallbackConfig: ContactFormConfig = {
      id: 1,
      title: 'Get in Touch',
      subtitle: "Have Questions? We're happy to help!",
      mapEmbedUrl: 'https://maps.google.com/maps?q=Refex%20Industries%20Limited%202nd%20Floor%2C%20No.313%2C%20Refex%20Towers%2C%20Sterling%20Road%2C%20Valluvar%20Kottam%20High%20Road%2C%20Nungambakkam%2C%20Chennai%2C%20Tamil%20Nadu%20-%20600034&t=m&z=17&output=embed&iwloc=near',
      formEndpointUrl: 'https://readdy.ai/api/form/d4ijdrv1vras6h6ft1qg',
      successMessage: "Thank you! Your message has been sent successfully.",
      errorMessage: "Sorry, there was an error sending your message. Please try again.",
      isActive: true,
    };

    try {
      setLoading(true);
      const data = await contactCmsApi.getForm();
      if (data && (data.isActive === true || data.isActive === undefined || data.isActive === null)) {
        setFormConfig(data);
      } else {
        setFormConfig(fallbackConfig);
      }
    } catch (error) {
      console.error('Failed to fetch contact form config:', error);
      // Fallback to default data on error
      setFormConfig(fallbackConfig);
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!isCaptchaChecked) {
      setSubmitStatus('error');
      return;
    }
    
    setIsSubmitting(true);
    setSubmitStatus(null);

    try {
      const formBody = new URLSearchParams({
        fullName: formData.fullName,
        email: formData.email,
        phone: formData.phone,
        salesSupport: formData.salesSupport,
        message: formData.message
      }).toString();

      const endpointUrl = formConfig?.formEndpointUrl || 'https://readdy.ai/api/form/d4ijdrv1vras6h6ft1qg';
      const response = await fetch(endpointUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: formBody
      });

      if (response.ok) {
        setSubmitStatus('success');
        setFormData({
          fullName: '',
          email: '',
          phone: '',
          salesSupport: 'Sales',
          message: ''
        });
        setIsCaptchaChecked(false);
      } else {
        setSubmitStatus('error');
      }
    } catch (error) {
      setSubmitStatus('error');
    } finally {
      setIsSubmitting(false);
    }
  };

  if (loading) {
    return (
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex items-center justify-center py-20">
            <div className="text-center">
              <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
              <p className="mt-4 text-gray-600">Loading contact form...</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  if (!formConfig || !formConfig.isActive) {
    return null; // Don't render if not active or no data
  }

  // Decode HTML entities in map URL (fix &amp; to &)
  const mapUrl = (formConfig.mapEmbedUrl || 'https://maps.google.com/maps?q=Refex%20Industries%20Limited%202nd%20Floor%2C%20No.313%2C%20Refex%20Towers%2C%20Sterling%20Road%2C%20Valluvar%20Kottam%20High%20Road%2C%20Nungambakkam%2C%20Chennai%2C%20Tamil%20Nadu%20-%20600034&t=m&z=17&output=embed&iwloc=near')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'");
  const successMsg = formConfig.successMessage || "Thank you! Your message has been sent successfully.";
  const errorMsg = formConfig.errorMessage || "Sorry, there was an error sending your message. Please try again.";

  return (
    <section className="py-16 bg-white">
      <div className="max-w-7xl mx-auto px-4">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-start">
          {/* Map */}
          {mapUrl && (
            <div className="w-full h-[600px] rounded-lg overflow-hidden shadow-lg">
              <iframe
                src={mapUrl}
                title="Refex Industries Limited Location"
                className="w-full h-full border-0"
                loading="lazy"
              ></iframe>
            </div>
          )}

          {/* Contact Form */}
          <div className="bg-gray-50 p-8 rounded-lg shadow-lg" style={{ borderTop: '4px solid #7dc144' }}>
            <div className="text-center mb-8" style={{ marginTop: '20px' }}>
              <h3 className="font-bold mb-3" style={{ fontSize: '40px', color: '#1f1f1f' }}>{formConfig.title}</h3>
              {formConfig.subtitle && (
                <p style={{ fontSize: '16px', color: '#484848' }}>{formConfig.subtitle}</p>
              )}
            </div>

            <form onSubmit={handleSubmit} data-readdy-form id="contact-form">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                  <input
                    type="text"
                    name="fullName"
                    value={formData.fullName}
                    onChange={handleChange}
                    placeholder="Full Name"
                    required
                    className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent text-sm"
                  />
                </div>
                <div>
                  <input
                    type="email"
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                    placeholder="Email Address"
                    required
                    className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent text-sm"
                  />
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                  <input
                    type="tel"
                    name="phone"
                    value={formData.phone}
                    onChange={handleChange}
                    placeholder="Phone"
                    required
                    className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent text-sm"
                  />
                </div>
                <div className="relative">
                  <select
                    name="salesSupport"
                    value={formData.salesSupport}
                    onChange={handleChange}
                    className="w-full px-4 py-3 pr-10 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent appearance-none bg-white text-sm cursor-pointer"
                  >
                    <option value="Sales">Sales</option>
                    <option value="Support">Support</option>
                  </select>
                  <i className="ri-arrow-down-s-line absolute right-3 top-1/2 -translate-y-1/2 text-gray-500 pointer-events-none text-xl"></i>
                </div>
              </div>

              <div className="mb-4">
                <textarea
                  name="message"
                  value={formData.message}
                  onChange={handleChange}
                  placeholder="Your Message"
                  rows={6}
                  maxLength={500}
                  className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent resize-none text-sm"
                ></textarea>
                <p className="text-xs text-gray-500 mt-1">{formData.message.length}/500 characters</p>
              </div>

              {/* reCAPTCHA */}
<div className="mb-6">
  <div className="
    inline-flex items-center gap-4
    bg-white border border-gray-300
    px-4 py-3
    rounded
    cursor-pointer
    hover:border-gray-400
    transition-colors
  ">
    {/* Checkbox */}
    <input
      type="checkbox"
      id="captcha"
      checked={isCaptchaChecked}
      onChange={(e) => setIsCaptchaChecked(e.target.checked)}
      className="w-6 h-6 cursor-pointer accent-[#7abc43]"
    />

    {/* Text */}
    <label
      htmlFor="captcha"
      className="text-sm text-gray-700 cursor-pointer select-none"
    >
      I'm not a robot
    </label>

    {/* reCAPTCHA logo */}
    <div className="ml-4 flex flex-col items-center text-[10px] text-gray-500">
      <img
        src="https://www.gstatic.com/recaptcha/api2/logo_48.png"
        alt="reCAPTCHA"
        className="w-8 h-8 mb-1"
      />
      <span className="leading-none">reCAPTCHA</span>
      <span className="leading-none">
        <a
          href="https://policies.google.com/privacy"
          target="_blank"
          rel="noopener noreferrer"
          className="hover:underline"
        >
          Privacy
        </a>
        {" · "}
        <a
          href="https://policies.google.com/terms"
          target="_blank"
          rel="noopener noreferrer"
          className="hover:underline"
        >
          Terms
        </a>
      </span>
    </div>
  </div>
</div>


              {submitStatus === 'success' && (
                <div className="mb-4 p-4 bg-green-50 border border-green-200">
                  <p className="text-green-700 text-sm">{successMsg}</p>
                </div>
              )}

              {submitStatus === 'error' && (
                <div className="mb-4 p-4 bg-red-50 border border-red-200">
                  <p className="text-red-700 text-sm">{!isCaptchaChecked ? 'Please verify that you are not a robot.' : errorMsg}</p>
                </div>
              )}

              <div className="text-center">
                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="bg-[#7abc43] text-white px-8 py-3 hover:bg-[#6aa839] transition-colors font-medium disabled:opacity-50 disabled:cursor-not-allowed inline-flex items-center gap-2 cursor-pointer whitespace-nowrap"
                >
                  {isSubmitting ? 'Sending...' : 'Send Message'}
                  <i className="ri-arrow-right-line"></i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
}
