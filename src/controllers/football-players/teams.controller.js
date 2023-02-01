import { pool } from '../../db.js'

export const teams = async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM t_team')
  try {
    res.status(200).json({
      status: 'SUCCESS',
      data: rows
    })
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}

export const addTeam = async (req, res) => {
  const { id, name } = req.body
  const result = await pool.query('SELECT * FROM t_team WHERE t_team.id = ?', [id])

  try {
    if (result[0].length === 0) {
      const [rows] = await pool.query('INSERT INTO t_team (id, name) VALUES (?, ?)', [id, name])

      res.status(200).json({
        status: 'SUCCESS',
        data: {
          id: rows.insertId,
          name: name
        }
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'Error',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}