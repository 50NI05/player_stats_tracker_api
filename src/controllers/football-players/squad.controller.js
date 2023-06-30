import axios from "axios";
import { Team, Player } from "../../db.js";

// export const squads = (req, res, next) => {
//   const { team } = req.params

//   const config = {
//     params: { team: team },
//     headers: {
//       'x-rapidapi-host': 'v3.football.api-sports.io',
//       'x-rapidapi-key': '2a6ba7f0f274a12f31b69e85b7a28db3'
//     }
//   }

//   axios.get('https://v3.football.api-sports.io/players/squads', config).then(function (response) {
//     res.json({
//       status: 'SUCCESS',
//       data: response.data.response[0]
//     })
//   }).catch(function (error) {
//     console.log(error);
//     res.status(500).json({
//       status: 'Error',
//       data: error
//     })
//   }).finally(function () {

//   })
// }

export const getSquad = async (req, res, next) => {
  const id = req.params.id

  try {
    const player = await Player.findAll({ where: { id_team: id } });
    const formattedPlayers = player.map(e => ({
      id: e.id,
      name: e.name,
      age: e.age,
      photo: e.photo
    }))

    if (player) {
      res.status(200).json({
        status: 'SUCCESS',
        data: formattedPlayers
      })
    } else {
      res.status(500).json({
        status: 'ERROR',
        data: 'Ocurrió un error al cargar los detalles del equipo.'
      })
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({
      status: 'ERROR',
      // data: 'Something goes wrong'
      data: 'Algo va mal'
    })
  }
}