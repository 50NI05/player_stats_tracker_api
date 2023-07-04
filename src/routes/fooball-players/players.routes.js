import expressRouter from 'express';
import { getPlayer } from "../../controllers/football-players/players.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/getPlayer/:id', verifyToken, getPlayer)

export default router