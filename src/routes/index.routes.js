import expressRouter from "express";
import { ping } from "../controllers/index.controller.js";

const router = expressRouter.Router()

router.get('/ping', ping)

export default router