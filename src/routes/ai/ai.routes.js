import expressRouter from 'express';
import { assistant, message, transformData, uploadFile, listFiles, retrieveFile, deleteFile, listQuestions } from '../../controllers/ai/ai.controller.js'
import { createFineTune, listFineTune, retrieveFineTune, cancelFineTune, deleteModelFineTune } from '../../controllers/ai/fineTuneGPT.controller.js'

const router = expressRouter.Router()

router.post('/assistant', assistant)
router.post('/message', message)

router.get('/listQuestions', listQuestions)

router.post('/transformData', transformData)
router.post('/uploadFile', uploadFile)
router.get('/listFiles', listFiles)
router.post('/retrieveFile', retrieveFile)
router.delete('/deleteFile', deleteFile)

router.post('/createFileTune', createFineTune)
router.get('/listFineTune', listFineTune)
router.post('/retrieveFineTune', retrieveFineTune)
router.post('/cancelFineTune', cancelFineTune)
router.delete('/deleteFineTune', deleteModelFineTune)

export default router