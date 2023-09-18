// import { pool } from '../../db.js'
import bcryptjs from "bcryptjs";
import { Profile, User } from "../../db.js";

export const getUsers = async (req, res) => {
  try {
    const users = await User.findAll({ include: [Profile] });
    const formattedUsers = users.map(e => ({
      id: e.id,
      firstname: e.firstname,
      lastname: e.lastname,
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
        email: data.email,
        password: hash,
        id_profile: data.id_profile
      });

      if (createUser) {
        const user = await User.findOne({
          where: { email: data.email },
          include: [Profile]
        })

        res.json({
          status: 'SUCCESS',
          data: {
            id: user.id,
            firstname: user.firstname,
            lastname: user.lastname,
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
        { firstname: data.firstname, lastname: data.lastname, email: data.email, id_profile: data.id_profile },
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