config = require('./config')

module.exports = (app) ->

  app.get '/', (req, res) ->
    res.sendFile 'login/login.index.html', {root: config.rootFolder}

  app.post '/login', (req, res) ->
    res.send {status: 'success'}
#    res.sendFile 'main/index.html', {root: config.rootFolder}

  app.post '/signup', (req, res) ->
    res.sendFile 'main/index.html', {root: config.rootFolder}

  app.get '/game', (req, res) ->
    res.sendFile 'main/index.html', {root: config.rootFolder}

