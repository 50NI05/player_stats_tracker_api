import { pool } from '../db.js'
import bcryptjs from "bcryptjs";

export const getUsers = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM t_user')
    res.json({
      status: 'SUCCESS',
      data: rows
    })
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      data: 'Something goes wrong'
    })
  }
}

export const getUser = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM t_user WHERE id = ?', [req.params.id])
    if (rows.length <= 0) {
      return res.status(404).json({
        status: 'Error',
        data: 'User not found'
      })
    }
    res.json({
      status: 'SUCCESS',
      data: rows
    })
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      data: 'Something goes wrong'
    })
  }
}

export const createUser = async (req, res) => {
  const { firstName, lastName, email, password, profile } = req.body

  try {
    const result = await pool.query('SELECT * FROM t_user WHERE t_user.email = ?', [email])

    console.log(result[0])

    // Si no existe el correo, crea en la BD
    if (result[0].length === 0) {
      const [rows] = await pool.query('INSERT INTO t_user (firstName, lastName, email, password, profile) VALUES (?, ?, ?, ?, ?)', [firstName, lastName, email, password, profile])
      
      const salt = await bcryptjs.genSalt(10)
      const hash = await bcryptjs.hash(password, salt)

      res.status(200).send({
        status: 'SUCCESS',
        data: {
          id: rows.insertId,
          firstName,
          lastName,
          email,
          password,
          profile,
          hash
        }
      })
    } else {
      res.status(404).json({
        status: 'Error',
        data: 'Email already exist'
      })
    }

  } catch (error) {
    res.status(500).json({
      status: 'Error',
      data: 'Something goes wrong'
    })
  }
}

export const updateUser = async (req, res) => {
  const { id } = req.params
  // const id = req.params.id 
  const { firstName, lastName, email, password } = req.body

  try {
    const [result] = await pool.query('UPDATE t_user SET firstName = IFNULL(?, firstName), lastName = IFNULL(?, lastName), email = IFNULL(?, email), password = IFNULL(?, password) WHERE id = ?', [firstName, lastName, email, password, id])

    if (result.affectedRows === 0) {
      return res.status(404).json({
        status: 'Error',
        data: 'User not found'
      })
    }

    const [rows] = await pool.query('SELECT * FROM t_user WHERE id = ?', [id])

    res.json({
      status: 'SUCCESS',
      data: rows
    })
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      data: 'Something goes wrong'
    })
  }
}

export const deleteUser = async (req, res) => {
  try {
    const [result] = await pool.query('DELETE FROM t_user WHERE id = ?', [req.params.id])

    if (result.affectedRows <= 0) {
      return res.status(404).json({
        message: 'User not found'
      })
    }

    res.sendStatus(204)
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      data: 'Something goes wrong'
    })
  }
}