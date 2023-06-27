import DataTypes from "sequelize";

export const CardModel = (sequelize) => {
  return sequelize.define('t_card',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      yellow: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      yellowred: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      red: {
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