mongoose = require("mongoose")
config = require("config");

exports.index = (req, res) ->
  res.render "exercises/index",
    title: config['translations'][config['locale']]['exercises_title']
    section: "exercise-links-page"
    subsection: ""
    locale: config['locale']
    blockly_lang: config['translations'][config['locale']]['blockly_lang']
    service_name: config['translations'][config['locale']]['service_name']
    basics_title: config['translations'][config['locale']]['basics_title']
    warmup_title: config['translations'][config['locale']]['warmup_title']
    variables_title: config['translations'][config['locale']]['variables_title']
    code_field_link: config['translations'][config['locale']]['code_field_link']
    info_link: config['translations'][config['locale']]['info_link'],
    loops_title: config['translations'][config['locale']]['loops_title'],
    start_over: config['translations'][config['locale']]['start_over'],
    info_header: config['translations'][config['locale']]['info_header'],
    info_content: config['translations'][config['locale']]['info_content']
    conditional_statements_title: config['translations'][config['locale']]['conditional_statements_title']
    coordinate_system_and_events_title: config['translations'][config['locale']]['coordinate_system_and_events_title']

exports.basics = (req, res) ->
  res.render "exercises/basics/index",
    title: config['translations'][config['locale']]['basics_title']
    section: "exercise-page"
    subsection: "exercise-basics"
    exerciseName: "basics"
    exercisePathName: "perusteet"
    locale: config['locale']
    color: "#9f005d"
    exercise_header: config['translations'][config['locale']]['exercise_header']
    start_button_caption: config['translations'][config['locale']]['start_button_caption']
    next_button_caption: config['translations'][config['locale']]['next_button_caption']
    level: req.params.level
    blockly_lang: config['translations'][config['locale']]['blockly_lang']
    service_name: config['translations'][config['locale']]['service_name']
    execute_code: config['translations'][config['locale']]['execute_code']
    reset_to_defaults: config['translations'][config['locale']]['reset_to_defaults']
    return_to_previous: config['translations'][config['locale']]['return_to_previous']
    abort_code_execution: config['translations'][config['locale']]['abort_code_execution']
    evaluate_btn_tooltip: config['translations'][config['locale']]['evaluate_btn_tooltip']
    evaluate_performance: config['translations'][config['locale']]['evaluate_performance']
    exercises_basic_level1_modal1: config['translations'][config['locale']]['exercises_basic_level1_modal1']
    exercises_basic_level1_modal2: config['translations'][config['locale']]['exercises_basic_level1_modal2']
    exercises_basic_level1_modal3: config['translations'][config['locale']]['exercises_basic_level1_modal3']
    exercises_basic_level1_modal4: config['translations'][config['locale']]['exercises_basic_level1_modal4']
    exercises_basic_level1_modal5: config['translations'][config['locale']]['exercises_basic_level1_modal5']
    exercises_basic_level1_modal6: config['translations'][config['locale']]['exercises_basic_level1_modal6']
    exercises_basic_level1_modal7: config['translations'][config['locale']]['exercises_basic_level1_modal7']
    exercises_basic_level1_modal8: config['translations'][config['locale']]['exercises_basic_level1_modal8']
    exercises_basic_level1_modal9: config['translations'][config['locale']]['exercises_basic_level1_modal9']
    exercises_basic_level1_modal10: config['translations'][config['locale']]['exercises_basic_level1_modal10']
    exercises_basic_level2_modal1: config['translations'][config['locale']]['exercises_basic_level2_modal1']
    exercises_basic_level2_modal2: config['translations'][config['locale']]['exercises_basic_level2_modal2']
    exercises_basic_level2_modal3: config['translations'][config['locale']]['exercises_basic_level2_modal3']
    exercises_basic_level2_modal4: config['translations'][config['locale']]['exercises_basic_level2_modal4']
    exercises_basic_level2_modal5: config['translations'][config['locale']]['exercises_basic_level2_modal5']
    exercises_basic_level2_modal6: config['translations'][config['locale']]['exercises_basic_level2_modal6']
    exercises_basic_level3_modal1: config['translations'][config['locale']]['exercises_basic_level3_modal1']
    exercises_basic_level3_modal2: config['translations'][config['locale']]['exercises_basic_level3_modal2']
    exercises_basic_level3_modal3: config['translations'][config['locale']]['exercises_basic_level3_modal3']
    exercises_basic_level3_modal4: config['translations'][config['locale']]['exercises_basic_level3_modal4']
    exercises_basic_level3_modal5: config['translations'][config['locale']]['exercises_basic_level3_modal5']
    exercises_basic_level3_modal6: config['translations'][config['locale']]['exercises_basic_level3_modal6']
    exercises_basic_level3_modal7: config['translations'][config['locale']]['exercises_basic_level3_modal7']
    exercises_basic_level3_modal8: config['translations'][config['locale']]['exercises_basic_level3_modal8']
    exercises_basic_level3_modal9: config['translations'][config['locale']]['exercises_basic_level3_modal9']
    exercises_basic_level1_task_overview: config['translations'][config['locale']]['exercises_basic_level1_task_overview']
    exercises_basic_level2_task_overview: config['translations'][config['locale']]['exercises_basic_level2_task_overview']
    exercises_basic_level3_task_overview: config['translations'][config['locale']]['exercises_basic_level3_task_overview']
    i_could_draw_text_on_the_grid: config['translations'][config['locale']]['i_could_draw_text_on_the_grid']
    text_was_an_answer_to_a_calculation: config['translations'][config['locale']]['text_was_an_answer_to_a_calculation']
    
