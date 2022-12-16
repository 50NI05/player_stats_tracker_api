import jwt from "jsonwebtoken";

export const generateJWT = (email, password) => {
  return new Promise((resolve, reject) => {
    const payload = {email, password}
    const secret = process.env.TOKEN_SECRET

    jwt.sign(
      payload,
      secret,
      {
        expiresIn: '24h'
      },
      (error, token) => {
        if (error) {
          reject("Failed to generate token")
        } else {
          resolve(token)
        }
      }
    )
  })
}