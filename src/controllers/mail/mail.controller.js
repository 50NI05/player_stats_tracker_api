import nodemailer from "nodemailer";
import { google } from "googleapis";
const OAth2 = google.auth.OAuth2
import accountTransport from "../../../account_transport.json" assert { type: "json" };

let data

const generateActivacionCode = () => {
  const stringCode = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  let activationCode = '';
  for (let i = 0; i < 8; i++) {
    activationCode += stringCode.charAt(Math.floor(Math.random() * stringCode.length));
  }
  return activationCode;
}

export const sendMail = async (req, res) => {
  if (req.body !== undefined) {
    data = req.body
  } else {
    data = req
  }

  const oath2Client = new OAth2(
    accountTransport.auth.clientId,
    accountTransport.auth.clientSecret,
    "https://developers.google.com/oathplayground",
  );

  oath2Client.setCredentials({
    refresh_token: accountTransport.auth.refreshToken,
    tls: {
      rejectUnaothorized: false
    }
  });

  const accessToken = await oath2Client.getAccessToken()
  accountTransport.auth.accessToken = accessToken;

  const mailOptions = {
    from: "<jonathan.programa@gmail.com>",
    to: `${data.mail}`,
    subject: `${data.title}`,
    html: `${data.html}`
  }

  await nodemailer.createTransport(accountTransport).sendMail(mailOptions)
}