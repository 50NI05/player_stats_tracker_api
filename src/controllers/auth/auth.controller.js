import { pool } from '../../db.js'
import { generateJWT } from '../../helpers/generateJWT.js';
import bcryptjs from "bcryptjs";

export const logIn = async (req, res) => {
  const { body } = req
  const email = body.email;
  const password = body.password;

  try {
    const [users] = await pool.query('SELECT * FROM t_user WHERE t_user.email = ?', [email])

    if (users.length === 0) {
      res.json({
        status: 'Error',
        // data: 'Incorrect Email! Please try again'
        data: 'Correo electrónico incorrecto Por favor, inténtelo de nuevo'
      })
    } else {
      const validatePassword = await bcryptjs.compare(password, users[0].password)

      if (!validatePassword) {
        res.json({
          status: 'Error',
          // data: 'Incorrect Password! Please try again'
          data: 'Contraseña incorrecta Por favor, inténtelo de nuevo'
        })
      } else {
        const token = await generateJWT(users[0].id, users[0].firstName, users[0].lastName, users[0].email, users[0].password, users[0].profile)

        if (token.length === 0) {
          res.json({
            status: 'Error',
            data: 'Error token'
          })
        } else {
          const [rows] = await pool.query('UPDATE t_user SET token = ? WHERE id = ?', [token, users[0].id])

          if (rows.affectedRows > 0) {
            res.send({
              status: 'SUCCESS',
              data: token,
              id: users[0].id,
              profile: users[0].profile,
              email: users[0].email
            })
          } else {
            res.send({
              status: 'ERROR',
              // data: 'Error insert token'
              data: 'Error al insertar token'
            })
          }
        }
      }
    }

  } catch (error) {
    res.status(500).json({
      status: 'Error',
      // data: 'An error has occurred'
      data: 'Ha ocurrido un error'
    })
  }
}

export const logOut = async (req, res) => {
  const { body } = req
  const idUser = body.idUser;

  const [session] = await pool.query('SELECT * FROM t_user WHERE id = ?', [idUser])

  if (session[0].token !== null) {
    const [rows] = await pool.query('UPDATE t_user SET token = null WHERE id = ?', [session[0].id])

    if (rows.affectedRows > 0) {
      res.status(200).json({
        status: 'SUCCESS',
      })
    } else {
      res.json({
        status: 'ERROR',
      })
    }

  } else {
    res.json({
      status: 'ERROR',
      data: 'El usuario no ha iniciado sesión.'
    });
  }
}