import { pool } from '../../db.js'

export const auth = async (req, res) => {
  const { body } = req
  const user = body.email;
  const pass = body.password;

  try {
    const [users] = await pool.query('SELECT * FROM t_user WHERE t_user.email = ? AND t_user.password = ?', [user, pass])

    console.log(users);
    // res.send('Hola')
    if (users.length === 0) {
      res.send({
        status: 'Error',
        data: 'Incorrect Email! Please try again'
      })
    }

  } catch (error) {

  }
}