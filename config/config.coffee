# Module dependencies.
path = require("path")
extend = require("util")._extend

# configs for different environments
development = require("./env/development")
test = require("./env/test")
production = require("./env/production")

# defaults for every environment
defaults =
  root: path.normalize(__dirname + "/..")
  locale: "en_US"

# pick the config to use according to the set environment
config_to_use = {
  development: extend(development, defaults)
  test: extend(test, defaults)
  production: extend(production, defaults)
}[process.env.NODE_ENV or "development"]

# add translations to the active environments config
translations = require("./translations/all.json")
config_to_use = extend(config_to_use, translations)

# expose
module.exports = config_to_use
