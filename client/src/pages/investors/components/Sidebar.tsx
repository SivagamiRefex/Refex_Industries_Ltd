//import { Link } from 'react-router-dom';

interface SidebarProps {
  activePage?: string;
}

const investorLinks = [
  { name: 'Key Managerial Personnel', href: '/investors/key-managerial-personnel', slug: 'key-managerial-personnel' },
  { name: 'Financial Information', href: '/investors/financial-information', slug: 'financial-information' },
  { name: 'Annual Reports', href: '/investors/annual-reports', slug: 'annual-reports' },
  { name: 'General Meeting Updates', href: '/investors/general-meeting-updates', slug: 'general-meeting-updates' },
  { name: 'Investor Presentation', href: '/investors/investor-presentation', slug: 'investor-presentation' },
  { name: 'Code of fair Disclosure UPSI', href: '/investors/code-of-fair-disclosure-upsi', slug: 'code-of-fair-disclosure-upsi' },
  { name: 'Policies', href: '/investors/policies', slug: 'policies' },
  { name: 'Credit Ratings', href: '/investors/credit-ratings', slug: 'credit-ratings' },
  { name: 'Recording & Transcripts of Post Earnings / Quarterly Calls', href: '/investors/recording-transcripts-of-post-earnings-quarterly-calls', slug: 'recording-transcripts-of-post-earnings-quarterly-calls' },
  { name: 'Disclosure of Material Events or Information', href: '/investors/disclosure-of-material-events-or-information', slug: 'disclosure-of-material-events-or-information' },
  { name: 'Stock Exchange Quarterly Compliance', href: '/investors/stock-exchange-quarterly-compliance', slug: 'stock-exchange-quarterly-compliance' },
  { name: 'Familiarization Programme for Independent Directors', href: '/investors/familiarization-programme-for-independent-directors', slug: 'familiarization-programme-for-independent-directors' },
  { name: 'Terms and Conditions of Appointment of ID', href: '/investors/terms-and-conditions-of-appointment-of-id', slug: 'terms-and-conditions-of-appointment-of-id' },
  { name: 'IPO', href: '/investors/ipo', slug: 'ipo' },
  { name: 'Rights Issue', href: '/investors/rights-issue', slug: 'rights-issue' },
  { name: 'Financial Statement of Subsidiary', href: '/investors/financial-statement-of-subsidiary', slug: 'financial-statement-of-subsidiary' },
  { name: 'Annual Return', href: '/investors/annual-return', slug: 'annual-return' },
  { name: 'Book Closure of Members Register / Record Date', href: '/investors/book-closure-of-members-register-record-date', slug: 'book-closure-of-members-register-record-date' },
  { name: 'Secretarial Compliance Report', href: '/investors/secretarial-compliance-report', slug: 'secretarial-compliance-report' },
  { name: 'Investor Information', href: '/investors/investor-information', slug: 'investor-information' },
  { name: 'Registrar & Transfer Agent', href: '/investors/registrar-transfer-agent', slug: 'registrar-transfer-agent' },
  { name: 'Newspaper Publication', href: '/investors/newspaper-publication', slug: 'newspaper-publication' },
  { name: 'Unpaid Dividend List and IEPF Shares', href: '/investors/unpaid-dividend-list-and-iepf-shares', slug: 'unpaid-dividend-list-and-iepf-shares' },
  { name: 'Disclosures under SAST Regulations 2011', href: '/investors/disclosures-under-sast-regulations-2011', slug: 'disclosures-under-sast-regulations-2011' },
  { name: 'Employee Stock Option Scheme', href: '/investors/employee-stock-option-scheme', slug: 'employee-stock-option-scheme' },
  { name: 'Monitoring Agency Report', href: '/investors/monitoring-agency-report', slug: 'monitoring-agency-report' },
  { name: 'Statement of Deviation', href: '/investors/statement-of-deviation', slug: 'statement-of-deviation' },
  { name: 'CSR Activities', href: '/investors/csr-activities', slug: 'csr-activities' },
  { name: 'Charter Documents', href: '/investors/charter-documents', slug: 'charter-documents' },
  { name: 'Scheme of Amalgamation / Arrangement', href: '/investors/scheme-of-amalgamation-arrangement', slug: 'scheme-of-amalgamation-arrangement' },
];

/*const sidebarItems = [
  { label: 'CSR Activities', path: '/investors/csr-activities' },
  { label: 'Charter Documents', path: '/investors/charter-documents' },
  { label: 'Scheme of Amalgamation / Arrangement', path: '/investors/scheme-of-amalgamation-arrangement' }
];*/

export default function Sidebar({ activePage }: SidebarProps) {
  return (
    <div className="lg:col-span-4">
      <div className="bg-white shadow-sm p-6 sticky top-24">
        <nav className="space-y-1">
          {investorLinks.map((link, index) => (
            <a
              key={index}
              href={link.href}
              className={`block  w-72 px-4 py-3 text-base transition-colors cursor-pointer border-b-2 ${
                activePage === link.slug
                  ? 'bg-gray-50 text-[#61ce70] border-[#61CE70]'
                  : 'text-gray-700 hover:bg-gray-50 hover:text-[#61CE70] border-transparent hover:border-[#61CE70]'
              }`}
            >
              {link.name}
            </a>
          ))}
        </nav>
      </div>
    </div>
  );
}
