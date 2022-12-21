// const express = require('express')
import express from 'express'
import usersRoutes from './routes/users/users.routes.js'
import indexRoutes from './routes/index.routes.js'
import loginRoutes from './routes/auth/auth.routes.js';
import session from 'express-session';
import cors from "cors";

const app = express()

app.use(express.json())

app.use(cors())

app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true,
}))

app.use(indexRoutes)
app.use('/api', usersRoutes)
app.use('/api', loginRoutes)

app.use((req, res, next) => {
  res.status(404).json({
    status: 'Error',
    data: 'Endpoint not found'
  })
})

export default app