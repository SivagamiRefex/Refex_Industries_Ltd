require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const fs = require("fs");
const morgan = require("morgan");
const path = require("path");
const cors = require("cors");
const { sequelize } = require("./models");
const history = require("connect-history-api-fallback");
const status = require("./helpers/response");
const session = require("express-session");
const passport = require("passport");
const axios = require('axios')
const downloadBSEExcel = require('./bseDownloader');
const readExcelFile = require('./readExcel');


const app = express();



// COMMON HEADERS (IMPORTANT)

app.get('/api/refex-stock', async (req, res) => {

  await downloadBSEExcel();
  const data = readExcelFile();
  res.json({
    success: true,
    records: data
  });
});

// CORS must be applied before any other middleware
// More permissive CORS for development
app.use((req, res, next) => {
  // Log all incoming requests for debugging
  console.log(`${new Date().toISOString()} - ${req.method} ${req.url} from origin: ${req.headers.origin || 'no-origin'}`);
  
  // Set CORS headers for all requests
  res.header('Access-Control-Allow-Origin', req.headers.origin || '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With, Accept, Origin, Cache-Control, Pragma');
  res.header('Access-Control-Allow-Credentials', 'true');
  res.header('Access-Control-Max-Age', '86400'); // 24 hours
  
  // Handle preflight requests
  if (req.method === 'OPTIONS') {
    console.log('Handling preflight request for:', req.url);
    return res.status(200).end();
  }
  
  next();
});

// Additional CORS middleware as backup
app.use(cors({
  origin: true, // Allow all origins in development
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With', 'Accept', 'Origin', 'Cache-Control', 'Pragma'],
  optionsSuccessStatus: 200
}));

// Middleware to parse incoming JSON data ==================================
app.use(express.json({  }));
app.use(bodyParser.urlencoded({ limit: "100mb", extended: true }));







// Routes
app.use("/auth", require("./routes/auth"));
app.use("/cms", require("./routes/cms"));
app.use("/api/cms/home", require("./routes/home_cms"));
app.use("/api/cms/about", require("./routes/about_cms"));
app.use("/api/cms/capabilities", require("./routes/capabilities_cms"));
app.use("/api/cms/ash-utilization", require("./routes/ash_utilization_cms"));
app.use("/api/cms/green-mobility", require("./routes/green_mobility_cms"));
app.use("/api/cms/venwind-refex", require("./routes/venwind_refex_cms"));
app.use("/api/cms/refrigerant-gas", require("./routes/refrigerant_gas_cms"));
app.use("/api/cms/esg", require("./routes/esg_cms"));
app.use("/api/cms/sustainability", require("./routes/sustainability_cms"));
app.use("/api/cms/products", require("./routes/products_cms"));
app.use("/api/cms/newsroom", require("./routes/newsroom_cms"));
app.use("/api/cms/contact", require("./routes/contact_cms"));
app.use("/api/cms/header", require("./routes/header_cms"));
app.use("/api/cms/footer", require("./routes/footer_cms"));
app.use("/api/cms/investors", require("./routes/investors_cms"));
app.use("/api/stock", require("./routes/stock"));





app.get('/nse/quote', async (req, res) => {
  const symbol = req.query.symbol || 'REFEX';

  try {
    // Step 1: Create NSE session
    await client.get('https://www.nseindia.com', {
      headers: {
        ...commonHeaders,
        'Accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
      }
    });

    // Step 2: Call actual API
    const response = await client.get(
      `https://www.nseindia.com/api/quote-equity?symbol=${symbol}`,
      {
        headers: {
          'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120',
          'Referer': `https://www.nseindia.com/get-quotes/equity?symbol=${symbol}`,
          'Accept': 'application/json'
        }
      }
    );

    return res.json({
      status: true,
      data: response.data
    });

  } catch (err) {
    return res.status(500).json({
      status: false,
      error: err.message
    });
  }
});



// Health check endpoint
app.get("/api/health", (req, res) => {
  res.json({
    success: true,
    message: "Server is running well",
    timestamp: new Date().toISOString()
  });
});

// CORS test endpoint
app.get("/api/cors-test", (req, res) => {
  res.json({
    success: true,
    message: "CORS is working!",
    origin: req.headers.origin,
    timestamp: new Date().toISOString()
  });
});

// Test POST endpoint for CORS
app.post("/api/cors-test", (req, res) => {
  res.json({
    success: true,
    message: "POST CORS is working!",
    body: req.body,
    origin: req.headers.origin,
    timestamp: new Date().toISOString()
  });
});

// // simple route
// app.get("/", (req, res) => {
//   return res.json({
//     success: true,
//     message: "Backend is running well",
//   });
// });

// app.use("/auth", require("./src/routes/auth"));

