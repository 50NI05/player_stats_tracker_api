import axios from "axios";
import { Card, Dribble, Duel, Foul, Game, Goal, League, Passe, Penalty, Player, Shot, Statistic, Substitute, Tackle, Team, transaction } from "../../db.js";

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

    if (player) {
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
            team: player.t_team,
            league: tStatistics.league,
            game: tStatistics.game,
            substitute: tStatistics.substitute,
            shot: tStatistics.shot,
            goal: tStatistics.goal,
            passe: tStatistics.passe,
            tackle: tStatistics.tackle,
            duel: tStatistics.duel,
            dribble: tStatistics.dribble,
            foul: tStatistics.foul,
            card: tStatistics.card,
            penalty: tStatistics.penalty
          }
        }
      })
    } else {
      res.status(500).json({
        status: 'ERROR',
        data: 'Lo siento, no podemos encontrar al jugador que estás buscando. Por favor, vuelva a intentarlo.'
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

export const addPlayer = async (req, res) => {
  let data = req.body

  try {
    const gamePlayer = await Game.create({
      appearences: data.appearences,
      lineups: data.lineups,
      minutes: data.minutes,
      number: data.number,
      position: data.position,
      rating: data.rating,
      captain: data.captain
    }, { transaction: transaction })

    const substitutePlayer = await Substitute.create({
      in: data.in,
      out: data.out,
      bench: data.bench
    }, { transaction: transaction })

    const shotPlayer = await Shot.create({
      total: data.shotTotal,
      on: data.shotOn
    }, { transaction: transaction })

    const goalPlayer = await Goal.create({
      total: data.goalTotal,
      conceded: data.conceded,
      assists: data.assists,
      save: data.save
    }, { transaction: transaction })

    const passePlayer = await Passe.create({
      total: data.passeTotal,
      key: data.key,
      accuracy: data.accuracy
    }, { transaction: transaction })

    const tacklePlayer = await Tackle.create({
      total: data.tackleTotal,
      blocks: data.blocks,
      interceptions: data.interceptions
    }, { transaction: transaction })

    const duelPlayer = await Duel.create({
      total: data.duelTotal,
      won: data.duelWon
    }, { transaction: transaction })

    const dribblePlayer = await Dribble.create({
      attempts: data.attempts,
      success: data.success,
      past: data.past
    }, { transaction: transaction })

    const foulPlayer = await Foul.create({
      drawn: data.drawn,
      committed: data.foulCommitted
    }, { transaction: transaction })

    const cardPlayer = await Card.create({
      yellow: data.yellow,
      yellowred: data.yellowred,
      red: data.red
    }, { transaction: transaction })

    const penaltyPlayer = await Penalty.create({
      won: data.penaltyWon,
      committed: data.penaltyCommitted,
      scored: data.scored,
      missed: data.missed,
      saved: data.saved
    }, { transaction: transaction })

    const statisticPlayer = await Statistic.create({
      id_team: data.id_team,
      id_league: 1,
      id_game: gamePlayer.id,
      id_substitute: substitutePlayer.id,
      id_shot: shotPlayer.id,
      id_goal: goalPlayer.id,
      id_passe: passePlayer.id,
      id_tackle: tacklePlayer.id,
      id_duel: duelPlayer.id,
      id_dribble: dribblePlayer.id,
      id_foul: foulPlayer.id,
      id_card: cardPlayer.id,
      id_penalty: penaltyPlayer.id,
    }, { transaction: transaction })

    const createPlayer = await Player.create({
      name: data.name,
      firstname: data.firstname,
      lastname: data.lastname,
      age: data.age,
      birth: data.birth,
      nationality: data.nationality,
      height: data.height,
      weight: data.weight,
      photo: data.photo,
      id_statistic: statisticPlayer.id,
      id_team: data.id_team
    }, { transaction: transaction })

    if (createPlayer) {
      await transaction.commit();

      res.json({
        status: 'SUCCESS',
        data: 'Jugador registrado exitosamente'
      });
    } else {
      res.json({
        status: 'ERROR',
        data: 'Error al registrar jugador'
      });
    }
  } catch (error) {
    await transaction.rollback();

    res.json({
      status: 'ERROR',
      data: 'No se puede establecer una conexión con el servidor en este momento.'
    });
  }
}

export const updatePlayer = async (req, res) => {
  const id = req.params.id
  const data = req.body;
  // let transactionFinished = false;

  try {
    const player = await Player.findOne({ where: {id: id} })

    if (player) {
      const gameUpdated = await Game.update({
        appearences: data.appearences,
        lineups: data.lineups,
        minutes: data.minutes,
        number: data.number,
        position: data.position,
        rating: data.rating,
        captain: data.captain
      }, { where: { id: id } }, { transaction: transaction })

      const substituteUpdated = await Substitute.update({
        in: data.in,
        out: data.out,
        bench: data.bench
      }, { where: { id: id } }, { transaction: transaction })

      const shotUpdated = await Shot.update({
        total: data.shotTotal,
        on: data.shotOn
      }, { where: { id: id } }, { transaction: transaction })

      const goalUpdated = await Goal.update({
        total: data.goalTotal,
        conceded: data.conceded,
        assists: data.assists,
        save: data.save
      }, { where: { id: id } }, { transaction: transaction })

      const passeUpdated = await Passe.update({
        total: data.passeTotal,
        key: data.key,
        accuracy: data.accuracy
      }, { where: { id: id } }, { transaction: transaction })

      const tackleUpdated = await Tackle.update({
        total: data.tackleTotal,
        blocks: data.blocks,
        interceptions: data.interceptions
      }, { where: { id: id } }, { transaction: transaction })

      const duelUpdated = await Duel.update({
        total: data.duelTotal,
        won: data.duelWon
      }, { where: { id: id } }, { transaction: transaction })

      const dribbleUpdated = await Dribble.update({
        attempts: data.attempts,
        success: data.success,
        past: data.past
      }, { where: { id: id } }, { transaction: transaction })

      const foulUpdated = await Foul.update({
        drawn: data.drawn,
        committed: data.foulCommitted
      }, { where: { id: id } }, { transaction: transaction })

      const cardUpdated = await Card.update({
        yellow: data.yellow,
        yellowred: data.yellowred,
        red: data.red
      }, { where: { id: id } }, { transaction: transaction })

      const penaltyUpdated = await Penalty.update({
        won: data.penaltyWon,
        committed: data.penaltyCommitted,
        scored: data.scored,
        missed: data.missed,
        saved: data.saved
      }, { where: { id: id } }, { transaction: transaction })

      const statisticUpdated = await Statistic.update({
        id_team: data.id_team,
        id_league: 1,
        id_game: gameUpdated.id,
        id_substitute: substituteUpdated.id,
        id_shot: shotUpdated.id,
        id_goal: goalUpdated.id,
        id_passe: passeUpdated.id,
        id_tackle: tackleUpdated.id,
        id_duel: duelUpdated.id,
        id_dribble: dribbleUpdated.id,
        id_foul: foulUpdated.id,
        id_card: cardUpdated.id,
        id_penalty: penaltyUpdated.id,
      }, { where: { id: id } }, { transaction: transaction })

      const playerUpdated = await Player.update({
        name: data.name,
        firstname: data.firstname,
        lastname: data.lastname,
        age: data.age,
        birth: data.birth,
        nationality: data.nationality,
        height: data.height,
        weight: data.weight,
        photo: data.photo,
        id_statistic: statisticUpdated.id,
        id_team: data.id_team
      }, { where: {id: id} }, { transaction: transaction })

      if (playerUpdated) {
        // transactionFinished = true;

        // await transaction.commit();
        
        res.json({
          status: 'SUCCESS',
          data: 'Jugador actualizado exitosamente'
        });
      } else {
        res.json({
          status: 'ERROR',
          data: 'Jugador no encontrado'
        });
      }
    } else {
      res.json({
        status: 'ERROR',
        data: 'Jugador no encontrado'
      });
    }
  } catch (error) {
    // if (!transactionFinished) {
    //   result.rollback();
    // }
    
    res.json({
      status: 'ERROR',
      data: 'No se puede establecer una conexión con el servidor en este momento.'
    });
  }
}


export const deletePlayer = async (req, res) => {
  const id = req.params.id

  try {
    const player = await Player.findOne({ where: {id: id} });
    const game = await Game.findOne({ where: { id: id } });
    const substitute = await Substitute.findOne({ where: { id: id } });
    const shot = await Shot.findOne({ where: { id: id } });
    const goal = await Goal.findOne({ where: { id: id } });
    const passe = await Passe.findOne({ where: { id: id } });
    const tackle = await Tackle.findOne({ where: { id: id } });
    const duel = await Duel.findOne({ where: { id: id } });
    const dribble = await Dribble.findOne({ where: { id: id } });
    const foul = await Foul.findOne({ where: { id: id } });
    const card = await Card.findOne({ where: { id: id } });
    const penalty = await Penalty.findOne({ where: { id: id } });
    const statistic = await Statistic.findOne({ where: { id: id } });

    if (player) {
      game.destroy();
      substitute.destroy();
      shot.destroy();
      goal.destroy();
      passe.destroy();
      tackle.destroy();
      duel.destroy();
      dribble.destroy();
      foul.destroy();
      card.destroy();
      penalty.destroy();
      statistic.destroy();

      res.json({
        status: 'SUCCESS'
      });
    } else {
      res.json({
        status: 'ERROR',
        data: 'Jugador no encontrado'
      });
    }
  } catch (error) {
    res.json({
      status: 'ERROR',
      data: 'No se puede establecer una conexión con el servidor en este momento.'
    });
  }
}