http = require 'http'
port = 1337
host = '0.0.0.0'

http.createServer (req, res) ->
  res.writeHead 200, {'Content-Type': 'text/plain'}
  res.end 'Hello, World!'
.listen port, host

console.log "Server running at http://#{host}:#{port}/"
