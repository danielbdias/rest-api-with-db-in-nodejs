const { Client } = require('pg')

const databaseConfig = {
  user: 'root',
  host: process.env.DATABASE_HOST || 'localhost',
  database: 'example',
  password: 'password',
  port: 5432,
  ssl: false
}

class PostgresClient {
  constructor () {
    this.query = this.query.bind(this)
  }

  async query (queryText, parameters) {
    const client = new Client(databaseConfig)

    await client.connect()

    console.log(queryText)

    const result = await client.query({
      text: queryText,
      values: parameters
    })

    await client.end()

    return result.rows
  }
}

module.exports = new PostgresClient()
