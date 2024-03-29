// import { pool } from '../../db.js'
import { generateJWT } from '../../helpers/generateJWT.js';
import bcryptjs from "bcryptjs";
import { Profile, User } from "../../db.js";
import jwt from "jsonwebtoken";

export const logIn = async (req, res) => {
  const data = req.body;

  try {
    const user = await User.findOne({
      where: { username: data.username },
      include: Profile
    });

    if (user) {
      const validatePassword = await bcryptjs.compare(data.password, user.password);

      if (!validatePassword) {
        res.json({
          status: 'ERROR',
          // data: 'Incorrect Password! Please try again'
          data: "Usuario no válido. Por favor, inténtalo nuevamente."
        })
      } else {
        const token = await generateJWT(user.id, user.firstName, user.lastName, user.username, user.email, user.password, user.t_profile.toJSON())

        if (token.length == 0) {
          res.json({
            status: 'ERROR',
            data: 'Error token'
          })
        } else {
          const userUpdate = await User.update(
            { token: token },
            {
              where: { username: data.username },
              include: Profile
            })

          if (userUpdate) {
            res.status(200).send({
              status: 'SUCCESS',
              data: {
                token: token,
                id: user.id,
                profile: user.t_profile,
              }
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
    } else {
      res.json({
        status: 'ERROR',
        // data: 'Incorrect Email! Please try again'
        data: "Usuario no válido. Por favor, inténtalo nuevamente."
      })
    }
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      // data: 'An error has occurred'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}

export const logOut = async (req, res) => {
  const data = req.body

  try {
    const user = User.findOne({
      where: { id: data.idUser },
      include: Profile
    });

    if (user) {
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
  } catch (error) {
    res.json({
      status: 'ERROR',
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    });
  }
}

export const validateSession = async (req, res) => {
  const data = req.body

  try {
    const verified = await jwt.verify(data.session, process.env.TOKEN_SECRET)

    res.status(200).json({
      status: 'SUCCESS',
      data: 'El token es válido'
    })
  } catch (error) {
    res.status(400).json({
      status: 'ERROR',
      data: 'El token no es válido'
    })
  }
}