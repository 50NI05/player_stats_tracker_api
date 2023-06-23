import DataTypes from "sequelize";
import { ProfileModel } from "./Profile.js";

export const UserModel = (sequelize) => {
  const User = sequelize.define('t_user',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      firstname: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      lastname: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      email: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      password: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      id_profile: {
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

  const Profile = ProfileModel(sequelize);

  User.belongsTo(Profile, { foreignKey: 'id_profile' });

  return User
};