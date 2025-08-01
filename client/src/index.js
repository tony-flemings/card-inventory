const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 3000;

// Ensure uploads folder exists
const uploadDir = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir);
}

// Multer setup for image uploads
const storage = multer.diskStorage({
  destination: uploadDir,
  filename: (req, file, cb) => {
    const uniqueName = Date.now() + path.extname(file.originalname);
    cb(null, uniqueName);
  }
});
const upload = multer({ storage });

// Serve static files (HTML, CSS, etc.)
app.use(express.static(path.join(__dirname, 'public')));

// Serve uploaded images
app.use('/uploads', express.static(uploadDir));

// Upload endpoint
app.post('/upload', upload.single('cardImage'), (req, res) => {
  if (!req.file) return res.status(400).send('No file uploaded');
  const imageUrl = `/uploads/${req.file.filename}`;
  res.json({ image_url: imageUrl });
});

// Start server
app.listen(3000, '0.0.0.0', () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});

app.get('/', (req, res) => {
  res.send('CardInventory is alive!');
});
