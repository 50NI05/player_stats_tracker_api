import { pool } from '../db.js'

export const getUsers = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM t_user')
    res.json(rows)
  } catch (error) {
    return res.status(500).json({
      message: 'Something goes wrong'
    })
  }
}

export const getUser = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM t_user WHERE id = ?', [req.params.id])
    if (rows.length <= 0) {
      return res.status(404).json({
        message: 'User not found'
      })
    }
    res.json(rows)
  } catch (error) {
    return res.status(500).json({
      message: 'Something goes wrong'
    })
  }
}

export const createUser = async (req, res) => {
  const {firstName, lastName, email, passowrd} = req.body

  try {
    const [rows] = await pool.query('INSERT INTO t_user (firstName, lastName, email, password) VALUES (?, ?, ?, ?)', [firstName, lastName, email, passowrd])
    res.send({
      id: rows.insertId,
      firstName,
      lastName,
      email,
      passowrd,
    })
  } catch (error) {
    return res.status(500).json({
      message: 'Something goes wrong'
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
        message: 'Employee not found'
      })
    }

    const [rows] = await pool.query('SELECT * FROM t_user WHERE id = ?', [id])

    res.json(rows)
  } catch (error) {
    return res.status(500).json({
      message: 'Something goes wrong'
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
      message: 'Something goes wrong'
    })
  }
}