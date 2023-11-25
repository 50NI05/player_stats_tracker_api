import { openai } from '../../config.js';
import natural from 'natural';
import tagDict from '../../taggers/tagDict.json' assert { type: "json" };
import rules from '../../taggers/rules.json' assert { type: "json" };
import xlsx from "xlsx";
import fs from "fs";

export const listQuestions = async (req, res) => {
  const workbook = xlsx.readFile("src/shared/Questions&Answers.xlsx");
  const shet_name_list = workbook.SheetNames;
  const xlData = xlsx.utils.sheet_to_json(workbook.Sheets[shet_name_list[0]]);
  let object = []
  let questionsSelected = []

  for (const item of xlData) {
    object.push(item.Question)
  }

  for (let i = 0; i < 3; i++) {
    const index = Math.floor(Math.random() * object.length);
    questionsSelected.push(object[index]);
    object.splice(index, 1);
  }

  res.status(200).json({
    status: 'SUCCESS',
    data: questionsSelected
  })
}

export const transformData = async (req, res) => {
  const workbook = xlsx.readFile("src/shared/data-set.xlsx");
  const shet_name_list = workbook.SheetNames;
  const xlData = xlsx.utils.sheet_to_json(workbook.Sheets[shet_name_list[0]]);

  for (const item of xlData) {
    const object = `{"prompt": "${item.Question} -> ", "completion": "${item.Answer
      .replace("[", "").replace("]", "")} END"}`;

    await fs.appendFileSync("src/shared/data-set.jsonl", object, "utf8", function () { })
    await fs.appendFileSync("src/shared/data-set.jsonl", "\r\n", "utf8", function () { })
  }

  res.send()
}

export const uploadFile = async (req, res) => {
  const response = await openai.createFile(fs.createReadStream("src/shared/data-set.jsonl"), "fine-tune");

  res.status(response.status).send(response.data)
}

export const listFiles = async (req, res) => {
  const response = await openai.listFiles()

  res.status(response.status).send(response.data)
}

export const retrieveFile = async (req, res) => {
  const data = req.body
  const response = await openai.retrieveFile(data.fileId)

  try {
    res.status(response.status).send(response.data)
  } catch (e) {
    res.status(404).json({
      status: 'ERROR',
      data: response
    })
  }
}

export const deleteFile = async (req, res) => {
  const data = req.body
  const response = await openai.deleteFile(data.fileId)

  try {
    res.status(response.status).send(response.data)
  } catch (e) {
    res.status(404).json({
      status: 'ERROR',
      data: response
    })
  }
}

export const message = async (req, res) => {
  const data = req.body

  try {
    const response = await openai.createCompletion({
      model: 'davinci:ft-personal:question-answer-01-2023-11-15-14-52-15',
      prompt: data.prompt,
      max_tokens: 150,
      temperature: 0,
      stop: 'END'
    });

    if (response.status === 200 && response.data.choices.length > 0) {
      res.json({
        status: 'SUCCESS',
        data: response.data.choices[0].text
      })
    } else {
      res.json({
        status: 'ERROR',
        data: 'Lo siento, ocurrió un problema, inténtalo más tarde'
      })
    }
  } catch (error) {
    res.json({
      status: 'ERROR',
      data: 'Lo siento, ocurrió un problema, inténtalo más tarde'
    })
  }
}

const taggerLanguage = 'es';
const language = 'es';
const MAX_QUESTIONS = 30;
let question_count = 0;

