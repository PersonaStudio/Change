User = require('../models/user')

module.exports = (passport) ->

  passport.serializeUser (user, next) ->
    console.log('serializing user: ' + user)
    next null, user._id
    return

  passport.deserializeUser (id, next) ->
    User.findById id, (err, user) ->
      console.log('deserializing user:' + user)
      next err, user
      return
    return

  require('./login')(passport)
  require('./signup')(passport)
  return
