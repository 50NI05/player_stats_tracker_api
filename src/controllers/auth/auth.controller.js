import { pool } from '../../db.js'
import bcryptjs from "bcryptjs";
import { generateJWT } from '../../helpers/generateJWT.js';

export const auth = async (req, res) => {
  const { body } = req
  const email = body.email;
  const password = body.password;

  try {
    const [users] = await pool.query('SELECT * FROM t_user WHERE t_user.email = ? AND t_user.password = ?', [email, password])

    const userDB = users.find(e => e.password === password)
    const passwordDB = typeof userDB?.password === 'string' ? userDB.password : ''
    const userId = typeof userDB?.id === 'number' ? userDB.id : null

    console.log(userDB);
    // res.send('Hola')
    if (users.length === 0) {
      res.status(400).json({
        status: 'Error',
        data: 'Incorrect Email! Please try again'
      })
    }

    const salt = await bcryptjs.genSalt(10)
    const hash = bcryptjs.hash(password, salt)

    console.log(hash);

    const validatePassword = (password === passwordDB ? true : false)
    if (!validatePassword) {
      res.status(400).json({
        status: 'Error',
        data: 'Incorrect Password! Please try again'
      })
    }

    const token = await generateJWT(userId?.toString())

    if (token === undefined) {
      res.status(400).json({
        status: 'Error',
        data: 'Error token'
      })
    }
    
    res.send({
      status: 'SUCCESS',
      data: token
    })

  } catch (error) {
    res.status(500).json({
      status: 'Error',
      data: 'An error has occurred'
    })
  }
}