import expressRouter from "express";
import { verifyToken } from "../../middlewares/validateToken.js";
import { getProfile } from "../../controllers/profile/profile.controller.js";

const router = expressRouter.Router()

router.get('/getProfile', verifyToken, getProfile)

export default router