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
import { ProfileModel } from "./models/Profile.js";
const sequelize = new Sequelize('mysql://root:123456@localhost:3306/playerStatsTrackerDB');
// const sequelize = new Sequelize('playerStatsTrackerDB', 'root', '123456', {host: 'localhost', dialect: 'mysql'})
export const User = UserModel(sequelize);
export const Profile = ProfileModel(sequelize);
// export const Payment = PaymentModel(sequelize)