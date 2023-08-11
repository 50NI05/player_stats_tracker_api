import expressRouter from 'express';
import { getAllTeams, addTeam, updateTeam, deleteTeam } from "../../controllers/football-players/teams.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/getAllTeams', getAllTeams)
router.post('/addTeam', verifyToken, addTeam)
router.patch('/updateTeam/:id', verifyToken, updateTeam)
router.delete('/deleteTeam/:id', verifyToken, deleteTeam)

export default router