exports.loops = (req, res) ->
  res.render "exercises/loops/index",
    title: config['translations'][config['locale']]['labyrinth_title']
    section: "exercise-page"
    subsection: "exercise-loops"
    exerciseName: "loops"
    exercisePathName: "toistolauseet"
    color: "#067195"
    locale: config['locale']
    level: req.params.level
    start_button_caption: config['translations'][config['locale']]['start_button_caption']
    next_button_caption: config['translations'][config['locale']]['next_button_caption']
    
    exercises_loops_level1_modal1: config['translations'][config['locale']]['exercises_loops_level1_modal1']
    exercises_loops_level1_modal2: config['translations'][config['locale']]['exercises_loops_level1_modal2']
    exercises_loops_level2_modal1: config['translations'][config['locale']]['exercises_loops_level2_modal1']
    exercises_loops_level3_modal1: config['translations'][config['locale']]['exercises_loops_level3_modal1']
    
    exercises_loops_level1_task_overview: config['translations'][config['locale']]['exercises_loops_level1_task_overview']
    
    blockly_lang: config['translations'][config['locale']]['blockly_lang']
    service_name: config['translations'][config['locale']]['service_name']
    execute_code: config['translations'][config['locale']]['execute_code']
    reset_to_defaults: config['translations'][config['locale']]['reset_to_defaults']
    return_to_previous: config['translations'][config['locale']]['return_to_previous']
    abort_code_execution: config['translations'][config['locale']]['abort_code_execution']
    evaluate_btn_tooltip: config['translations'][config['locale']]['evaluate_btn_tooltip']
    evaluate_performance: config['translations'][config['locale']]['evaluate_performance']

