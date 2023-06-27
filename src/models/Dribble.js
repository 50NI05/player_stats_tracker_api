import DataTypes from "sequelize";

export const DribbleModel = (sequelize) => {
  return sequelize.define('t_dribble',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      attempts: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      success: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      past: {
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