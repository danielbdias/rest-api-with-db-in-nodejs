require('dotenv').config()

const config = require('../config/api')

const { registerRoutes } = require('./rest/routes')

const logger = require('../logger')

const bodyParser = require('body-parser')

const express = require('express')
const server = express()

server.use(bodyParser.json())

registerRoutes(server)

server.listen(config.port, () => logger.info(`API running on port ${config.port} ...`))
