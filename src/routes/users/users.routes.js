import expressRouter from "express";
import { getUsers, getUser, createUser, updateUser, deleteUser } from '../../controllers/users/users.controller.js'

const router = expressRouter.Router()

router.get('/users', getUsers)

router.get('/user/:id', getUser)

router.post('/register', createUser)

router.patch('/update/:id', updateUser)

router.delete('/delete/:id', deleteUser)

export default router