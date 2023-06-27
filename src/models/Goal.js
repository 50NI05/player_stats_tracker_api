import DataTypes from "sequelize";

export const GoalModel = (sequelize) => {
  return sequelize.define('t_goal',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      total: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      conceded: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      assists: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      saves: {
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