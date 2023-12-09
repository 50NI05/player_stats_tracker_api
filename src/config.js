import dotenv from "dotenv";
import { Configuration, OpenAIApi } from "openai";
import { Resend } from 'resend';
import NewsAPI from 'newsapi';

dotenv.config()

export const PORT = process.env.PORT || 'LOCAL'
export const DB_USER = process.env.DB_USER || 'LOCAL'
export const DB_PASSWORD = process.env.DB_PASSWORD || 'LOCAL'
export const DB_HOST = process.env.DB_HOST || 'localhost'
export const DB_DATABASE = process.env.DB_DATABASE || 'LOCAL'
export const DB_PORT = process.env.DB_PORT || 'LOCAL'

export const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});
export const openai = new OpenAIApi(configuration);

export const resend = new Resend(process.env.RESEND);

export const newsapi = new NewsAPI(process.env.NEWS_API);