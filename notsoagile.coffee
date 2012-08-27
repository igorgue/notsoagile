express = require 'express'
port = 1337
host = '0.0.0.0'

app = express()

app.get '/tasks', (req, res) ->
  res.set
    'Content-Type': 'application/json'

  res.send ['Please fix the site @igor #broken-site status:new', 'This is a done task @igor status:done']

app.listen port
console.log "Server running at http://#{host}:#{port}/"
