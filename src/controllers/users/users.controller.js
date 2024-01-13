// import { pool } from '../../db.js'
import bcryptjs from "bcryptjs";
import { Profile, User } from "../../db.js";
import { resend } from "../../config.js";
import { sendMail } from "../mail/mail.controller.js";

export const getUsers = async (req, res) => {
  try {
    const users = await User.findAll({ include: [Profile] });
    const formattedUsers = users.map(e => ({
      id: e.id,
      firstname: e.firstname,
      lastname: e.lastname,
      username: e.username,
      email: e.email,
      token: e.token,
      profile: e.t_profile.toJSON()
    }));

    res.json({
      status: 'SUCCESS',
      data: formattedUsers
    })
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}

export const getUser = async (req, res) => {
  const id = [req.params.id]

  try {
    const user = await User.findOne({
      where: { id: id },
      include: [Profile]
    })

    if (user === null) {
      return res.status(404).json({
        status: 'ERROR',
        // data: 'User not found'
        data: 'Usuario no encontrado'
      })
    } else {
      res.status(200).json({
        status: 'SUCCESS',
        data: [
          {
            id: user.id,
            firstname: user.firstname,
            lastname: user.lastname,
            username: user.username,
            email: user.email,
            password: user.password,
            token: user.token,
            profile: user.t_profile.toJSON(),
          }
        ]
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}

export const checkUser = async (req, res) => {
  let data = req.body

  try {
    const findUser = await User.findOne({ where: { username: data.username } });

    if (findUser !== null) {
      res.json({
        status: 'ERROR',
        data: `Se ha verificado que ${findUser.username} ya existe en la plataforma. Por favor, elige otro nombre de usuario para continuar.`
      });
    } else {
      res.json({
        status: 'SUCCESS',
      });
    }
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}

export const createUser = async (req, res) => {
  let data = req.body;

  try {
    const findUser = await User.findOne({ where: { username: data.username } });

    if (findUser === null) {
      const salt = await bcryptjs.genSalt()
      const hash = await bcryptjs.hash(data.password, salt)

      const createUser = await User.create({
        firstname: data.firstname,
        lastname: data.lastname,
        username: data.username,
        email: data.email,
        password: hash,
        id_profile: data.id_profile
      });

      sendMail(
        {
          mail: data.email,
          html: `
            <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f2f2f2; font-family: Arial, sans-serif;">
              <div style="background-color: #0073e6; color: #fff; padding: 20px; text-align: center;">
                <h1>Registro Exitoso</h1>
              </div>
              <div style="padding: 20px;">
                <p>¡Hola ${createUser.username}!</p>
                <p>Te damos la bienvenida a Player Stats Tracker. Tu registro ha sido exitoso.</p>
                <p>Gracias por unirte a nosotros. A partir de ahora, podrás acceder a todos los servicios y características que ofrecemos.</p>
                <p>Si tienes alguna pregunta o necesitas asistencia, no dudes en <a href="mailto:jonathan.programa@gmail.com" style="color: #0073e6; text-decoration: none;">contactarnos</a>.</p>
                <p>¡Esperamos que tengas una gran experiencia en Player Stats Tracker!</p>
                <p>Saludos,</p>
                <p>El Equipo de Player Stats Tracker</p>
              </div>
            </div>
          `,
        }
      )

      await resend.emails.send({
        from: 'onboarding@resend.dev',
        to: createUser.email,
        subject: 'Registro Exitoso',
        html: `
            <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f2f2f2; font-family: Arial, sans-serif;">
              <div style="background-color: #0073e6; color: #fff; padding: 20px; text-align: center;">
                <h1>Registro Exitoso</h1>
              </div>
              <div style="padding: 20px;">
                <p>¡Hola ${createUser.username}!</p>
                <p>Te damos la bienvenida a Player Stats Tracker. Tu registro ha sido exitoso.</p>
                <p>Gracias por unirte a nosotros. A partir de ahora, podrás acceder a todos los servicios y características que ofrecemos.</p>
                <p>Si tienes alguna pregunta o necesitas asistencia, no dudes en <a href="mailto:jonathan.programa@gmail.com" style="color: #0073e6; text-decoration: none;">contactarnos</a>.</p>
                <p>¡Esperamos que tengas una gran experiencia en Player Stats Tracker!</p>
                <p>Saludos,</p>
                <p>El Equipo de Player Stats Tracker</p>
              </div>
            </div>
          `,
      });

      res.json({
        status: 'SUCCESS',
        data: "Felicidades, tu registro ha sido completado con éxito. ¿Quieres iniciar sesión ahora?"
      });
    } else {
      res.json({
        status: 'ERROR',
        // data: 'Email already exist'
        data: `Se ha verificado que ${findUser.username} ya existe en la plataforma. Por favor, elige otro nombre de usuario para continuar.`
      })
    }
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}

export const updateUser = async (req, res) => {
  const id = req.params.id
  const data = req.body;

  try {
    const user = await User.findOne({ where: { id: id } });

    if (user) {
      // const salt = await bcryptjs.genSalt()
      // const hash = await bcryptjs.hash(data.password, salt)

      const userUpdate = await User.update(
        {
          firstname: data.firstname,
          lastname: data.lastname,
          username: data.username,
          email: data.email,
          id_profile: data.id_profile
        },
        { where: { id: id } }
      );

      if (userUpdate) {
        const findUser = await User.findOne({
          where: { id: id },
          include: [Profile]
        });

        res.json({
          status: 'SUCCESS',
          data: {
            id: findUser.id,
            firstname: findUser.firstname,
            lastname: findUser.lastname,
            username: findUser.username,
            email: findUser.email,
            token: findUser.token,
            profile: findUser.t_profile.toJSON(),
          }
        });
      } else {
        res.status(200).json({
          status: 'ERROR',
          // data: 'User not found'
          data: 'Usuario no encontrado'
        })
      }
    } else {
      return res.status(200).json({
        status: 'ERROR',
        // data: 'User not found'
        data: 'Usuario no encontrado'
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}

export const deleteUser = async (req, res) => {
  const id = req.params.id;

  try {
    const user = await User.findOne({ where: { id: id } });

    if (user) {
      user.destroy().then(
        res.status(200).json({
          status: 'SUCCESS'
        })
      )
    } else {
      res.status(200).json({
        status: 'ERROR',
        // data: 'User not found'
        data: 'Usuario no encontrado'
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}

export const forgotPassword = async (req, res) => {
  const data = req.body;

  try {
    const user = await User.findOne({ where: { email: data.email } });

    if (user) {
      const salt = await bcryptjs.genSalt()
      const hash = await bcryptjs.hash(data.password, salt)

      const userUpdate = await User.update(
        { password: hash },
        { where: { id: user.id } }
      );

      if (userUpdate) {
        res.status(200).json({
          status: 'SUCCESS',
          // data: 'User not found'
          data: 'Contraseña cambiado correctamente'
        })
      } else {
        res.status(204).json({
          status: 'ERROR',
          // data: 'User not found'
          data: 'Usuario no encontrado'
        })
      }
    } else {
      res.status(204).json({
        status: 'ERROR',
        // data: 'User not found'
        data: 'Usuario no encontrado'
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: "Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde."
    })
  }
}