// Load environment variables early
require('dotenv').config();
require('/app/db.js');
require('./DatabaseConnection');
import DatabaseConnection from './db.js';

// Core modules
const express = require('express');
const cors = require('cors');

// Internal modules
let db = new DatabaseConnection(process.env.DB_HOST, process.env.DOCKER_USER, process.env.DOCKER_PASS, process.env.MYSQL_DATABASE);
db.connect;

// const cardRoutes = require('./routes/cards'); // Uncomment when ready

const app = express();
const PORT = process.env.PORT || 5000;

// 🛡️ Middleware
app.use(cors());
app.use(express.json());

// 🔍 Health Check Routes
app.get('/', (_, res) => res.send('Server is running'));
app.get('/api/health', (_, res) => res.json({ status: 'Server is running!' }));

// 📦 API Routes
// app.use('/api/cards', cardRoutes); // Future route integration

// 🚀 Start Server After DB Connection
