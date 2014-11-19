var express = require('express'),
  bodyParser = require('body-parser'),
  path = require('path'),
  mongoose = require('mongoose');
  rootFolder = '';

////////  CONFIGURATION
var app = module.exports = express();
require('./config')(app, process, rootFolder, bodyParser);

////////  ROUTING
app.get('/', function (req, res) {
  res.sendFile('/login/index.html', {root: rootFolder});
});

app.post('/login', function (req, res) {
  console.log(req.body);
});

app.post('/signup', function (req, res) {
  console.log(req.body);
});


app.listen(app.get('port'), function () {
  console.log('Express server on mode ' + process.env.NODE_ENV);
  console.log('Express server listening on port ' + app.get('port'));
});