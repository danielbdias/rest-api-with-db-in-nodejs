const GetAddresses = require('../../../Domain/UseCases/ManageAddress/GetAddresses')
const SaveAddress = require('../../../Domain/UseCases/ManageAddress/SaveAddress')
const DeleteAddress = require('../../../Domain/UseCases/ManageAddress/DeleteAddress')

function registerRoutes(server) {
  // health
  server.get('/health', (req, res) => res.send('OK !'))

  // address
  server.get('/addresses', async (req, res) => {
    const addresses = await GetAddresses({ })
    res.send(addresses.map(item => item.toJSON()))
  })
  server.get('/addresses/:id', async (req, res) => {
    const [ address ] = await GetAddresses({ id: req.params.id })
    res.send(address.toJSON())
  })
  server.post('/addresses', async (req, res) => {
    const address = await SaveAddress({ address: req.body })
    res.send(address.toJSON())
  })
  server.put('/addresses/:id', async (req, res) => {
    const address = await SaveAddress({ address: Object.assign({}, req.body, { id: req.params.id }) })
    res.send(address.toJSON())
  })
}

module.exports = { registerRoutes }
