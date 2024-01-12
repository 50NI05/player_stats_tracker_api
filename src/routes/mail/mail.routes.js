import expressRouter from 'express';
import { sendMail } from "../../controllers/mail/mail.controller.js";

const router = expressRouter.Router()
router.post('/sendMail', sendMail)

export default router