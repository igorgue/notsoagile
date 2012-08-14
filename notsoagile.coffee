express = require 'express'
port = 1337
host = '0.0.0.0'

app = express()

app.get '/', (req, res) ->
  res.redirect '/'

app.listen port
console.log "Server running at http://#{host}:#{port}/"
