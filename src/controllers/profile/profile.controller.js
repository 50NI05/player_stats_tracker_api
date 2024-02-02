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
      data: 'Lo sentimos, ha ocurrido un error en la plataforma. Por favor, intenta nuevamente más tarde..'
    });
  }
}