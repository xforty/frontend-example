var http = require('http');
require('coffee-script').register();
var express = require('express');
var app = require('./server/app');

app.use(express.static('public', {}));

var server = http.createServer( app );
var port = process.env.PORT;

var startServer = function() {
  server.listen(port);
};

server.on('listening',function() {
  console.log('Express server started');
  if(port) {
    console.log('Listening on port '+port);
  }
});

server.on('error',function(err) {
  if (err.code == 'EADDRINUSE') {
    newPort = Number(port)+1;
    console.log('Port '+port+' in use, trying '+newPort);
    port = newPort;
    startServer();
  } else {
    console.log(err.message);
  }
});

startServer();

module.exports = server;
