const axios = require('axios')
const API_URL = 'https://pokeapi.co/api/v2/pokemon'

const getPokemon = async () => {
    try {
        const res = await axios.get(API_URL)
        console.log(res.data)
    }
    catch(err) {
        console.error(err)
    }
}

getPokemon()

