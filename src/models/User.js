import DataTypes from "sequelize";

export const UserModel = (sequelize) => {
  return sequelize.define('t_user',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      firstName: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      lastName: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      email: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      // email: {
      //   type: DataTypes.STRING,
      //   allowNull: false,
      // },
      password: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      profile: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      token: {
        type: DataTypes.STRING,
        allowNull: true,
      }
    },
    {
      freezeTableName: true,
      timestamps: false,
    }
  );
};