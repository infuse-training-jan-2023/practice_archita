const express = require('express')
const app = express()
// process.env['PORT'] = '8080'
const PORT = process.env.PORT

app.get('/', (req, res) => {
    res.send('Hello world')
})

app.listen(PORT, () => {
    console.log(`Running on port ${PORT}`)
})
