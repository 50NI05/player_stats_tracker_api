import expressRouter from 'express';
import { addPlayer, deletePlayer, getPlayer, updatePlayer } from "../../controllers/football-players/players.controller.js";
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/getPlayer/:id', verifyToken, getPlayer)
router.post('/addPlayer', verifyToken, addPlayer)
router.patch('/updatePlayer/:id', verifyToken, updatePlayer)
router.delete('/deletePlayer/:id', verifyToken, deletePlayer)

export default router