import expressRouter from 'express';
import { getTeam, addTeam } from "../../controllers/football-players/teams.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/getTeam', verifyToken, getTeam)
router.post('/addTeam', addTeam)

export default router