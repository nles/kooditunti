Blockly.Blocks["circle_element_simple"] = init: ->
  @setColour 200
  @appendDummyInput().appendField L.translations['create_ball']
  @setPreviousStatement true
  @setNextStatement true
  @setTooltip ""
  return

Blockly.JavaScript["circle_element_simple"] = (block) ->
  code = "createBall();\n"
  code

