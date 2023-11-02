import dotenv from "dotenv";
import { Configuration, OpenAIApi } from "openai";
import { Resend } from 'resend';

dotenv.config()

export const PORT = process.env.PORT || 'LOCAL_PORT'
export const DB_USER = process.env.DB_USER || 'DB_USER'
export const DB_PASSWORD = process.env.DB_PASSWORD || 'DB_PASSWORD'
export const DB_HOST = process.env.DB_HOST || 'DB_HOST'
export const DB_DATABASE = process.env.DB_DATABASE || 'DB_NAME'
export const DB_PORT = process.env.DB_PORT || 'DB_PORT'

export const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});
export const openai = new OpenAIApi(configuration);

export const resend = new Resend(process.env.RESEND);