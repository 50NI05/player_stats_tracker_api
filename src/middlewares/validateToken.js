import jwt from 'jsonwebtoken'

// middleware to validate token (rutas protegidas)
export const verifyToken = (req, res, next) => {
    const token = req.header('auth-token')
    if (!token) return res.status(401).json({ status: 'Error', data: 'Access denied' })
    try {
        const verified = jwt.verify(token, process.env.TOKEN_SECRET)
        req.user = verified
        next()
    } catch (error) {
        res.status(400).json({ status: 'Error', data: 'Token is invalid' })
    }
}