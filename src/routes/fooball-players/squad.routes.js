import expressRouter from 'express';
import { squads } from "../../controllers/football-players/squad.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/squad/:team', squads)

export default router