import expressRouter from "express";
import { getUsers, getUser, createUser, updateUser, deleteUser, forgotPassword, checkUser } from '../../controllers/users/users.controller.js'
import { verifyToken } from "../../middlewares/validateToken.js";

const router = expressRouter.Router()

router.get('/getUsers', getUsers)
router.get('/getUser/:id', getUser)
router.post('/register', createUser)
router.patch('/updateUser/:id', verifyToken, updateUser)
router.delete('/deleteUser/:id', verifyToken, deleteUser)
router.post('/forgotPassword', forgotPassword)
router.post('/checkuser', checkUser)

export default router