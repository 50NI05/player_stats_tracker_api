import DataTypes from "sequelize";

export const FoulModel = (sequelize) => {
  return sequelize.define('t_foul',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      drawn: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      comitted: {
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