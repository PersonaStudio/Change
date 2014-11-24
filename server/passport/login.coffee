LocalStrategy = require('passport-local').Strategy
User = require('../models/user')

module.exports = (passport) ->

  isValidPassword = (user, password) ->
    user.password is password

  Login = (username, password, next) ->
    User.findOne {'username': username}, (err, user) ->
      if err
        console.log 'error in login'
        return next err
      if not user
        console.log 'User not found with username ' + username
        return next null, false
      if not isValidPassword(user, password)
        console.log 'user ' + username + ': invalid password'
        return next null, false
      next null, user

  passport.use 'login', new LocalStrategy {passReqToCallBack: true}, Login
  return
