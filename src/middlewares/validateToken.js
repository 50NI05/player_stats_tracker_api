import jwt from 'jsonwebtoken'

// middleware to validate token (rutas protegidas)
export const verifyToken = (req, res, next) => {
  const token = req.header('auth-token')
  if (!token) return res.status(401).json({
    status: 'ERROR',
    // data: 'Access denied' 
    data: 'Acceso denegado'
  })
  try {
    const verified = jwt.verify(token, process.env.TOKEN_SECRET)
    req.user = verified
    next()
  } catch (error) {
    res.status(400).json({
      status: 'ERROR',
      // data: 'Token is invalid' 
      data: 'El token no es válido'
    })
  }
}