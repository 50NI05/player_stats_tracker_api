import expressRouter from 'express';
import { getSquad } from "../../controllers/football-players/squad.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/getSquad/:team', verifyToken, getSquad)

export default router