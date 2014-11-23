var express = require('express'),
  bodyParser = require('body-parser'),
  path = require('path'),
  mongoose = require('mongoose');
  methodOverride = require('method-override');

  var config = require('./config');

////////  CONFIGURATION
var app = module.exports = express();
if (process.env.NODE_ENV == 'dev') {
  config.rootFolder = 'client/';
}
app.set('port', process.env.PORT || 8080);
config.rootFolder = ((__dirname + config.rootFolder).replace('server', ''));
app.set('views', config.rootFolder);

app.use(methodOverride());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(config.rootFolder));

////////  ROUTING
require('./routes')(app);



app.listen(app.get('port'), function () {
  console.log('Express server on mode ' + process.env.NODE_ENV);
  console.log('Express server listening on port ' + app.get('port'));
});