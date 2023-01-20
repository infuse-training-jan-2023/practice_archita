"use strict"

const API_URL = 'https://pokeapi.co/api/v2/pokemon'
let all_pokemons = []
let offset = 0

const fetchDetails = async (http_req) => {
    try {
        const response = await fetch(http_req)
        const pokemons = await response.json()
        return pokemons
    }
    catch(err) {
        return err.message
    }
}

fetchDetails(API_URL).then(pokemons => 
    pokemons.results.forEach(element => {
        fetchDetails(element.url).then(pokemon_detail => {
                all_pokemons.push(pokemon_detail)
                displayDetails(pokemon_detail)
            })
        }
    )
)

const displayDetails = (details) => {
    const cards = document.getElementById('cards')
    const card_div = document.createElement('div')
    card_div.classList.add('card')
    card_div.setAttribute('id', details.id)

    const card_img = document.createElement('img')
    card_img.src = details.sprites.back_default
    card_img.addEventListener('mouseover', () => {
        card_img.src = details.sprites.front_default
    })
    card_img.addEventListener('mouseout', () => {
        card_img.src = details.sprites.back_default
    })
    card_div.appendChild(card_img)

    const card_name = document.createElement('p')
    card_name.innerHTML = details.name
    card_div.appendChild(card_name)

    const card_weight = document.createElement('p')
    card_weight.innerHTML = details.weight
    card_div.appendChild(card_weight)

    const card_bexp = document.createElement('p')
    card_bexp.innerHTML = details.base_experience
    card_div.appendChild(card_bexp)

    const card_link = document.createElement('a')
    card_link.innerHTML = 'View More'
    card_link.href = `details.html?${details.id}`
    card_link.target = 'info_iframe'
    card_div.appendChild(card_link)

    cards.appendChild(card_div)
}

const changeSortValue = () => {
    // selected = document.getElementById('sort_options').options[document.getElementById('sort_options').selectedIndex].text
    let selected = document.getElementById('sort_options').value
    all_pokemons.sort((a, b) => {
        if(selected == 'default')
            return a.name < b.name ? -1 : 1
        else if(selected == 'weight') 
            return parseInt(a.weight) - parseInt(b.weight)
        else if(selected == 'base_experience')
            return parseInt(a.base_experience) - parseInt(b.base_experience)
    })

    const card_div = document.getElementById('cards')
    card_div.innerHTML = ''
    
    all_pokemons.forEach(card => {
        displayDetails(card)
    })
}

const searchPokemons = () => {
    let searchTxt = document.getElementById('gsearch').value

    let filtered_cards = all_pokemons.filter(card => {
        return card.name.startsWith(searchTxt)
    });

    const card_div = document.getElementById('cards')
    card_div.innerHTML = ''
    filtered_cards.forEach(card => {
        displayDetails(card)
    })
}

const loadMore = () => {
    offset += 20
    fetchDetails(`${API_URL}?offset=${offset}&limit=20`).then(pokemons => 
        pokemons.results.forEach(element => {
            fetchDetails(element.url).then(pokemon_detail => {
                    all_pokemons.push(pokemon_detail)
                    displayDetails(pokemon_detail)
                })
            }
        )
    )
}


