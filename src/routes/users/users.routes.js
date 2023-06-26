import expressRouter from "express";
import { getUsers, getUser, createUser, updateUser, deleteUser } from '../../controllers/users/users.controller.js'

const router = expressRouter.Router()

router.get('/getUsers', getUsers)

router.get('/getUser/:id', getUser)

router.post('/register', createUser)

router.patch('/updateUser/:id', updateUser)

router.delete('/deleteUser/:id', deleteUser)

export default router