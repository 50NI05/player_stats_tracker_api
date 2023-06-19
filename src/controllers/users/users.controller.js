// import { pool } from '../../db.js'
import bcryptjs from "bcryptjs";
import { User } from "../../db.js";

export const getUsers = async (req, res) => {
  try {
    User.findAll().then(users => {
      res.json({
        status: 'SUCCESS',
        data: users
      })
    })
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}

export const getUser = async (req, res) => {
  const id = [req.params.id]

  try {
    User.findOne({
      where: { id: id }
    }).then(response => {
      if (response === null) {
        return res.status(404).json({
          status: 'Error',
          // data: 'User not found'
          data: 'Usuario no encontrado'
        })
      } else {
        res.json({
          status: 'SUCCESS',
          data: response
        })
      }
    })
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}

export const createUser = async (req, res) => {
  let data = req.body;

  try {
    User.findOne(
      {
        where: { username: data.username }
      }
    ).then(async (response) => {
      if (response === null) {
        const salt = await bcryptjs.genSalt()
        const hash = await bcryptjs.hash(data.password, salt)

        User.create({
          firstName: data.firstName,
          lastName: data.lastName,
          username: data.username,
          password: hash,
        }).then((user) => {
          res.json({
            status: 'SUCCESS',
            data: user,
          });
        }).catch((e) => {
          console.log(e);
          res.json({
            status: 'ERROR',
            msg: 'Error al registrar usuario'
          });
        });
      } else {
        res.json({
          status: 'ERROR',
          // data: 'Email already exist'
          data: 'El correo electrónico ya existe'
        })
      }
    })
  } catch (error) {
    res.status(500).json({
      status: 'Error',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}

export const updateUser = async (req, res) => {
  const id = req.params.id
  // const id = req.params.id 
  const data = req.body;  

  try {
    User.findOne({
      where: { id: id }
    }).then(user => {
      if (user) {
        User.update(
          { firstName: data.firstName, lastName: data.lastName, email: data.email, password: data.password },
          { where: { id: id } }
        ).then(response => {
          if (response) {
            User.findOne({
              where: { id: id }
            }).then(response => {
              res.status(200).json({
                status: 'SUCCESS',
                data: response
              })
            })
          } else {
            res.status(200).json({
              status: 'ERROR',
              // data: 'User not found'
              data: 'Usuario no encontrado'
            })
          }
        })
      } else {
        return res.status(200).json({
          status: 'ERROR',
          // data: 'User not found'
          data: 'Usuario no encontrado'
        })
      }
    });
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}

export const deleteUser = async (req, res) => {
  const id = req.params.id;

  try {
    User.findOne({
      where: { id: id }
    }).then(response => {
      if (response) {
        response.destroy().then(
          res.status(200).send()
        )
      } else {
        return res.status(200).json({
          status: 'ERROR',
          // data: 'User not found'
          data: 'Usuario no encontrado'
        })
      }
    })
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}