config = require('./config')

module.exports = (app, passport) ->

  app.get '/', (req, res) ->
    if req.isAuthenticated()
      res.sendFile 'main/index.html', {root: config.rootFolder}
    else
      res.sendFile 'login/login.index.html', {root: config.rootFolder}

  app.post '/login', passport.authenticate('login'), (req, res) ->
    res.send {status: 'success'}

  app.post '/signup', passport.authenticate('signup'), (req, res) ->
    res.send {status: 'success'}
