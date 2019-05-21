module.exports = {
  user: 'root',
  host: process.env.DATABASE_HOST || 'localhost',
  database: 'example',
  password: 'password',
  port: 5432,
  ssl: false
}