exports.vars = (req, res) ->
  res.render "exercises/vars/index",
    title: config['translations'][config['locale']]['variables_title']
    section: "exercise-page"
    subsection: "exercise-vars"
    exerciseName: "vars"
    exercisePathName: "muuttujat"
    color: "#1c7563"
    locale: config['locale']
    level: req.params.level
    
    exercises_vars_level1_modal1: config['translations'][config['locale']]['exercises_vars_level1_modal1']
    exercises_vars_level1_modal2: config['translations'][config['locale']]['exercises_vars_level1_modal2']
    exercises_vars_level1_modal3: config['translations'][config['locale']]['exercises_vars_level1_modal3']
    exercises_vars_level1_modal4: config['translations'][config['locale']]['exercises_vars_level1_modal4']
    exercises_vars_level1_modal5: config['translations'][config['locale']]['exercises_vars_level1_modal5']
    exercises_vars_level1_modal6: config['translations'][config['locale']]['exercises_vars_level1_modal6']
    exercises_vars_level1_modal7: config['translations'][config['locale']]['exercises_vars_level1_modal7']
    exercises_vars_level1_modal8: config['translations'][config['locale']]['exercises_vars_level1_modal8']
    exercises_vars_level1_modal9: config['translations'][config['locale']]['exercises_vars_level1_modal9']
    exercises_vars_level1_modal10: config['translations'][config['locale']]['exercises_vars_level1_modal10']
    exercises_vars_level2_modal1: config['translations'][config['locale']]['exercises_vars_level2_modal1']
    exercises_vars_level2_modal2: config['translations'][config['locale']]['exercises_vars_level2_modal2']
    exercises_vars_level2_modal3: config['translations'][config['locale']]['exercises_vars_level2_modal3']
    exercises_vars_level2_modal4: config['translations'][config['locale']]['exercises_vars_level2_modal4']
    exercises_vars_level3_modal1: config['translations'][config['locale']]['exercises_vars_level3_modal1']
    exercises_vars_level3_modal2: config['translations'][config['locale']]['exercises_vars_level3_modal2']
    exercises_vars_level3_modal3: config['translations'][config['locale']]['exercises_vars_level3_modal3']
    
    exercises_vars_level1_task_overview: config['translations'][config['locale']]['exercises_vars_level1_task_overview']
    exercises_vars_level2_task_overview: config['translations'][config['locale']]['exercises_vars_level2_task_overview']
    exercises_vars_level3_task_overview: config['translations'][config['locale']]['exercises_vars_level3_task_overview']
    
    i_know_how_to_use_variables: config['translations'][config['locale']]['i_know_how_to_use_variables']
    i_could_draw_my_own_text_to_the_grid: config['translations'][config['locale']]['i_could_draw_my_own_text_to_the_grid']
    i_tried_catenation_of_multiple_text_snippets: config['translations'][config['locale']]['i_tried_catenation_of_multiple_text_snippets']
    i_managed_to_store_text_in_the_variables: config['translations'][config['locale']]['i_managed_to_store_text_in_the_variables']
    when_selected_button_is_pressed_the_amount_is_displayed: config['translations'][config['locale']]['when_selected_button_is_pressed_the_amount_is_displayed']
    i_could_draw_text_on_the_grid: config['translations'][config['locale']]['i_could_draw_text_on_the_grid']
    
    
    start_button_caption: config['translations'][config['locale']]['start_button_caption']
    next_button_caption: config['translations'][config['locale']]['next_button_caption']
    blockly_lang: config['translations'][config['locale']]['blockly_lang']
    service_name: config['translations'][config['locale']]['service_name']
    execute_code: config['translations'][config['locale']]['execute_code']
    reset_to_defaults: config['translations'][config['locale']]['reset_to_defaults']
    return_to_previous: config['translations'][config['locale']]['return_to_previous']
    abort_code_execution: config['translations'][config['locale']]['abort_code_execution']
    evaluate_btn_tooltip: config['translations'][config['locale']]['evaluate_btn_tooltip']
    evaluate_performance: config['translations'][config['locale']]['evaluate_performance']

