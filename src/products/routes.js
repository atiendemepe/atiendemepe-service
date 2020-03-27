const express = require('express');
require('express-async-errors');

const { searchProducts } = require('./products');

var router = express.Router();

router.get('/', async (req, res, next) => {
  let data = await searchProducts();
  res.json(data);
})

module.exports = router;