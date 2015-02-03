var http = require('http');
require('coffee-script').register();
var app = require('./server/app.coffee');

var startServer = function(port) {
  var server = http.createServer( app ).listen(port, function() {
      console.log('Express server started');
      if(port) {
        console.log('Listening on port '+port);
      }
  });
  server.on('error',function(err) {
    if (err.code == 'EADDRINUSE') {
      var newPort = Number(port)+1;
      console.log('Port '+port+' in use, trying '+newPort);
      startServer(newPort);
    } else {
      console.log(err.message);
    }
  });
}


startServer(process.env.PORT);
