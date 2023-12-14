import jwt from "jsonwebtoken";

export const generateJWT = (id, firstName, lastName, username, email, password, profile) => {
  return new Promise((resolve, reject) => {
    const payload = { id, firstName, lastName, username, email, password, profile }
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