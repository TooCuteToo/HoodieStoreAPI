const express = require("express");
const router = express.Router();
const {
  getProducts,
  getProduct,
  getOrders,
  postFavorite,
  getCustomer,
  createCustomer,
  editCustomer,
  getFavoriteProduct,
  createDetailOrder,
  createOrder,
  getCategories,
  getProductsByCategory,
  getOrderDetail,
  deleteFavorite,
  deleteOrder,
} = require("./dboperations");

router.get("/products", (req, res) => {
  getProducts().then((result) => res.json(result[0]));
});

router.get("/products/:id", (req, res) => {
  getProduct(req.params.id).then((result) => res.json(result[0]));
});

router.get("/categories", (req, res) => {
  getCategories().then(result => res.json(result[0]));
})

router.get("/categories/:id", (req, res) => {
  getProductsByCategory(req.params.id).then(result => res.json(result[0]));
})

router.get("/orders/:id", (req, res) => {
  const customerId = req.params.id;
  getOrders(customerId).then((result) => res.json(result[0]));
});

router.get("/ordersdetail/:id", (req, res) => {
  const orderId = req.params.id;
  getOrderDetail(orderId).then((result) => res.json(result[0]));
})

router.post("/favorites", (req, res) => {
  const favoriteProduct = { ...req.body };
  postFavorite(favoriteProduct.customerId, favoriteProduct.Id).then((result) =>
    res.status(201).end()
  );
});

router.post("/customer", (req, res) => {
  const customer = { ...req.body };
  return getCustomer(customer).then((result) => res.json(result[0]));
});

router.post("/customers", (req, res) => {
  const customer = { ...req.body };
  return createCustomer(customer)
  .then((result) => res.status(201).end())
  .catch((error) => res.status(400).end());
});

router.post("/favorite", (req, res) =>
  getFavoriteProduct(req.body).then((result) => res.json(result[0]))
);

router.post("/delete_favorite", (req, res) => {
  const favorite = { ...req.body };
  return deleteFavorite(favorite)
  .then((result) => res.status(201).end())
  .catch((error) => res.status(400).end());
})

router.post("/orders", (req, res) => {
  console.log(req.body);
  createOrder(req.body).then(() => {
    createDetailOrder(req.body).then(() => res.status(201).end());
  });
});

router.post("/order_detail", (req, res) => {
  deleteOrder(req.body)
  .then((result) => res.status(200).end())
  .catch((error) => res.status(400).end());
})

router.put("/customer/:id", (req, res) => {
  const customer = { ...req.body, customerId: req.params.id };
  return editCustomer(customer)
  .then((result) => res.status(201).end())
  .catch((error) => res.status(400).end());
});

module.exports = router;
