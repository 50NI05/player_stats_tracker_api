import expressRouter from 'express';
import { auth } from '../../controllers/auth/auth.controller.js'

const router = expressRouter.Router()

router.post('/logIn', auth)

export default router