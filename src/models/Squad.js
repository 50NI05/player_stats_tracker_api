import DataTypes from "sequelize";

export const SquadModel = (sequelize) => {
  return sequelize.define('t_squad',
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
      id_player: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
    },
    {
      freezeTableName: true,
      timestamps: false,
    }
  );
};