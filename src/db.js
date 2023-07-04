// import mysql2 from "mysql2/promise";
// import { DB_HOST, DB_PORT, DB_DATABASE, DB_USER, DB_PASSWORD } from "./config.js";

// export const pool = mysql2.createPool({
//   host: DB_HOST,
//   user: DB_USER,
//   password: DB_PASSWORD,
//   port: DB_PORT,
//   database: DB_DATABASE,
// });

import Sequelize from "sequelize";
import { UserModel } from "../src/models/User.js";
import { ProfileModel } from "./models/Profile.js";
import { CardModel } from "./models/Card.js";
import { DribbleModel } from "./models/Dribble.js";
import { DuelModel } from "./models/Duel.js";
import { FoulModel } from "./models/Foul.js";
import { GameModel } from "./models/Game.js";
import { GoalModel } from "./models/Goal.js";
import { LeagueModel } from "./models/League.js";
import { PasseModel } from "./models/Passe.js";
import { PenaltyModel } from "./models/Penalty.js";
import { PlayerModel } from "./models/Player.js";
import { ShotModel } from "./models/Shot.js";
import { SquadModel } from "./models/Squad.js";
import { StatisticModel } from "./models/Statistic.js";
import { SubstituteModel } from "./models/Substitute.js";
import { TackleModel } from "./models/Tackle.js";
import { TeamModel } from "./models/Team.js";
const sequelize = new Sequelize('mysql://root:123456@localhost:3306/playerStatsTrackerDB');
// const sequelize = new Sequelize('playerStatsTrackerDB', 'root', '123456', {host: 'localhost', dialect: 'mysql'})
export const Card = CardModel(sequelize)
export const Dribble = DribbleModel(sequelize)
export const Duel = DuelModel(sequelize)
export const Foul = FoulModel(sequelize)
export const Game = GameModel(sequelize)
export const Goal = GoalModel(sequelize)
export const League = LeagueModel(sequelize)
export const Passe = PasseModel(sequelize)
export const Penalty = PenaltyModel(sequelize)
export const Player = PlayerModel(sequelize)
export const Shot = ShotModel(sequelize)
export const Squad = SquadModel(sequelize)
export const Statistic = StatisticModel(sequelize)
export const Substitute = SubstituteModel(sequelize)
export const Tackle = TackleModel(sequelize)
export const Team = TeamModel(sequelize)
export const User = UserModel(sequelize);
export const Profile = ProfileModel(sequelize);

User.belongsTo(Profile, { foreignKey: 'id_profile' });

Player.belongsTo(Team, { foreignKey: 'id_team' });
Player.belongsTo(Statistic, { foreignKey: 'id_statistic'});

Statistic.belongsTo(League, { foreignKey: 'id_league' })
Statistic.belongsTo(Game, { foreignKey: 'id_game' })
Statistic.belongsTo(Substitute, { foreignKey: 'id_substitute' })
Statistic.belongsTo(Shot, { foreignKey: 'id_shot' })
Statistic.belongsTo(Goal, { foreignKey: 'id_goal' })
Statistic.belongsTo(Passe, { foreignKey: 'id_passe' })
Statistic.belongsTo(Tackle, { foreignKey: 'id_tackle' })
Statistic.belongsTo(Duel, { foreignKey: 'id_duel' })
Statistic.belongsTo(Dribble, { foreignKey: 'id_dribble' })
Statistic.belongsTo(Foul, { foreignKey: 'id_foul' })
Statistic.belongsTo(Card, { foreignKey: 'id_card' })
Statistic.belongsTo(Penalty, { foreignKey: 'id_penalty' })