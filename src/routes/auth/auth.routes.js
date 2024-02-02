import expressRouter from 'express';
import { logIn, logOut, validateSession } from '../../controllers/auth/auth.controller.js'
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.post('/login', logIn)
router.post('/logout', verifyToken, logOut)
router.post('/validateSession', validateSession)

export default router