module.exports = function (app, process, rootFolder, bodyParser) {

  if (process.env.NODE_ENV == 'dev') {
    rootFolder = 'target';
  }

  app.set('port', process.env.PORT || 8080);

  app.set('views', __dirname + rootFolder);

  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: true }));

  app.use(express.static(path.join(__dirname, rootFolder)));


};