exports.ifs = (req, res) ->
  res.render "exercises/ifs/index",
    title: config['translations'][config['locale']]['conditional_statements_title']
    section: "exercise-page"
    subsection: "exercise-ifs"
    exerciseName: "ifs"
    exercisePathName: "ehtolauseet"
    color: "#c2272d"
    locale: config['locale']
    level: req.params.level
    start_button_caption: config['translations'][config['locale']]['start_button_caption']
    next_button_caption: config['translations'][config['locale']]['next_button_caption']
    
    exercises_ifs_level1_modal1: config['translations'][config['locale']]['exercises_ifs_level1_modal1']
    exercises_ifs_level1_modal2: config['translations'][config['locale']]['exercises_ifs_level1_modal2']
    exercises_ifs_level1_modal3: config['translations'][config['locale']]['exercises_ifs_level1_modal3']
    exercises_ifs_level1_modal4: config['translations'][config['locale']]['exercises_ifs_level1_modal4']
    exercises_ifs_level1_modal5: config['translations'][config['locale']]['exercises_ifs_level1_modal5']
    exercises_ifs_level1_modal6: config['translations'][config['locale']]['exercises_ifs_level1_modal6']
    exercises_ifs_level1_modal7: config['translations'][config['locale']]['exercises_ifs_level1_modal7']
    exercises_ifs_level1_modal8: config['translations'][config['locale']]['exercises_ifs_level1_modal8']
    exercises_ifs_level1_modal9: config['translations'][config['locale']]['exercises_ifs_level1_modal9']
    exercises_ifs_level2_modal1: config['translations'][config['locale']]['exercises_ifs_level2_modal1']
    exercises_ifs_level2_modal2: config['translations'][config['locale']]['exercises_ifs_level2_modal2']
    exercises_ifs_level2_modal3: config['translations'][config['locale']]['exercises_ifs_level2_modal3']
    exercises_ifs_level2_modal4: config['translations'][config['locale']]['exercises_ifs_level2_modal4']
    exercises_ifs_level2_modal5: config['translations'][config['locale']]['exercises_ifs_level2_modal5']
    exercises_ifs_level2_modal6: config['translations'][config['locale']]['exercises_ifs_level2_modal6']
    exercises_ifs_level2_modal7: config['translations'][config['locale']]['exercises_ifs_level2_modal7']
    exercises_ifs_level3_modal1: config['translations'][config['locale']]['exercises_ifs_level3_modal1']
    exercises_ifs_level3_modal2: config['translations'][config['locale']]['exercises_ifs_level3_modal2']
    exercises_ifs_level3_modal3: config['translations'][config['locale']]['exercises_ifs_level3_modal3']
    exercises_ifs_level3_modal4: config['translations'][config['locale']]['exercises_ifs_level3_modal4']
    
    exercises_ifs_level1_task_overview: config['translations'][config['locale']]['exercises_ifs_level1_task_overview']
    exercises_ifs_level2_task_overview: config['translations'][config['locale']]['exercises_ifs_level2_task_overview']
    exercises_ifs_level3_task_overview: config['translations'][config['locale']]['exercises_ifs_level3_task_overview']
    
    i_could_draw_text_on_the_grid: config['translations'][config['locale']]['i_could_draw_text_on_the_grid']
    text_was_an_answer_to_a_calculation: config['translations'][config['locale']]['text_was_an_answer_to_a_calculation']
    the_text_changed_based_on_the_answer: config['translations'][config['locale']]['the_text_changed_based_on_the_answer']
    i_used_one_or_more_ifs: config['translations'][config['locale']]['i_used_one_or_more_ifs']
    
    blockly_lang: config['translations'][config['locale']]['blockly_lang']
    service_name: config['translations'][config['locale']]['service_name']
    execute_code: config['translations'][config['locale']]['execute_code']
    reset_to_defaults: config['translations'][config['locale']]['reset_to_defaults']
    return_to_previous: config['translations'][config['locale']]['return_to_previous']
    abort_code_execution: config['translations'][config['locale']]['abort_code_execution']
    evaluate_btn_tooltip: config['translations'][config['locale']]['evaluate_btn_tooltip']
    evaluate_performance: config['translations'][config['locale']]['evaluate_performance']

