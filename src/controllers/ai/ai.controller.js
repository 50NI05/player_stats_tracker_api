import { openai } from '../../config.js';
import natural from 'natural';
import tagDict from '../../taggers/tagDict.json' assert { type: "json" };
import rules from '../../taggers/rules.json' assert { type: "json" };

const taggerLanguage = 'es';
const language = 'es';
const MAX_QUESTIONS =  30;
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
  const tokenizer = new natural.WordTokenizer();
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
    'gol',
    'goles',
    'balón', 
    'arquero', 
    'delantero', 
    'defensa', 
    'centrocampista', 
    'penal', 
    'tarjeta', 
    'línea', 
    'cancha', 
    'árbitro', 
    'fuera de juego', 
    'técnico', 
    'campeonato', 
    'copa', 
    'liga', 
    'mundial', 
    'eurocopa', 
    'copa américa', 
    'champions', 
    'europa league'
  ];

  return soccerTerms.includes(term.toLowerCase());
};