import axios from "axios";
import { Team, Player, Squad } from "../../db.js";

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
  const data = req.params

  try {
    // const team = await Team.findOne({ where: { id: data.team } })
    // const player = await Player.findAll()
    const squad = await Squad.findOne({ where: { id: data.team }, include: [Team, Player] })

    if (team && player) {
      res.status(200).json({
        status: 'SUCCESS',
        data: {
          squad: squad
        }
      })
    } else {
      res.status(500).json({
        status: 'ERROR',
        data: 'Algo va mal'
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