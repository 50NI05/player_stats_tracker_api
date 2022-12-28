import expressRouter from 'express';
import { teams } from "../../controllers/football-players/teams.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/teams', teams)

export default router