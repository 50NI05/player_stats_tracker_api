import { pool } from '../db.js'

export const auth = async (req, res) => {
  try {
    const { body } = req
    const user = body.email;
    const pass = body.password;

    const [auth] = pool.query('SELECT * FROM t_user WHERE t_user.email = ? AND t_user.password = ?', [user, pass])

    
  } catch (error) {
    
  }
}