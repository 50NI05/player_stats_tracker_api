// const express = require('express')
import express from 'express'
import session from 'express-session';
import cors from "cors";
import usersRoutes from './routes/users/users.routes.js'
import indexRoutes from './routes/index.routes.js'
import loginRoutes from './routes/auth/auth.routes.js';
import footballSquadsRoutes from "./routes/fooball-players/squad.routes.js";
import footballPlayersRoutes from "./routes/fooball-players/players.routes.js";
import footballTeamsRoutes from "./routes/fooball-players/teams.routes.js";
import aiRoutes from "./routes/ai/ai.routes.js";

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
app.use('/api', footballSquadsRoutes)
app.use('/api', footballPlayersRoutes)
app.use('/api', footballTeamsRoutes)
app.use('/api', aiRoutes)

app.use((req, res, next) => {
  res.status(404).json({
    status: 'Error',
    data: 'Endpoint not found'
  })
})

export default app