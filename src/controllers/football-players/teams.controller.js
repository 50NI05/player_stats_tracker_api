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