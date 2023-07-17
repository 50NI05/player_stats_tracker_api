import DataTypes from "sequelize";

export const GameModel = (sequelize) => {
  return sequelize.define('t_game',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      appearences: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      lineups: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      minutes: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      number: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      position: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      rating: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      captain: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
      },
    },
    {
      freezeTableName: true,
      timestamps: false,
    }
  );
};