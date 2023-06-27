import DataTypes from "sequelize";

export const TackleModel = (sequelize) => {
  return sequelize.define('t_tackle',
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
      blocks: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      interceptions: {
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