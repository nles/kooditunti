# Module dependencies.
path = require("path")
extend = require("util")._extend
development = require("./env/development")
test = require("./env/test")
production = require("./env/production")
defaults = root: path.normalize(__dirname + "/..")

###*
Expose
###
module.exports = {
  development: extend(development, defaults)
  test: extend(test, defaults)
  production: extend(production, defaults)
}[process.env.NODE_ENV or "development"]
