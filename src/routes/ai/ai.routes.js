import expressRouter from 'express';
import { assistant, transformData, uploadFile, listFiles, retrieveFile, deleteFile } from '../../controllers/ai/ai.controller.js'
import { createFineTune } from '../../controllers/ai/fineTuneGPT.controller.js'

const router = expressRouter.Router()

router.post('/assistant', assistant)
router.post('/transformData', transformData)
router.post('/uploadFile', uploadFile)
router.get('/listFiles', listFiles)
router.post('/retrieveFile', retrieveFile)
router.delete('/deleteFile', deleteFile)

router.post('/createFileTune', createFineTune)

export default router