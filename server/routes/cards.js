const express = require('express');
const router = express.Router();

// Example GET route
router.get('/', (req, res) => {
  res.json({ message: 'Cards endpoint placeholder' });
});

module.exports = router;
