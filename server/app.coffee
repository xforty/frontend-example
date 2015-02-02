express = require 'express'
app = express()

app.get '/hi', (req, res) ->
  res.send 'hello!'

module.exports = app
