// Load environment variables early
require('dotenv').config();
require('/app/config/database.js');
const DatabaseConnection = require('./config/DatabaseConnection');


// Core modules
const express = require('express');
const cors = require('cors');

// Internal modules
const db = new DatabaseConnection({
    host:process.env.DB_HOST, 
    user:process.env.DB_USER, 
    password:process.env.DB_PASSWORD, 
    database:process.env.DB_NAME
});
db.connect();

// const cardRoutes = require('./routes/cards'); // Uncomment when ready

const app = express();
const PORT = process.env.PORT || 5000;

/* 🛡️ Middleware
app.use(cors());
app.use(express.json());

 🔍 Health Check Routes
app.get('/', (_, res) => res.send('Server is running'));
app.get('/api/health', (_, res) => res.json({ status: 'Server is running!' }));
*/
// 📦 API Routes
// app.use('/api/cards', cardRoutes); // Future route integration

// 🚀 Start Server After DB Connection
