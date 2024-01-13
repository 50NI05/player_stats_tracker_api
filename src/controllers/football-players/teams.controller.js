// import { pool } from '../../db.js'
import { Team } from "../../db.js"

export const getAllTeams = async (req, res) => {
  try {
    const team = await Team.findAll();

    if (team) {
      res.status(200).json({
        status: 'SUCCESS',
        data: team
      })
    } else {
      res.status(204).json({
        status: 'ERROR',
        data: 'No se han encontrado los equipos'
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: 'Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde.'
    })
  }
}

export const getTeam = async (req, res) => {
  const id = req.params.id

  try {
    const findTeam = await Team.findOne({ where: { id: id } });

    if (findTeam) {
      res.status(200).json({
        status: 'SUCCESS',
        data: findTeam.dataValues
      })
    } else {
      res.status(204).json({
        status: 'ERROR',
        data: 'No se ha encontrado el equipo'
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: 'Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde.'
    })
  }
}

export const addTeam = async (req, res) => {
  const data = req.body
  const findTeam = await Team.findOne({ where: { name: data.name } })

  try {
    if (findTeam === null) {
      const createTeam = await Team.create({
        name: data.name,
        country: data.country,
        founded: data.founded,
        logo: data.logo
      })

      if (createTeam) {
        res.status(200).json({
          status: 'SUCCESS',
          data: {
            name: createTeam.name,
            country: createTeam.country,
            founded: createTeam.founded,
            logo: createTeam.logo
          }
        })
      } else {
        res.status(500).json({
          status: 'ERROR',
          data: 'Lo sentimos, en este momento no podemos completar el registro de su equipo debido a problemas técnicos. Por favor, intente registrar su equipo nuevamente.'
        })
      }
    } else {
      res.status(204).json({
        status: 'ERROR',
        data: `El nombre de equipo ${findTeam.name} ya está en uso. Por favor elija un nombre diferente e inténtelo de nuevo`
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: 'Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde.'
    })
  }
}

export const updateTeam = async (req, res) => {
  const id = req.params.id
  const data = req.body;

  try {
    const findTeam = await Team.findOne({ where: { id: id } });

    if (findTeam) {
      const updateTeam = await Team.update(
        { name: data.name, country: data.country, founded: data.founded, logo: data.logo },
        { where: { id: id } }
      );

      if (updateTeam) {
        const findUpdatedTeam = await Team.findOne({
          where: { id: id }
        });

        res.json({
          status: 'SUCCESS',
          data: {
            id: findUpdatedTeam.id,
            name: findUpdatedTeam.name,
            country: findUpdatedTeam.country,
            founded: findUpdatedTeam.founded,
            logo: findUpdatedTeam.logo,
          }
        });
      } else {
        res.status(200).json({
          status: 'ERROR',
          // data: 'User not found'
          data: 'Equipo no encontrado'
        })
      }
    } else {
      return res.status(200).json({
        status: 'ERROR',
        // data: 'User not found'
        data: 'Equipo no encontrado'
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: 'Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde.'
    })
  }
}

export const deleteTeam = async (req, res) => {
  const id = req.params.id;

  try {
    const team = await Team.findOne({ where: { id: id } });

    if (team) {
      team.destroy().then(
        res.status(200).json({
          status: 'SUCCESS'
        })
      )
    } else {
      res.status(200).json({
        status: 'ERROR',
        // data: 'User not found'
        data: 'Equipo no encontrado'
      })
    }
  } catch (error) {
    return res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: 'Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde.'
    })
  }
}