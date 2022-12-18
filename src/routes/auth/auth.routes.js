import expressRouter from 'express';
import { logIn, logOut } from '../../controllers/auth/auth.controller.js'

const router = expressRouter.Router()

router.post('/login', logIn)
router.post('/logout', logOut)

export default router