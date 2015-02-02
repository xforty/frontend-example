var http = require('http');
require('coffee-script').register();
var app = require('./server/app.coffee');

var server = http.createServer( app ).listen( process.env.PORT, function() {
    console.log('Express server started');
});
