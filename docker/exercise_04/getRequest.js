const axios = require('axios')
const API_URL = process.env.URL

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

