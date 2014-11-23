config = require('./config')

module.exports = (app) ->

  app.get '/', (req, res) ->
    if req.cookies.login is 'true'
      res.sendFile 'main/index.html', {root: config.rootFolder}
    else
      res.sendFile 'login/login.index.html', {root: config.rootFolder}

  app.post '/login', (req, res) ->
    res.cookie 'login', 'true'
    res.send {status: 'success'}

  app.post '/signup', (req, res) ->
    res.cookie 'login', 'true'
    res.send {status: 'success'}
