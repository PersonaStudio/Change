var express = require('express'),
  bodyParser = require('body-parser'),
  path = require('path'),
  mongoose = require('mongoose'),
  methodOverride = require('method-override'),
  cookieParser = require('cookie-parser');


var config = require('./config');
////////  CONFIGURATION
mongoose.connect('mongodb://localhost/change');

var app = module.exports = express();
if (process.env.NODE_ENV == 'dev') {
  config.rootFolder = 'client/';
}
app.set('port', process.env.PORT || 8080);
config.rootFolder = ((__dirname + config.rootFolder).replace('server', ''));
app.set('views', config.rootFolder);

app.use(cookieParser());
app.use(methodOverride());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(config.rootFolder));

//////// CONFIG PASSPORT
var passport = require('passport');
var expressSession = require('express-session');
app.use(expressSession({
  secret: 'thisisacoolproject',
  saveUninitialized: true,
  resave: true}));
app.use(passport.initialize());
app.use(passport.session());
require('./passport')(passport);

////////  ROUTING
require('./routes')(app, passport);

app.listen(app.get('port'), function () {
  console.log('Express server on mode ' + process.env.NODE_ENV);
  console.log('Express server listening on port ' + app.get('port'));
});