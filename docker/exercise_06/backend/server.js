'use strict'

const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()
const PORT = 5000
let users = []

app.use(bodyParser.urlencoded({extended: false}))
// app.use(bodyParser.json)
app.use(cors())

app.get('/', (req, res) => {
    res.send('Hello worldsss')
})

app.get('/view_users', (req, res) => {
    res.json(users)
})

app.post('/add_user', (req, res) => {
    let data =  {
        'name' : req.body.user_name,
        'mob_no' : req.body.mob_no,
        'city' : req.body.city
    }
    users.push(data)
    console.log(data)
    // res.send(`User ${data.name} added successfully`)
    res.redirect("http://localhost:3000/view_users")
})

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`)
})

