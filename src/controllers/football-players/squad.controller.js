import axios from "axios";

export const squads = (req, res, next) => {
  const { team } = req.params

  const config = {
    params: { team: team },
    headers: {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '2a6ba7f0f274a12f31b69e85b7a28db3'
    }
  }

  axios.get('https://v3.football.api-sports.io/players/squads', config).then(function (response) {
    res.json({
      status: 'SUCCESS',
      data: response.data.response[0]
    })
  }).catch(function (error) {
    console.log(error);
    res.json({
      status: 'Error',
      data: error
    })
  }).finally(function () {

  })
}