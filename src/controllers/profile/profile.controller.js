import { Profile } from "../../db.js"

export const getProfile = async (req, res) => {
  try {
    const profile = await Profile.findAll()

    if (profile) {
      res.status(200).json({
        status: 'SUCCESS',
        data: profile
      })
    } else {
      res.json({
        status: 'ERROR'
      });
    }
  } catch (error) {
    res.json({
      status: 'ERROR',
      data: 'No se puede establecer una conexión con el servidor en este momento.'
    });
  }
}