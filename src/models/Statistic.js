import DataTypes from "sequelize";

export const StatisticModel = (sequelize) => {
  return sequelize.define('t_statistic',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      id_team: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_league: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_game: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_substitute: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_shot: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_goal: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_passe: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_tackle: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_duel: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_dribble: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_foul: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_card: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      id_penalty: {
        type: DataTypes.INTEGER,
        allowNull: true,
      }
    },
    {
      freezeTableName: true,
      timestamps: false,
    }
  );
};