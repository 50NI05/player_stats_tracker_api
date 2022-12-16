import expressRouter from "express";
import { getUsers, getUser, createUser, updateUser, deleteUser } from '../controllers/users.controller.js'

const router = expressRouter.Router()

router.get('/users', getUsers)

router.get('/users/:id', getUser)

router.post('/user/register', createUser)

router.patch('/users/:id', updateUser)

router.delete('/users/:id', deleteUser)

export default router