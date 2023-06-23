import DataTypes from "sequelize";

export const ProfileModel = (sequelize) => {
  const Profile = sequelize.define('t_profile',
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      description: {
        type: DataTypes.STRING,
        allowNull: true,
      },
    },
    {
      freezeTableName: true,
      timestamps: false,
    }
  );

  return Profile
};