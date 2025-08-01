// server/routes/upload.js
const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination: 'server/uploads/',
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({ storage });

router.post('/', upload.single('cardImage'), (req, res) => {
  if (!req.file) return res.status(400).send('No file uploaded');
  res.json({ image_url: `/uploads/${req.file.filename}` });
});

module.exports = router;
