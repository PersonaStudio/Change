var express = require('express'),
  bodyParser = require('body-parser'),
  path = require('path'),
  mongoose = require('mongoose');
  methodOverride = require('method-override');
  rootFolder = '';

////////  CONFIGURATION
var app = module.exports = express();
if (process.env.NODE_ENV == 'dev') {
  rootFolder = 'client/';
}
app.set('port', process.env.PORT || 8080);
rootFolder = ((__dirname + rootFolder).replace('server', ''));
app.set('views', rootFolder);

app.use(methodOverride());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(rootFolder));

////////  ROUTING
app.get('/', function (req, res) {
  res.sendFile('login/index.html', {root: rootFolder});
});

app.post('/login', function (req, res) {
  console.log(req.body);
});

app.post('/signup', function (req, res) {
  //console.log(req.body);
});


app.listen(app.get('port'), function () {
  console.log('Express server on mode ' + process.env.NODE_ENV);
  console.log('Express server listening on port ' + app.get('port'));
});