export const assistant = async (req, res) => {
  const data = req.body

  const now = new Date();
  const hour = now.getHours();
  const minutes = now.getMinutes();

  if (hour === 0 && minutes === 0) {
    question_count = 0;
  }

  if (question_count >= MAX_QUESTIONS) {
    res.json({
      status: 'ERROR',
      data: 'Se ha alcanzado el límite máximo de preguntas'
    });
  } else {
    if (!is_question_about_soccer(data.prompt)) {
      res.json({
        status: 'ERROR',
        data: 'Solo se permiten preguntas sobre fútbol'
      });
    } else {
      try {
        question_count++;

        const response = await openai.createChatCompletion({
          model: "gpt-3.5-turbo",
          messages: [
            {
              role: "assistant",
              content: data.prompt
            }
          ],
          max_tokens: 4050,
          temperature: 0,
        });

        res.json({
          status: 'SUCCESS',
          data: response.data.choices[0].message
        })

        // const response = await openai.createCompletion({
        //   model: "davinci",
        //   prompt: data.prompt,
        //   max_tokens: 200,
        //   temperature: 0,
        // });

        // res.json({
        //   status: 'SUCCESS',
        //   data: response.data.choices[0].text
        // })
      } catch (error) {
        res.status(500).json({
          status: 'ERROR',
          // data: 'An error has occurred'
          data: 'Ha ocurrido un error'
        })
      }
    }
  }
}

function is_question_about_soccer(prompt) {
  const tokenizer = new natural.WordTokenizer({ pattern: /[^A-Za-záéíóúüÁÉÍÓÚÜñÑ]+/ });
  const tokens = tokenizer.tokenize(prompt);

  // const tags = natural.BrillPOSTagger.defaultRules[taggerLanguage].split('\n');
  const lexicon = new natural.Lexicon(tagDict, language);
  const defaultCategory = 'N';

  const tagger = new natural.BrillPOSTagger(lexicon, rules, defaultCategory, language);

  const taggedTokens = tagger.tagWithLexicon(tokens);

  for (let index = 0; index < taggedTokens.taggedWords.length; index++) {
    if (isSoccerTerm(taggedTokens.taggedWords[index].token)) {
      return true;
    }
  }

  return false;
};

function isSoccerTerm(term) {
  const soccerTerms = [
    'fútbol',
    'futbol',
    'gol',
    'goles',
    'balón',
    'balon',
    'jugador',
    'arquero',
    'delantero',
    'defensa',
    'centrocampista',
    'equipo',
    'penal',
    'tarjeta',
    'línea',
    'cancha',
    'árbitro',
    'arbitro',
    'fuera de juego',
    'técnico',
    'tecnico',
    'campeonato',
    'copa',
    'liga',
    'mundial',
    'eurocopa',
    'copa américa',
    'copa america',
    'champions',
    'europa league',
    'gol',
    'jugador',
    'equipo',
    'estadio',
    'partido',
    'arbitro',
    'liga',
    'copa',
    'campeonato',
    'entrenador',
    'portero',
    'delantero',
    'centrocampista',
    'defensor',
    'táctica',
    'tactica',
    'estrategia',
    'fuera de juego',
    'penalti',
    'tarjeta',
    'remate',
    'saque de esquina',
    'fuera de banda',
    'offside',
    'hinchada',
    'mundial',
    'chammpions',
    'botines',
    'trofeo',
    'cancha',
    'campo',
    'mundialista',
    'suplente',
    'anotar',
    'empate',
    'remontada',
    'lesión',
    'copa del mundo',
    'copa américa',
    'uefa',
    'hattrick',
    'descenso',
    'ascenso',
    'pase',
    'camiseta',
    'anfición',
    'anficion',
    'trofeo',
    'celebración',
    'capitán',
    'estratega',
    'reglamento',
    'estadísticas',
    'estadisticas',
    'goles en contra',
    'portero suplente',
    'triunfo',
    'victoria',
    'derrota',
    'empate teórico',
    'empate teorico',
    'formación táctica',
    'formacion tactica',
    'tiro libre',
    'arbitraje',
    'forofo',
    'travesaño',
    'cabecear',
    'regatear',
    'campeonato',
    'táctica defensiva',
    'tactica defenciva',
    'tactica ofensiva',
    'táctica ofensiva',
    'tiro a puerta',
    'tarjeta roja',
    'tarjeta amarilla',
    'estadio',
    'himno del equipo',
    'campeonato de liga',
    'trofeo de liga',
    'patrocinador',
    'himno nacional',
    'entrenador asistente',
    'club deportivo'
  ];

  return soccerTerms.includes(term.toLowerCase());
};