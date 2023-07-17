import DataTypes from "sequelize";

export const PasseModel = (sequelize) => {
  return sequelize.define('t_passe',
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
      key: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      accuracy: {
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