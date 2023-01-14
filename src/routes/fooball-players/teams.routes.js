import expressRouter from 'express';
import { teams } from "../../controllers/football-players/teams.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/teams', verifyToken, teams)

export default router