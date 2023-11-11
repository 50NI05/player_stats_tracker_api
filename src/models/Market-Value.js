import DataTypes from "sequelize";

export const MarketValueModel = (sequelize) => {
  return sequelize.define('t_market_value',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      date: {
        type: DataTypes.DATE,
        allowNull: true,
      },
      market_value: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      market_value_currency: {
        type: DataTypes.STRING,
        allowNull: true,
      },
    },
    {
      freezeTableName: true,
      timestamps: false,
    }
  );
};