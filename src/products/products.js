const db = require('../config/db');

async function getPresentationsByProductId (productIds) {
  const presentations = await db.select().from('product_presentations').whereIn('product_id', productIds);
  return presentations.reduce((prev, curr) => {
    let presentations = prev[curr.product_id];
    if (!presentations) {
      presentations = [];
    }
    presentations.push(curr);
    prev[curr.product_id] = presentations;
    return prev;
  }, {});
}

async function searchProducts() {
  const products = await db.select().from('products')
  const productIds = products.map(product => product.id);
  
  const presentationsByProductId = await getPresentationsByProductId(productIds)
  products.forEach(product => {
    product.presentations = presentationsByProductId[product.id];
  });
  return { products };
}

module.exports = {
  searchProducts,
};
