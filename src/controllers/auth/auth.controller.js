// import { pool } from '../../db.js'
import { generateJWT } from '../../helpers/generateJWT.js';
import bcryptjs from "bcryptjs";
import { User } from "../../db.js";

export const logIn = async (req, res) => {
  const data = req.body;

  try {
    User.findOne({
      where: { email: data.email }
    }).then(async response => {
      if (response) {
        const validatePassword = await bcryptjs.compare(data.password, response.password);
        const userData = response;

        if (!validatePassword) {
          res.json({
            status: 'Error',
            // data: 'Incorrect Password! Please try again'
            data: 'Contraseña incorrecta Por favor, inténtelo de nuevo'
          })
        } else {
          const token = await generateJWT(userData.id, userData.firstName, userData.lastName, userData.email, userData.password, userData.profile)

          if (token.length == 0) {
            res.json({
              status: 'Error',
              data: 'Error token'
            })
          } else {
            User.update({ token: token }, { where: { email: data.email } }).then(reponse => {
              if (response) {
                res.send({
                  status: 'SUCCESS',
                  data: {
                    token: token,
                    id: userData.id,
                    profile: userData.profile,
                    email: userData.email
                  }
                })
              } else {
                res.send({
                  status: 'ERROR',
                  // data: 'Error insert token'
                  data: 'Error al insertar token'
                })
              }
            })
          }
        }
      } else {
        res.json({
          status: 'Error',
          // data: 'Incorrect Email! Please try again'
          data: 'Correo electrónico incorrecto Por favor, inténtelo de nuevo'
        })
      }
    })
  } catch (error) {
    res.status(500).json({
      status: 'Error',
      // data: 'An error has occurred'
      data: 'Ha ocurrido un error'
    })
  }
}

export const logOut = async (req, res) => {
  const data = req.body

  User.findOne(
    { where: { id: data.idUser } }
  ).then(response => {
    if (response) {
      User.update({ token: null }, { where: { id: data.idUser } }).then(response => {
        if (response) {
          res.status(200).json({
            status: 'SUCCESS',
          })
        } else {
          res.json({
            status: 'ERROR',
          })
        }
      })
    } else {
      res.json({
        status: 'ERROR',
        data: 'Usuario no encontrado.'
      });
    }
  })
}