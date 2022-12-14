import { pool } from '../db.js'

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
  const {firstName, lastName, email, password, profile} = req.body

  try {
    const [result] = pool.query('SELECT * FROM t_user WHERE t_user.email = ?', [email])

    if (result != null) {
      const [rows] = await pool.query('INSERT INTO t_user (firstName, lastName, email, password, password) VALUES (?, ?, ?, ?, ?)', [firstName, lastName, email, password, profile])
      res.send({
        status: 'SUCCESS',
        id: rows.insertId,
        firstName,
        lastName,
        email,
        password,
        profile
      })
    } else {
      res.status(404).json({
        status: 'Error',
        data: 'Email already exist'
      })
    }

    console.log(result)

  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      data: 'Something goes wrong'
    })
  }
}

export const updateUser = async (req, res) => {
  const { id } = req.params
  // const id = req.params.id 
  const { firstName, lastName, email, passowrd } = req.body

  try {
    const [result] = await pool.query('UPDATE t_user SET firstName = IFNULL(?, firstName), lastName = IFNULL(?, lastName), email = IFNULL(?, email), password = IFNULL(?, password) WHERE id = ?', [firstName, lastName, email, passowrd, id])

    if (result.affectedRows === 0) {
      return res.status(404).json({
        status: 'Error',
        data: 'Employee not found'
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
        message: 'Employee not found'
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