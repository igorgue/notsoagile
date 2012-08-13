// Generated by CoffeeScript 1.3.3
(function() {
  var host, http, port;

  http = require('http');

  port = 1337;

  host = '0.0.0.0';

  http.createServer(function(req, res) {
    res.writeHead(200, {
      'Content-Type': 'text/plain'
    });
    return res.end('Hello, World!');
  }).listen(port, host);

  console.log("Server running at http://" + host + ":" + port + "/");

}).call(this);