import { openai } from '../../config.js';

export const createFineTune = async (req, res) => {
  const data = req.body
  const response = await openai.createFineTune({
    training_file: data.fileId,
    model: 'davinci',
    suffix: 'question-answer-01'
  })

  try {
    res.status(response.status).send(response.data)
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      data: error
    })
  }
}