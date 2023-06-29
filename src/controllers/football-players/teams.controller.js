// import { pool } from '../../db.js'
import { Team } from "../../db.js"

export const getTeam = async (req, res) => {
  try {
    const team = await Team.findAll();

    if (team) {
      res.status(200).json({
        status: 'SUCCESS',
        data: team
      })
    } else {
      
    }
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