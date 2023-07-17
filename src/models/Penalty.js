import DataTypes from "sequelize";

export const PenaltyModel = (sequelize) => {
  return sequelize.define('t_penalty',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      won: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      committed: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      scored: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      missed: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      saved: {
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