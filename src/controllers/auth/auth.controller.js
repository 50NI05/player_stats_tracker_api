import { pool } from '../../db.js'
import { generateJWT } from '../../helpers/generateJWT.js';
import bcryptjs from "bcryptjs";

export const logIn = async (req, res) => {
  const { body } = req
  const email = body.email;
  const password = body.password;

  if (req.session.login) {
    res.json({
      status: 'ERROR',
      data: 'User already logged in.'
    });
  } else {
    try {
      const [users] = await pool.query('SELECT * FROM t_user WHERE t_user.email = ?', [email])

      if (users.length === 0) {
        res.status(400).json({
          status: 'Error',
          data: 'Incorrect Email! Please try again'
        })
      } else {
        const validatePassword = await bcryptjs.compare(password, users[0].password)

        if (!validatePassword) {
          res.status(400).json({
            status: 'Error',
            data: 'Incorrect Password! Please try again'
          })
        } else {
          const token = await generateJWT(users[0].id)

          const cookieOptions = {
            expires: new Date(
              Date.now() + 3600000
            ),
            httpOnly: true
          }
          req.session.login = true;
          res.cookie('jwt', token, cookieOptions);

          if (token.length === 0) {
            res.status(400).json({
              status: 'Error',
              data: 'Error token'
            })
          }

          res.send({
            status: 'SUCCESS',
            data: token,
            id: users[0].id,
            profile: users[0].profile,
            email: users[0].email
          })
        }
      }

    } catch (error) {
      res.status(500).json({
        status: 'Error',
        data: 'An error has occurred'
      })
    }
  }
}

export const logOut = async (req, res) => {
  if (req.session.login) {
    res.clearCookie('jwt');
    req.session.login = false
    res.status(200).json({
      status: 'SUCCESS',
    })
  } else {
    res.json({
      status: 'ERROR',
      data: 'User is not logged in.'
    });
  }
}