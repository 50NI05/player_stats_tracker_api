import nodemailer from "nodemailer";
import { google } from "googleapis";
const OAth2 = google.auth.OAuth2
import accountTransport from "../../../account_transport.json" assert { type: "json" };

export const sendMail = async (req, res, callback) => {
  let data = req.body

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
    subject: "Código de Activación",  
    html: `
      <!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clave Temporal</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
    }

    .container {
      position: relative;
      width: 100%;
      height: 30vh;
      background: url('https://www.todosahora.com/wp-content/uploads/2023/02/FUTVE.png') center/cover no-repeat;
    }

    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgb(93,33,40, 0.9);
    }

    .message {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
      padding: 20px;
      box-sizing: border-box;
    }

    h1 {
      font-size: 18px;
      color: #ffffff;
      margin-bottom: 10px;
    }

    p {
      font-size: 14px;
      color: #ffffff;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="overlay">
      <div class="message">
        <h1>Su clave temporal es: <span style="color: #ff0000;">abcd63</span>.</h1>
        <p>Tiene 30 minutos para ingresar al sistema después de recibir este correo.</p>
      </div>
    </div>
  </div>
</body>

</html>
    `
  }

  await nodemailer.createTransport(accountTransport).sendMail(mailOptions)

  res.json('fino')
}