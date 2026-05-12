import { useState, useEffect, useMemo } from 'react';
import PhoneInput from 'react-phone-input-2';
import { parsePhoneNumberFromString } from 'libphonenumber-js';
import 'react-phone-input-2/lib/style.css';
import {
  Combobox,
  ComboboxButton,
  ComboboxInput,
  ComboboxOption,
  ComboboxOptions,
} from '@headlessui/react';
import { contactCmsApi } from '../../../services/api';
import { useEmailValidation } from '../../../hooks/useEmailValidation';
import { rankIndiaCityOptions } from '../utils/indiaCitySearch';
import SubmissionSuccessOverlay from './SubmissionSuccessOverlay';

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
  const { validateEmail } = useEmailValidation({ required: true });
  const [formData, setFormData] = useState({
    fullName: '',
    email: '',
    phone: '+91',
    city: '',
    companyName: '',
    productServices: '',
    salesSupport: 'Sales',
    message: ''
  });
  const [cityQuery, setCityQuery] = useState('');
  const [indiaCities, setIndiaCities] = useState<string[]>([]);
  const [citiesLoading, setCitiesLoading] = useState(true);
  const [citiesLoadError, setCitiesLoadError] = useState<string | null>(null);
  const [formErrors, setFormErrors] = useState({
    fullName: '',
    email: '',
    phone: '',
    city: '',
    companyName: '',
    productServices: '',
    message: '',
  });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [submitStatus, setSubmitStatus] = useState<'success' | 'error' | null>(null);
  const [showSuccessOverlay, setShowSuccessOverlay] = useState(false);

  useEffect(() => {
    loadFormConfig();
  }, []);

  useEffect(() => {
    const API_BASE_URL = import.meta.env.VITE_API_URL || '';
    const url = `${API_BASE_URL}/api/geo/india-cities`;
    setCitiesLoading(true);
    setCitiesLoadError(null);
    fetch(url)
      .then((res) => {
        if (!res.ok) throw new Error('Failed to load cities');
        return res.json();
      })
      .then((data) => {
        if (Array.isArray(data.cities)) {
          setIndiaCities(data.cities);
        } else {
          setCitiesLoadError('Could not load cities.');
          setIndiaCities([]);
        }
      })
      .catch(() => {
        setCitiesLoadError('Could not load cities.');
        setIndiaCities([]);
      })
      .finally(() => {
        setCitiesLoading(false);
      });
  }, []);

  const filteredCityOptions = useMemo(
    () => rankIndiaCityOptions(indiaCities, cityQuery),
    [indiaCities, cityQuery]
  );

  const cityAllowSet = useMemo(() => new Set(indiaCities), [indiaCities]);

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
    if (
      name === 'fullName' ||
      name === 'email' ||
      name === 'phone' ||
      name === 'companyName' ||
      name === 'productServices' ||
      name === 'message'
    ) {
      setFormErrors((prev) => ({ ...prev, [name]: '' }));
    }
  };

  const handlePhoneChange = (value: string) => {
    const normalizedValue = value.startsWith('+') ? value : `+${value}`;
    setFormData((prev) => ({
      ...prev,
      phone: normalizedValue,
    }));
    setFormErrors((prev) => ({ ...prev, phone: '' }));
  };

  const validateForm = () => {
    const nextErrors = {
      fullName: '',
      email: '',
      phone: '',
      city: '',
      companyName: '',
      productServices: '',
      message: '',
    };

    const fullName = formData.fullName.trim();
    const email = formData.email;
    const phone = formData.phone;

    if (!fullName) {
      nextErrors.fullName = 'Full name is required.';
    } else if (!/^[A-Za-z\s.'-]{2,60}$/.test(fullName)) {
      nextErrors.fullName = 'Enter a valid full name (letters and spaces only).';
    }

    nextErrors.email = validateEmail(email);

    const phoneNumber = parsePhoneNumberFromString(phone);
    if (!phone || !phoneNumber || !phoneNumber.isValid()) {
      nextErrors.phone = 'Enter a valid phone number';
    }

    const cityTrimmed = formData.city.trim();
    if (citiesLoadError) {
      nextErrors.city = 'City list could not be loaded. Please refresh the page.';
    } else if (!cityTrimmed) {
      nextErrors.city = 'City is required';
    } else if (cityAllowSet.size > 0 && !cityAllowSet.has(cityTrimmed)) {
      nextErrors.city = 'Select a city from the list';
    }

    const companyName = formData.companyName.trim();
    if (!companyName) {
      nextErrors.companyName = 'Company Name is required';
    } else if (companyName.length > 150) {
      nextErrors.companyName = 'Company Name is too long';
    }

    const productServices = formData.productServices.trim();
    if (!productServices) {
      nextErrors.productServices = 'Product/Services is required';
    }

    const msg = formData.message.trim();
    if (!msg || msg.length < 10) {
      nextErrors.message = 'Message must be at least 10 characters';
    } else if (msg.length > 500) {
      nextErrors.message = 'Message must be at most 500 characters';
    }

    setFormErrors(nextErrors);
    return (
      !nextErrors.fullName &&
      !nextErrors.email &&
      !nextErrors.phone &&
      !nextErrors.city &&
      !nextErrors.companyName &&
      !nextErrors.productServices &&
      !nextErrors.message
    );
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    const isFormValid = validateForm();
    if (!isFormValid) {
      setSubmitStatus('error');
      return;
    }
    
    // Captcha check is temporarily disabled.

    setIsSubmitting(true);
    setSubmitStatus(null);

    try {
      const API_BASE_URL = import.meta.env.VITE_API_URL || "";
      const endpointUrl = `${API_BASE_URL}/api/contact-form`;
      
      const response = await fetch(endpointUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          fullName: formData.fullName.trim(),
          email: formData.email.trim(),
          phone: formData.phone.startsWith('+') ? formData.phone : `+${formData.phone}`,
          city: formData.city.trim(),
          companyName: formData.companyName.trim(),
          productServices: formData.productServices.trim(),
          salesSupport: formData.salesSupport,
          message: formData.message.trim()
        })
      });

      const data = await response.json();

      if (response.ok && data.success) {
        setSubmitStatus('success');
        setShowSuccessOverlay(true);
        setFormData({
          fullName: '',
          email: '',
          phone: '+91',
          city: '',
          companyName: '',
          productServices: '',
          salesSupport: 'Sales',
          message: ''
        });
        setCityQuery('');
        setFormErrors({
          fullName: '',
          email: '',
          phone: '',
          city: '',
          companyName: '',
          productServices: '',
          message: '',
        });
      } else {
        setSubmitStatus('error');
        console.error('Form submission error:', data.message || 'Unknown error');
      }
    } catch (error) {
      console.error('Form submission error:', error);
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
    <>
      {showSuccessOverlay && (
        <SubmissionSuccessOverlay
          onDone={() => {
            setShowSuccessOverlay(false);
            setSubmitStatus(null);
          }}
        />
      )}
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
                  <label htmlFor="contact-full-name" className="block text-sm font-medium text-gray-700 mb-1">
                    Full Name *
                  </label>
                  <input
                    id="contact-full-name"
                    type="text"
                    name="fullName"
                    value={formData.fullName}
                    onChange={handleChange}
                    placeholder="Full Name"
                    required
                    className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent text-sm"
                  />
                  {formErrors.fullName && (
                    <p className="mt-1 text-xs text-red-600">{formErrors.fullName}</p>
                  )}
                </div>
                <div>
                  <label htmlFor="contact-email" className="block text-sm font-medium text-gray-700 mb-1">
                    Email Address *
                  </label>
                  <input
                    id="contact-email"
                    type="email"
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                    placeholder="Email Address"
                    required
                    className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent text-sm"
                  />
                  {formErrors.email && (
                    <p className="mt-1 text-xs text-red-600">{formErrors.email}</p>
                  )}
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                  <label htmlFor="contact-phone" className="block text-sm font-medium text-gray-700 mb-1">
                    Phone Number *
                  </label>
                  <PhoneInput
                    country="in"
                    value={formData.phone}
                    onChange={handlePhoneChange}
                    inputProps={{
                      id: 'contact-phone',
                      name: 'phone',
                      required: true,
                    }}
                    containerClass="w-full"
                    inputClass="!w-full !h-[50px] !pl-12 !text-sm !border !border-gray-300 focus:!outline-none focus:!ring-2 focus:!ring-[#7abc43] focus:!border-transparent"
                    buttonClass="!border !border-gray-300 !bg-white"
                    dropdownClass="!text-sm"
                  />
                  {formErrors.phone && (
                    <p className="mt-1 text-xs text-red-600">{formErrors.phone}</p>
                  )}
                </div>
                <div className="relative">
                  <label htmlFor="contact-sales-support" className="block text-sm font-medium text-gray-700 mb-1">
                    Sales / Support
                  </label>
                  <select
                    id="contact-sales-support"
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

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                  <label htmlFor="contact-company-name" className="block text-sm font-medium text-gray-700 mb-1">
                    Company Name *
                  </label>
                  <input
                    id="contact-company-name"
                    type="text"
                    name="companyName"
                    value={formData.companyName}
                    onChange={handleChange}
                    placeholder="Company Name"
                    required
                    className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent text-sm"
                  />
                  {formErrors.companyName && (
                    <p className="mt-1 text-xs text-red-600">{formErrors.companyName}</p>
                  )}
                </div>
                <div>
                  <label htmlFor="contact-product-services" className="block text-sm font-medium text-gray-700 mb-1">
                    Product/Services *
                  </label>
                  <select
                    id="contact-product-services"
                    name="productServices"
                    value={formData.productServices}
                    onChange={handleChange}
                    required
                    className="w-full px-4 py-3 pr-10 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent appearance-none bg-white text-sm cursor-pointer"
                  >
                    <option value="">Select Product/Services</option>
                    <option value="Ash Utilisation">Ash Utilisation</option>
                    <option value="Coal Supply and Handling">Coal Supply and Handling</option>
                    <option value="Green Mobility">Green Mobility</option>
                    <option value="Employee Transportation">Employee Transportation</option>
                    <option value="ON-Call / ON-Demand Rides">ON-Call / ON-Demand Rides</option>
                    <option value="Corporate Airport Transfers">Corporate Airport Transfers</option>
                    <option value="Venwind Refex">Venwind Refex</option>
                  </select>
                  {formErrors.productServices && (
                    <p className="mt-1 text-xs text-red-600">{formErrors.productServices}</p>
                  )}
                </div>
              </div>

              <div className="mb-4">
                <label
                  htmlFor="contact-city-combobox"
                  className="block text-sm font-medium text-gray-700 mb-1"
                >
                  City *
                </label>
                <input type="hidden" name="city" value={formData.city} required readOnly aria-hidden />
                <Combobox
                  value={formData.city || null}
                  onChange={(val) => {
                    const next = val || '';
                    setFormData((prev) => ({ ...prev, city: next }));
                    setCityQuery('');
                    setFormErrors((prev) => ({ ...prev, city: '' }));
                  }}
                  disabled={citiesLoading || !!citiesLoadError}
                >
                  <div className="relative">
                    <ComboboxInput
                      id="contact-city-combobox"
                      className="w-full px-4 py-3 pr-18 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent text-sm disabled:bg-gray-100 disabled:cursor-not-allowed"
                      displayValue={() => formData.city || cityQuery}
                      onChange={(e) => {
                        const q = e.target.value;
                        setCityQuery(q);
                        setFormData((prev) => {
                          if (prev.city && q !== prev.city) {
                            return { ...prev, city: '' };
                          }
                          return prev;
                        });
                        setFormErrors((prev) => ({ ...prev, city: '' }));
                      }}
                      placeholder={citiesLoading ? 'Loading cities…' : 'Type to search cities'}
                      autoComplete="off"
                    />
                    {formData.city && (
                      <button
                        type="button"
                        onClick={() => {
                          setFormData((prev) => ({ ...prev, city: '' }));
                          setCityQuery('');
                          setFormErrors((prev) => ({ ...prev, city: '' }));
                        }}
                        className="absolute inset-y-0 right-8 flex items-center px-2 text-gray-500 hover:text-gray-700"
                        aria-label="Clear selected city"
                        title="Clear selected city"
                      >
                        <i className="ri-close-line text-lg" aria-hidden />
                      </button>
                    )}
                    <ComboboxButton className="absolute inset-y-0 right-0 flex items-center px-2 text-gray-500">
                      <i className="ri-arrow-down-s-line text-xl" aria-hidden />
                    </ComboboxButton>
                    <ComboboxOptions className="absolute z-50 mt-1 max-h-60 w-full overflow-auto rounded-md bg-white py-1 text-sm shadow-lg ring-1 ring-black/5 focus:outline-none">
                      {citiesLoading ? (
                        <div className="px-4 py-2 text-gray-500">Loading cities…</div>
                      ) : filteredCityOptions.length === 0 ? (
                        <div className="px-4 py-2 text-gray-500">No matching cities</div>
                      ) : (
                        filteredCityOptions.map((city) => (
                          <ComboboxOption
                            key={city}
                            value={city}
                            className="cursor-pointer select-none px-4 py-2 text-gray-900 data-[focus]:bg-[#e8f4fd] data-[selected]:font-medium"
                          >
                            {city}
                          </ComboboxOption>
                        ))
                      )}
                    </ComboboxOptions>
                  </div>
                </Combobox>
                {citiesLoadError && (
                  <p className="mt-1 text-xs text-red-600">{citiesLoadError}</p>
                )}
                {formErrors.city && (
                  <p className="mt-1 text-xs text-red-600">{formErrors.city}</p>
                )}
              </div>

              <div className="mb-4">
                <label htmlFor="contact-message" className="block text-sm font-medium text-gray-700 mb-1">
                  Message *
                </label>
                <textarea
                  id="contact-message"
                  name="message"
                  value={formData.message}
                  onChange={handleChange}
                  placeholder="Your Message"
                  rows={6}
                  minLength={10}
                  maxLength={500}
                  required
                  className="w-full px-4 py-3 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-[#7abc43] focus:border-transparent resize-none text-sm"
                ></textarea>
                <p className="text-xs text-gray-500 mt-1">{formData.message.length}/500 characters</p>
                {formErrors.message && (
                  <p className="mt-1 text-xs text-red-600">{formErrors.message}</p>
                )}
              </div>

              {/* reCAPTCHA temporarily disabled
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
                  <input
                    type="checkbox"
                    id="captcha"
                    className="w-6 h-6 cursor-pointer accent-[#7abc43]"
                  />

                  <label
                    htmlFor="captcha"
                    className="text-sm text-gray-700 cursor-pointer select-none"
                  >
                    I'm not a robot
                  </label>

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
              */}


              {submitStatus === 'success' && (
                <div className="mb-4 p-4 bg-green-50 border border-green-200">
                  <p className="text-green-700 text-sm">{successMsg}</p>
                </div>
              )}

              {submitStatus === 'error' && (
                <div className="mb-4 p-4 bg-red-50 border border-red-200">
                  <p className="text-red-700 text-sm">
                    {formErrors.fullName ||
                    formErrors.email ||
                    formErrors.phone ||
                    formErrors.city ||
                    formErrors.companyName ||
                    formErrors.productServices ||
                    formErrors.message
                      ? 'Please correct the highlighted fields.'
                      : errorMsg}
                  </p>
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
    </>
  );
}
