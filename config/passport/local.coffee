
###*
Module dependencies.
###
mongoose = require("mongoose")
LocalStrategy = require("passport-local").Strategy
config = require("config")
User = mongoose.model("User")

###*
Expose
###
module.exports = new LocalStrategy(
  usernameField: "email"
  passwordField: "password"
, (email, password, done) ->
  options = criteria:
    email: email

  User.load options, (err, user) ->
    return done(err)  if err
    unless user
      return done(null, false,
        message: config['translations'][config['locale']]['unknown_user']
      )
    unless user.authenticate(password)
      return done(null, false,
        message: config['translations'][config['locale']]['invalid_password']
      )
    done null, user

  return
)
