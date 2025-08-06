const express = require('express');
const cors = require('cors');
require('dotenv').config();
require('./validate_env');

const db = require('./db'); // Modular DB connection

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Health check
app.get('/', (req, res) => {
  res.send('Server is running');
});

app.get('/api/health', (req, res) => {
  res.json({ status: 'Server is running!' });
});

// Future route modules
// const cardRoutes = require('./routes/cards');
// app.use('/api/cards', cardRoutes);

// Start server after DB connects
db.connect(err => {
  if (err) {
    console.error('❌ Database connection failed:', err.stack);
    process.exit(1);
  }
  console.log('✅ Connected to MySQL as', db.threadId);

  app.listen(PORT, () => {
    console.log(`🚀 Server listening on port ${PORT}`);
  });
});
