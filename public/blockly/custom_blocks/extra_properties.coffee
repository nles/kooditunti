Blockly.Blocks["extra_properties_container"] = init: ->
  @setColour 210
  @appendDummyInput().appendField L.translations['properties']
  @appendStatementInput "STACK"
  @contextMenu = false
  return

Blockly.Blocks["radius_mutator"] = init: ->
  @setColour 210
  @appendDummyInput().appendField L.translations['diameter']
  @setPreviousStatement true
  @setNextStatement true
  @contextMenu = false
  return

Blockly.Blocks["width_mutator"] = init: ->
  @setColour 210
  @appendDummyInput().appendField L.translations['width']
  @setPreviousStatement true
  @setNextStatement true
  @contextMenu = false
  return

Blockly.Blocks["height_mutator"] = init: ->
  @setColour 210
  @appendDummyInput().appendField L.translations['height']
  @setPreviousStatement true
  @setNextStatement true
  @contextMenu = false
  return

Blockly.Blocks["position_mutator"] = init: ->
  @setColour 210
  @appendDummyInput().appendField L.translations['location']
  @setPreviousStatement true
  @setNextStatement true
  @contextMenu = false
  return

Blockly.Blocks["velocity_mutator"] = init: ->
  @setColour 210
  @appendDummyInput().appendField L.translations['acceleration']
  @setPreviousStatement true
  @setNextStatement true
  @contextMenu = false
  return

Blockly.Blocks["color_mutator"] = init: ->
  @setColour 210
  @appendDummyInput().appendField L.translations['color']
  @setPreviousStatement true
  @setNextStatement true
  @contextMenu = false
  return

