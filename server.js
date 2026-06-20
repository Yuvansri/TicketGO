const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middleware
app.use(cors({
  origin: 'http://localhost:3000',
  credentials: true
}));
app.use(express.json());

// Routes
app.use('/api/auth', require('./routes/auth'));
app.use('/api/transport', require('./routes/transport'));
app.use('/api/bookings', require('./routes/bookings'));

// Health check
app.get('/', (req, res) => {
  res.json({ message: 'Ticketing API is running 🚀' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`\n🚀 Server running on http://localhost:${PORT}`);
  console.log(`📦 Database: ${process.env.DB_NAME} @ ${process.env.DB_HOST}`);
});