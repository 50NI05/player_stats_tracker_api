import expressRouter from 'express';
import { teams, addTeam } from "../../controllers/football-players/teams.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/teams', verifyToken, teams)
router.post('/addTeam', addTeam)

export default router