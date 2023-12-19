// import { pool } from '../../db.js'
import bcryptjs from "bcryptjs";
import { Profile, User } from "../../db.js";
import { resend } from "../../config.js";

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
      data: 'Algo va mal'
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
      data: 'Algo va mal'
    })
  }
}

export const createUser = async (req, res) => {
  let data = req.body;

  try {
    const findUser = await User.findOne({ where: { email: data.email } });

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

      if (createUser) {
        const user = await User.findOne({
          where: { email: data.email },
          include: [Profile]
        })

        await resend.emails.send({
          from: 'onboarding@resend.dev',
          to: user.email,
          subject: 'Registro Exitoso',
          html: `
            <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f2f2f2; font-family: Arial, sans-serif;">
              <div style="background-color: #0073e6; color: #fff; padding: 20px; text-align: center;">
                <h1>Registro Exitoso</h1>
              </div>
              <div style="padding: 20px;">
                <p>¡Hola ${user.username}!</p>
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
          data: {
            id: user.id,
            firstname: user.firstname,
            lastname: user.lastname,
            username: user.username,
            email: user.email,
            password: user.password,
            token: user.token,
            profile: user.t_profile.toJSON(),
          }
        });
      } else {
        res.json({
          status: 'ERROR',
          data: 'Error al registrar usuario'
        });
      }
    } else {
      res.json({
        status: 'ERROR',
        // data: 'Email already exist'
        data: 'El correo electrónico ya existe'
      })
    }
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
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
      data: 'Algo va mal'
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
      data: 'Algo va mal'
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
      data: 'Algo va mal'
    })
  }
}