// app.use(
//   "/api",
//   require("./src/routes/user"),
//   require("./src/routes/dashboard"),
//   require("./src/routes/sales_management/customer"),
//   require("./src/routes/sales_management/lead"),
//   require("./src/routes/sales_management/quotation"),
//   require("./src/routes/sales_management/nsop_quotation"),
//   require("./src/routes/sales_management/proforma_invoice"),
//   require("./src/routes/sales_management/brief_sheet"),
//   require("./src/routes/trip_management/masters/operator"),
//   require("./src/routes/trip_management/masters/airport"),
//   require("./src/routes/trip_management/masters/aircraft"),
//   require("./src/routes/trip_management/masters/aircraft_model"),
//   require("./src/routes/trip_management/masters/country"),
//   require("./src/routes/trip_management/masters/city"),
//     require("./src/routes/trip_management/masters/zone"),
//   require("./src/routes/trip_management/masters/designation"),
//   require("./src/routes/trip_management/masters/crew"),
//   require("./src/routes/sales_management/quotation_download")
// );

// Image upload endpoint - MUST be before the catch-all API route
const uploadImage = require('./middlewares/uploadImage');
app.post('/api/upload/image', uploadImage.single('image'), (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: 'No image file provided' });
    }
    
    // Return the file path relative to the server
    const imageUrl = `/uploads/images/${req.file.filename}`;
    res.json({ 
      success: true, 
      imageUrl: imageUrl,
      filename: req.file.filename 
    });
  } catch (error) {
    console.error('Image upload error:', error);
    res.status(500).json({ error: 'Failed to upload image' });
  }
});

// PDF upload endpoint
const uploadPdf = require('./middlewares/uploadPdf');
app.post('/api/upload/pdf', uploadPdf.single('pdf'), (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: 'No PDF file provided' });
    }
    
    // Return the file path relative to the server
    const pdfUrl = `/uploads/pdfs/${req.file.filename}`;
    res.json({ 
      success: true, 
      pdfUrl: pdfUrl,
      filename: req.file.filename 
    });
  } catch (error) {
    console.error('PDF upload error:', error);
    res.status(500).json({ error: 'Failed to upload PDF' });
  }
});

// PDF upload endpoint with subfolder support
const multer = require('multer');
app.post('/api/upload/pdf/:subfolder', (req, res) => {
  const subfolder = req.params.subfolder;
  const uploadDir = path.join(__dirname, 'uploads', 'pdfs', subfolder);
  
  // Ensure subfolder exists
  if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
  }
  
  const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, uploadDir);
    },
    filename: (req, file, cb) => {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
      cb(null, 'pdf-' + uniqueSuffix + '.pdf');
    }
  });
  
  const upload = multer({
    storage: storage,
    fileFilter: (req, file, cb) => {
      if (file.mimetype === 'application/pdf') {
        cb(null, true);
      } else {
        cb(new Error('Only PDF files are allowed'), false);
      }
    },
    limits: { fileSize: 50 * 1024 * 1024 } // 50MB limit
  }).single('pdf');
  
  upload(req, res, (err) => {
    if (err) {
      console.error('PDF upload error:', err);
      return res.status(400).json({ error: err.message || 'Failed to upload PDF' });
    }
    
    if (!req.file) {
      return res.status(400).json({ error: 'No PDF file provided' });
    }
    
    const pdfUrl = `/uploads/pdfs/${subfolder}/${req.file.filename}`;
    res.json({ 
      success: true, 
      pdfUrl: pdfUrl,
      filename: req.file.filename 
    });
  });
});

// Audio upload endpoint
const uploadAudio = require('./middlewares/uploadAudio');
app.post('/api/upload/audio', uploadAudio, (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: 'No audio file provided' });
    }
    
    // Return the file path relative to the server
    const audioUrl = `/uploads/audio/${req.file.filename}`;
    res.json({ 
      success: true, 
      audioUrl: audioUrl,
      filename: req.file.filename 
    });
  } catch (error) {
    console.error('Audio upload error:', error);
    res.status(500).json({ error: 'Failed to upload audio' });
  }
});

