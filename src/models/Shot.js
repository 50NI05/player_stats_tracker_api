import DataTypes from "sequelize";

export const ShotModel = (sequelize) => {
  return sequelize.define('t_shot',
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
      on: {
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