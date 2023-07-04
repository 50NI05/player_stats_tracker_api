import axios from "axios";
import { Card, Dribble, Duel, Foul, Game, Goal, League, Passe, Penalty, Player, Shot, Statistic, Substitute, Tackle, Team } from "../../db.js";

// export const players = (req, res, next) => {
//   const { id, season, league } = req.params

//   const config = {
//     params: {
//       id: id,
//       season: season,
//       league: league
//     },
//     headers: {
//       'x-rapidapi-host': 'v3.football.api-sports.io',
//       'x-rapidapi-key': '2a6ba7f0f274a12f31b69e85b7a28db3'
//     }
//   }

//   axios.get('https://v3.football.api-sports.io/players', config).then(function (response) {
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

export const getPlayer = async (req, res) => {
  const id = req.params.id;
  try {
    const player = await Player.findOne({ where: { id: id }, include: Team })

    const statistic = await Statistic.findOne({ 
      where: { id: id }, 
      include: [
        { model: League },
        { model: Game },
        { model: Substitute },
        { model: Shot },
        { model: Goal },
        { model: Passe },
        { model: Tackle },
        { model: Duel },
        { model: Dribble },
        { model: Foul },
        { model: Card },
        { model: Penalty },
      ] 
    })

    const statistics = statistic.toJSON();
    const tStatistics = {};
    Object.keys(statistics).forEach(key => {
      if (key.startsWith('t_') && key !== 'id') {
        const tKey = key.substr(2);
        if (key !== 'id' && tKey !== 'id') {
          const { id, ...tValue } = statistics[key];
          tStatistics[tKey] = tValue;
        }
      }
    });

    if (player) {
      res.status(200).json({
        status: 'SUCCESS',
        data: {
          player: {
            id: player.id,
            name: player.name,
            firstname: player.firstname,
            lastname: player.lastname,
            age: player.age,
            birth: player.birth,
            nationality: player.nationality,
            height: player.height,
            weight: player.weight,
            photo: player.photo
          },
          statistics: {
            team: {
              id: player.t_team.id,
              name: player.t_team.name,
              logo: player.t_team.logo
            },
            tStatistics
          }
        }
      })
    } else {
      res.status(500).json({
        status: 'ERROR',
        data: 'Algo va mal'
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