var express = require('express'),
  path = require('path'),
  rootFolder = '';

var app = module.exports = express();

app.set('port', process.env.PORT || 8080);

if (process.env.NODE_ENV == 'dev') {
  rootFolder = 'target';
}
app.set('views', __dirname + rootFolder);

app.use(express.static(path.join(__dirname, rootFolder)));

app.get('/', function (req, res) {
  res.sendFile('/login/index.html', {root: rootFolder});
});


app.listen(app.get('port'), function () {
  console.log('Express server on mode ' + process.env.NODE_ENV);
  console.log('Express server listenning on port ' + app.get('port'));
});