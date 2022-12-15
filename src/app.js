// const express = require('express')
import express from 'express'
import usersRoutes from './routes/users.routes.js'
import indexRoutes from './routes/index.routes.js'
import loginRoutes from './routes/auth/auth.routes.js';

const app = express()

app.use(express.json())

app.use(indexRoutes)
app.use('/api', usersRoutes)
app.use('/api', loginRoutes)

app.use((req, res, next) => {
  res.status(404).json({
    message: 'Endpoint not found'
  })
})

export default app