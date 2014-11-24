LocalStrategy = require('passport-local').Strategy
User = require('../models/user')

module.exports = (passport) ->

  Signup = (username, password, next) ->
    User.findOne {'username': username}, (err, user) ->
      if err
        console.log 'error in signup'
        return next err
      if user
        console.log 'User already exists with username: ' + username
        return next null, false

      newUser = new User()
      newUser.username = username;
      newUser.password = password

      newUser.save (err) ->
        if err
          console.log 'error in saving user: ' + err
#          throw err
        console.log 'User registration successful: ' + username
        next null, newUser


  passport.use 'signup', new LocalStrategy {passReqToCallBack: true}, Signup
  return
