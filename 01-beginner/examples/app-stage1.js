require('dotenv').config()

const apiConfig = {
  port: 4000
}

const bodyParser = require('body-parser')

const express = require('express')
const server = express()

server.use(bodyParser.json())

server.get('/users', (req, res) => {
  res.send({ hello: 'world' })
})

server.listen(apiConfig.port, () => console.log(`API running on port ${apiConfig.port} ...`))
