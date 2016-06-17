config = require("config");

exports.index = (req, res) ->
  res.render "playground/index",
    title: config['translations'][config['locale']]['code_field_title'],
    section: ""
    section: "exercise-page"
    exerciseName: "playground"
    level: 1
    locale: config['locale']
    blockly_lang: config['translations'][config['locale']]['blockly_lang']
    playground_task_overview: config['translations'][config['locale']]['playground_task_overview']
    start_button_caption: config['translations'][config['locale']]['start_button_caption']
    next_button_caption: config['translations'][config['locale']]['next_button_caption']
    reset_to_defaults: config['translations'][config['locale']]['reset_to_defaults']
    execute_code: config['translations'][config['locale']]['execute_code']
    service_name: config['translations'][config['locale']]['service_name']
    abort_code_execution: config['translations'][config['locale']]['abort_code_execution']
    evaluate_btn_tooltip: config['translations'][config['locale']]['evaluate_btn_tooltip']
    evaluate_performance: config['translations'][config['locale']]['evaluate_performance']