// Serve uploaded files
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Download PDF from URL and save to server (with optional subfolder)
app.post('/api/download-pdf-from-url/:subfolder?', async (req, res) => {
  try {
    const { url } = req.body;
    const subfolder = req.params.subfolder || '';
    
    if (!url) {
      return res.status(400).json({ error: 'URL is required' });
    }

    console.log('Downloading PDF from URL:', url);
    if (subfolder) console.log('Subfolder:', subfolder);

    // Fetch the PDF from the URL
    const response = await axios({
      method: 'GET',
      url: url,
      responseType: 'arraybuffer',
      timeout: 60000, // 60 second timeout
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
      }
    });

    // Check if response is a PDF
    const contentType = response.headers['content-type'];
    if (!contentType || (!contentType.includes('application/pdf') && !contentType.includes('octet-stream'))) {
      console.log('Content-Type:', contentType);
      // Still try to save if it looks like a PDF
    }

    // Generate unique filename
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const filename = `pdf-${uniqueSuffix}.pdf`;
    
    // Ensure uploads/pdfs directory (with optional subfolder) exists
    const uploadsDir = subfolder 
      ? path.join(__dirname, 'uploads', 'pdfs', subfolder)
      : path.join(__dirname, 'uploads', 'pdfs');
    if (!fs.existsSync(uploadsDir)) {
      fs.mkdirSync(uploadsDir, { recursive: true });
    }
    
    // Save the PDF to the uploads/pdfs folder
    const filePath = path.join(uploadsDir, filename);
    fs.writeFileSync(filePath, response.data);
    
    console.log('PDF saved to:', filePath);
    
    // Return the local path
    const pdfUrl = subfolder 
      ? `/uploads/pdfs/${subfolder}/${filename}`
      : `/uploads/pdfs/${filename}`;
    res.json({ 
      success: true, 
      pdfUrl: pdfUrl,
      filename: filename,
      originalUrl: url
    });
  } catch (error) {
    console.error('Error downloading PDF from URL:', error.message);
    res.status(500).json({ 
      error: 'Failed to download PDF from URL',
      details: error.message 
    });
  }
});

// Download proxy endpoint - downloads file from external URL and streams to client
app.post('/api/download-proxy', async (req, res) => {
  try {
    const { url, filename } = req.body;
    
    if (!url) {
      return res.status(400).json({ error: 'URL is required' });
    }

    console.log('Download proxy request for:', url);
    
    // Fetch the file from the external URL
    const response = await axios({
      method: 'GET',
      url: url,
      responseType: 'stream',
      timeout: 30000,
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
      }
    });

    // Get content type from response or default to PDF
    const contentType = response.headers['content-type'] || 'application/pdf';
    const contentLength = response.headers['content-length'];
    
    // Set headers for file download
    res.setHeader('Content-Type', contentType);
    res.setHeader('Content-Disposition', `attachment; filename="${filename || 'document.pdf'}"`);
    if (contentLength) {
      res.setHeader('Content-Length', contentLength);
    }

    // Pipe the response stream to the client
    response.data.pipe(res);
    
  } catch (error) {
    console.error('Download proxy error:', error.message);
    res.status(500).json({ error: 'Failed to download file', message: error.message });
  }
});

app.all("/api/*", (req, res) => {
  return status.responseStatus(res, 404, "Endpoint Not Found");
});

// Serve static files from the 'client/dist' directory (only if it exists)
const distPath = path.join(__dirname, "./dist");
const distIndexPath = path.join(__dirname, "./dist", "index.html");

if (fs.existsSync(distPath) && fs.existsSync(distIndexPath)) {
  app.use(express.static(distPath));
  app.use(history());
  
  app.get("*", (req, res) => {
    res.sendFile(distIndexPath);
  });
} else {
  // In development, if dist doesn't exist, just return API info for root
  app.get("/", (req, res) => {
    res.json({
      success: true,
      message: "Backend API server is running",
      note: "Client should be running separately on its dev server"
    });
  });
}

// set port
const PORT = process.env.APP_PORT || 8080;

sequelize
  .sync({ alter: true })
  .then(() => {
    console.log("Database synced successfully");
    startServer();
  })
  .catch((err) => {
    console.error("Error syncing database:", err.message);
    // If it's a "too many keys" error, continue anyway since tables likely exist
    if (err.code === 'ER_TOO_MANY_KEYS' || err.original?.code === 'ER_TOO_MANY_KEYS' || err.message?.includes('Too many keys')) {
      console.warn("Warning: Some table alterations failed due to too many keys. Continuing with existing table structure...");
      console.warn("Note: You may need to run the migration script manually: node scripts/add_board_member_fields.js");
    } else {
      // For other errors, still try to start the server
      console.warn("Warning: Database sync had errors, but starting server anyway...");
    }
    startServer();
  });

function startServer() {
  const server = app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
  });

  server.on('error', (err) => {
    if (err.code === 'EADDRINUSE') {
      console.error(`\n❌ Port ${PORT} is already in use!`);
      console.error(`Please stop the existing server or use a different port.`);
      console.error(`\nTo find and kill the process using port ${PORT}:`);
      console.error(`  Windows: netstat -ano | findstr :${PORT}`);
      console.error(`  Then: taskkill /PID <PID> /F`);
      console.error(`  Linux/Mac: lsof -ti:${PORT} | xargs kill -9\n`);
      process.exit(1);
    } else {
      throw err;
    }
  });
}
