#!/usr/bin/env node

const fs = require('fs')
const path = require('path')
const PostgresClient = require('../clients/PostgresClient')

require('yargs') // eslint-disable-line
  .command({
    command: 'create',
    desc: 'Create the database',
    handler: (argv) => {
      const script = fs.readFileSync(path.join(__dirname, 'create-database.sql'), 'utf8')
      return PostgresClient.query(script)
    }
  })
  .command({
    command: 'destroy',
    desc: 'Destroy the database',
    handler: (argv) => {
      const script = fs.readFileSync(path.join(__dirname, 'delete-database.sql'), 'utf8')
      return PostgresClient.query(script)
    }
  })
  .help()
  .argv
