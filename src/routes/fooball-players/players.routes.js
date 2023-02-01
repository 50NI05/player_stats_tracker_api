import expressRouter from 'express';
import { players } from "../../controllers/football-players/players.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/player/:id/:season/:league', verifyToken, players)

export default router