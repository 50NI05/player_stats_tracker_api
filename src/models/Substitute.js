import DataTypes from "sequelize";

export const SubstituteModel = (sequelize) => {
  return sequelize.define('t_substitute',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      in: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      out: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      bench: {
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