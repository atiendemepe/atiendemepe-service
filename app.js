const express = require('express');
var bodyParser = require('body-parser');

const { productRoutes } = require('./src/products');

const app = express();
const port = 8080;

app.use(bodyParser.json());

app.use('/products', productRoutes);

app.use((err, req, res, next) => {
  console.error(err);
  res.status(500);
  res.json({ message: 'Internal Server Error' });
});

app.listen(port, () => console.log(`App listening o port ${port}`));
