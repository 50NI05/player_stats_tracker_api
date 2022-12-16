import * as jwt from "jsonwebtoken";

export const generateJWT = (uid = '') => {
  return new Promise((resolve, reject) => {
    const payload = uid
    const secret = process.env.TOKEN_SECRET

    console.log(payload);
    console.log(secret);

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