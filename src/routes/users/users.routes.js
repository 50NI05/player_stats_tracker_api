import expressRouter from "express";
import { getUsers, getUser, createUser, updateUser, deleteUser } from '../../controllers/users/users.controller.js'
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/getUsers', getUsers)

router.get('/getUser/:id', getUser)

router.post('/register', verifyToken, createUser)

router.patch('/updateUser/:id', verifyToken, updateUser)

router.delete('/deleteUser/:id', verifyToken, deleteUser)

export default router