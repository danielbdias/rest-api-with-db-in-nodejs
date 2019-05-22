require('dotenv').config()

const apiConfig = {
  port: 4000
}

const databaseConfig = {
  user: 'root',
  host: process.env.DATABASE_HOST || 'localhost',
  database: 'example',
  password: 'password',
  port: 5432,
  ssl: false
}

const { Client } = require('pg')

const bodyParser = require('body-parser')

const express = require('express')
const server = express()

server.use(bodyParser.json())

server.get('/users', async (req, res) => {
  const client = new Client(databaseConfig)

  await client.connect()

  const result = await client.query({
    text: 'select * from "public"."Users";'
  })

  await client.end()

  res.send(result.rows)
})

server.post('/users', async (req, res) => {
  const client = new Client(databaseConfig)

  await client.connect()

  const result = await client.query({
    text: 'insert into "public"."Users" ("name", "createdAt") values ($1, now()) returning *;',
    values: [ req.body.name ]
  })

  await client.end()

  res.send(result.rows[0])
})

server.listen(apiConfig.port, () => console.log(`API running on port ${apiConfig.port} ...`))