exports.events = (req, res) ->
  res.render "exercises/events/index",
    title: config['translations'][config['locale']]['coordinate_system_and_events_title']
    section: "exercise-page"
    subsection: "exercise-events"
    exerciseName: "events"
    exercisePathName: "koordinaatisto-ja-tapahtumat"
    color: "#f36c00"
    locale: config['locale']
    level: req.params.level
    start_button_caption: config['translations'][config['locale']]['start_button_caption']
    next_button_caption: config['translations'][config['locale']]['next_button_caption']
    exercises_events_level1_modal1: config['translations'][config['locale']]['exercises_events_level1_modal1']
    exercises_events_level1_modal2: config['translations'][config['locale']]['exercises_events_level1_modal2']
    exercises_events_level1_modal3: config['translations'][config['locale']]['exercises_events_level1_modal3']
    exercises_events_level1_modal4: config['translations'][config['locale']]['exercises_events_level1_modal4']
    exercises_events_level1_modal5: config['translations'][config['locale']]['exercises_events_level1_modal5']
    exercises_events_level1_modal6: config['translations'][config['locale']]['exercises_events_level1_modal6']
    exercises_events_level1_modal7: config['translations'][config['locale']]['exercises_events_level1_modal7']
    exercises_events_level1_modal8: config['translations'][config['locale']]['exercises_events_level1_modal8']
    exercises_events_level1_modal9: config['translations'][config['locale']]['exercises_events_level1_modal9']
    exercises_events_level2_modal1: config['translations'][config['locale']]['exercises_events_level2_modal1']
    exercises_events_level2_modal2: config['translations'][config['locale']]['exercises_events_level2_modal2']
    exercises_events_level2_modal3: config['translations'][config['locale']]['exercises_events_level2_modal3']
    exercises_events_level2_modal4: config['translations'][config['locale']]['exercises_events_level2_modal4']
    exercises_events_level2_modal5: config['translations'][config['locale']]['exercises_events_level2_modal5']
    exercises_events_level2_modal6: config['translations'][config['locale']]['exercises_events_level2_modal6']
    exercises_events_level2_modal7: config['translations'][config['locale']]['exercises_events_level2_modal7']
    exercises_events_level3_modal1: config['translations'][config['locale']]['exercises_events_level3_modal1']
    exercises_events_level3_modal2: config['translations'][config['locale']]['exercises_events_level3_modal2']
    exercises_events_level3_modal3: config['translations'][config['locale']]['exercises_events_level3_modal3']
    exercises_events_level3_modal4: config['translations'][config['locale']]['exercises_events_level3_modal4']
    exercises_events_level3_modal5: config['translations'][config['locale']]['exercises_events_level3_modal5']
    exercises_events_level1_task_overview: config['translations'][config['locale']]['exercises_events_level1_task_overview']
    exercises_events_level2_task_overview: config['translations'][config['locale']]['exercises_events_level2_task_overview']
    exercises_events_level3_task_overview: config['translations'][config['locale']]['exercises_events_level3_task_overview']
    when_selected_button_is_pressed_the_amount_is_displayed: config['translations'][config['locale']]['when_selected_button_is_pressed_the_amount_is_displayed']
    i_understand_how_coordinate_system_works: config['translations'][config['locale']]['i_understand_how_coordinate_system_works']
    i_could_draw_a_snowman: config['translations'][config['locale']]['i_could_draw_a_snowman']
    i_could_create_a_ball: config['translations'][config['locale']]['i_could_create_a_ball']
    i_understand_how_events_work: config['translations'][config['locale']]['i_understand_how_events_work']
    i_could_modify_a_new_element: config['translations'][config['locale']]['i_could_modify_a_new_element']
    i_could_create_a_new_element_that_changes_its_place_when_clicked: config['translations'][config['locale']]['i_could_create_a_new_element_that_changes_its_place_when_clicked']
    blockly_lang: config['translations'][config['locale']]['blockly_lang']
    service_name: config['translations'][config['locale']]['service_name']
    execute_code: config['translations'][config['locale']]['execute_code']
    reset_to_defaults: config['translations'][config['locale']]['reset_to_defaults']
    return_to_previous: config['translations'][config['locale']]['return_to_previous']
    abort_code_execution: config['translations'][config['locale']]['abort_code_execution']
    evaluate_btn_tooltip: config['translations'][config['locale']]['evaluate_btn_tooltip']
    evaluate_performance: config['translations'][config['locale']]['evaluate_performance']
    
exports.saveRating = (req, res) ->
  # quick and dirty...
  # (this is not controller stuff)
  er = mongoose.model('ExerciseRating')
  new er(
    eid: req.body.eid
    rating: req.body.rating
    locale: config['locale']
    date: new Date()
  ).save (err, comment, count) ->
    return

  res.send ""

exports.getRatings = (req, res) ->
  # quick and dirty...
  # (this is not controller stuff)
  er = mongoose.model('ExerciseRating')
  er.find {}, (err, results) ->
    console.log(err)
    ratings = []
    results.forEach (r) ->
      ratings.push { eid:r.eid, rating:r.rating, locale:r.locale, date:r.date }

    res.json(ratings)
