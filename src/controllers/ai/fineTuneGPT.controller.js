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

export const listFineTune = async (req, res) => {
  const response = await openai.listFineTunes()

  try {
    res.status(response.status).send(response.data)
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      data: error
    })
  }
}

export const retireveFineTune = async (req, res) => {
  const data = req.body
  const response = await openai.retrieveFineTune(data.fineTuneId)

  try {
    res.status(response.status).send(response.data)
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      data: error
    })
  }
}

export const cancelFineTune = async (req, res) => {
  const data = req.body
  const response = await openai.cancelFineTune(data.fineTuneId)

  try {
    res.status(response.status).send(response.data)
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      data: error
    })
  }
}

export const deleteModelFineTune = async (req, res) => {
  const data = req.body
  const response = await openai.deleteModel(data.model)

  try {
    res.status(response.status).send(response.data)
  } catch (error) {
    res.status(500).json({
      status: 'ERROR',
      data: error
    })
  }
}