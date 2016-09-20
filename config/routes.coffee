# Module dependencies.
mongoose = require("mongoose")
home = require("home")
exercises = require("exercises")
playground = require("playground")
surveys = require("surveys")
config = require("config")

# Expose
module.exports = (app, passport) ->
  #app.get "/", home.index
  #app.redirect "/", "/harjoitukset";

  # exercises
  app.get "/", exercises.index
  app.redirect "/harjoitukset", "/";

  app.get "/harjoitukset/perusteet/:level", exercises.basics
  app.redirect "/harjoitukset/perusteet", "/harjoitukset/perusteet/1";

  app.get "/harjoitukset/toistolauseet/:level", exercises.loops
  app.redirect "/harjoitukset/toistolauseet", "/harjoitukset/toistolauseet/1";

  app.get "/harjoitukset/muuttujat/:level", exercises.vars
  app.redirect "/harjoitukset/muuttujat", "/harjoitukset/muuttujat/1";

  app.get "/harjoitukset/ehtolauseet/:level", exercises.ifs
  app.redirect "/harjoitukset/ehtolauseet", "/harjoitukset/ehtolauseet/1";

  app.get "/harjoitukset/koordinaatisto-ja-tapahtumat/:level", exercises.events
  app.redirect "/harjoitukset/koordinaatisto-ja-tapahtumat", "/harjoitukset/koordinaatisto-ja-tapahtumat/1";

  # playground
  app.get "/koodikentta", playground.index

  # surveys
  app.get "/alkukysely", surveys.beginning
  app.get "/loppukysely", surveys.ending

  # exercise ratings
  app.post "/rate-exercise", exercises.saveRating
  app.get "/exercise-ratings", exercises.getRatings

  # Error handling
  app.use (err, req, res, next) ->

    # treat as 404
    if err.message and (~err.message.indexOf("not found") or (~err.message.indexOf("Cast to ObjectId failed")))
      return next()
    console.error err.stack

    # error page
    res.status(500).render "500",
      error: err.stack

    return

  # assume 404 since no middleware responded
  app.use (req, res, next) ->
    res.status(404).render "404",
      url: req.originalUrl
      error: "Not found"

    return

  return
