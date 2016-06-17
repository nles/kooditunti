config = require('config');

exports.beginning = (req, res) ->
  res.render "surveys/beginning",
    title: config['translations'][config['locale']]['start_survey']
    section: "survey-page"

exports.ending = (req, res) ->
  res.render "surveys/ending",
    title: config['translations'][config['locale']]['end_survey']
    section: "survey-page"
