const config = require("./dbconfig");
const sql = require("mssql");

async function getProducts() {
  try {
    const pool = await sql.connect(config);
    const products = await pool.request().query("select * from Products");

    return products.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getCategories() {
  try {
    const pool = await sql.connect(config);
    const products = await pool.request().query("select * from ProductsType");

    return products.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getProductsByCategory(typeId) {
  try {
    const pool = await sql.connect(config);
    const products = await pool.request().query(`
      select pr.*
      from Products pr join ProductsType pt 
      on pr.typeId = pt.typeId
      where pr.typeId = '${typeId}'
    `);

    return products.recordsets;
  } catch (error) {
    console.log(error);
  }
}


async function getCustomer({ userName, pass }) {
  const pool = await sql.connect(config);
  const customer = await pool.request().query(`
    select * from Customer
    where userName = '${userName}' and pass = '${pass}'
  `);

  return customer.recordsets;
}

async function getOrders(customerId) {
  try {
    const pool = await sql.connect(config);
    const products = await pool.request().query(`
      select * 
      from ProductOrder
      where customerId = ${customerId}
    `);

    return products.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function createCustomer({ fullName, email, userName, pass }) {
  const pool = await sql.connect(config);
  const customer = await pool.request().query(`
    insert into Customer(fullName, email, userName, pass)
    values('${fullName}', '${email}', '${userName}', '${pass}')
  `);

  return customer.recordsets;
}

async function getProduct(name) {
  try {
    const pool = await sql.connect(config);
    const product = await pool
      .request()
      .query(`select * from Products where name like '%${name}%'`);

    return product.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getFavoriteProduct({ customerId }) {
  try {
    const pool = await sql.connect(config);
    const product = await pool.request().query(`
        select pr.Id, typeId, name, description, material, price, img
        from ProductFavorite pf join Products pr
        on pf.Id = pr.Id
        where customerId = ${customerId}`);

    return product.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getOrderDetail(orderId) {
  try {
    const pool = await sql.connect(config);
    const product = await pool.request().query(`
      select name, img, od.*
      from OrderDetail od
      join Products pr
      on od.Id = pr.Id
      where orderId = ${orderId}
    `);

    return product.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function postFavorite(customerId, Id) {
  const pool = await sql.connect(config);
  const product = await pool.request().query(`
      insert into ProductFavorite(customerId, Id)
      values('${customerId}', '${Id}')
    `);

  return product.recordsets;
}

async function deleteFavorite({ customerId, Id }) {
  const pool = await sql.connect(config);
  const product = await pool.request().query(`
      delete ProductFavorite
      where customerId = ${customerId} and Id = ${Id}
    `);

  return product.recordsets;
}

async function editCustomer({ customerId, fullName, email, userName, pass }) {
  const pool = await sql.connect(config);
  const product = await pool.request().query(`
      update Customer
      set fullName = '${fullName}', email = '${email}', userName = '${userName}', pass = '${pass}'
      where customerId = '${customerId}'
    `);

  return product.recordsets;
}

async function createOrder({ customerId, totalMoney }) {
  try {
    const pool = await sql.connect(config);
    const product = await pool.request().query(`
        insert into ProductOrder(customerId, totalMoney)
        values(${customerId}, ${totalMoney})
    `);

    return product.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function createDetailOrder({orderDetails}) {
  try {
    // select maxId
    const pool = await sql.connect(config);
    const order = await pool.request().query(`
      select MAX(orderId) as Max
      from ProductOrder
    `);
    
    const orderId = order.recordset[0].Max
  
    orderDetails.map(async ({Id, typeId, quantity, money}) => {
      let product = await pool.request().query(`
        insert into OrderDetail
        values(${orderId}, ${Id}, '${typeId}', ${quantity}, ${money})
      `);
    });

    return 0;
  } catch (error) {
    console.log(error);
  }
}

async function deleteOrder({orderId, }) {
  const pool = await sql.connect(config);

  const orderDetail = await pool.request().query(`
    delete OrderDetail
    where orderId = ${orderId}
  `);

  const productOrder = await pool.request().query(`
    delete ProductOrder
    where orderId = ${orderId}
  `);
}

module.exports = {
  getProducts,
  getCustomer,
  getProduct,
  getCategories,
  getProductsByCategory,
  getOrders,
  postFavorite,
  createCustomer,
  editCustomer,
  getFavoriteProduct,
  createOrder,
  createDetailOrder,
  getOrderDetail,
  deleteFavorite,
  deleteOrder,
};
