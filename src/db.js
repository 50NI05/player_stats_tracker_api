// import mysql2 from "mysql2/promise";
// import { DB_HOST, DB_PORT, DB_DATABASE, DB_USER, DB_PASSWORD } from "./config.js";

// export const pool = mysql2.createPool({
//   host: DB_HOST,
//   user: DB_USER,
//   password: DB_PASSWORD,
//   port: DB_PORT,
//   database: DB_DATABASE,
// });

import Sequelize from "sequelize";
import { UserModel } from "../src/models/User.js";
const sequelize = new Sequelize('mysql://root:9262865472@localhost:3306/registerPaymentDB')
// const sequelize = new Sequelize('registerPaymentDB', 'root', '123456', {host: 'localhost', dialect: 'mysql'})
export const User = UserModel(sequelize);
// export const Payment = PaymentModel(sequelize)