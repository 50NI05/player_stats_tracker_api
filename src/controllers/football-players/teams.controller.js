export const teams = async (req, res) => {
  res.status(200).json({
    status: 'SUCCESS',
    data: [
      {
        teamID: 2827,
        name: 'Academia Puerto Cabello'
      },
      {
        teamID: 2817,
        name: 'Aragua'
      },
      {
        teamID: 2810,
        name: 'Carabobo'
      },
      {
        teamID: 2808,
        name: 'Caracas'
      },
      {
        teamID: 2848,
        name: 'Deportivo La Guaira'
      },
      {
        teamID: 2812,
        name: 'Deportivo Lara'
      },
      {
        teamID: 2807,
        name: 'Deportivo Táchira'
      },
      {
        teamID: 2818,
        name: 'Estudiantes de Mérida'
      },
      {
        teamID: 2854,
        name: 'Hermanos Colmenárez'
      },
      {
        teamID: 2825,
        name: 'Metropolitanos'
      },
      {
        teamID: 2824,
        name: 'Mineros de Guayana'
      },
      {
        teamID: 2811,
        name: 'Monagas'
      },
      {
        teamID: 2814,
        name: 'Portuguesa'
      },
      {
        teamID: 2840,
        name: 'UCV'
      }, {
        teamID: 2806,
        name: 'Zamora'
      }, {
        teamID: 2805,
        name: 'Zulia'
      }
    ]
  })
}