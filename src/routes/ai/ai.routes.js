import expressRouter from 'express';
import { assistant } from '../../controllers/ai/ai.controller.js'

const router = expressRouter.Router()

router.post('/assistant', assistant)

export default router