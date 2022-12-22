import axios from "axios";

export const players = (req, res, next) => {
  const { id, season, league } = req.params

  const config = {
    params: {
      id: id,
      season: season,
      league: league
    },
    headers: {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '2a6ba7f0f274a12f31b69e85b7a28db3'
    }
  }

  axios.get('https://v3.football.api-sports.io/players', config).then(function (response) {
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