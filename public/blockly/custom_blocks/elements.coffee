Blockly.Blocks["coordinate_array_simple"] = init: ->
  coordPlaces = [["1","1"],["2","2"],["3","3"],["4","4"],["5","5"],
                ["6","6"],["7","7"],["8","8"],["9","9"],["10","10"],
                ["11","11"],["12","12"],["13","13"],["14","14"]]
  @setColour(230);
  @appendDummyInput("position").setAlign(Blockly.ALIGN_RIGHT)
    .appendField new Blockly.FieldDropdown($.merge([["X", "X"]],coordPlaces)), "xpos"
    .appendField new Blockly.FieldDropdown($.merge([["Y", "Y"]],coordPlaces)), "ypos"
  @setOutput(true, "Array");
  @setInputsInline(true);

Blockly.JavaScript["coordinate_array_simple"] = (block) ->
  xpos = block.getFieldValue("xpos")
  xpos = if xpos is "X" then 1 else xpos
  ypos = block.getFieldValue("ypos")
  ypos = if ypos is "Y" then 1 else ypos
  return ["["+xpos+","+ypos+"]",Blockly.JavaScript.ORDER_ATOMIC]

Blockly.Blocks["coordinate_array"] = init: ->
  @setColour 230
  @appendValueInput("xcoord").setCheck("Number").appendField "X"
  @appendValueInput("ycoord").setCheck("Number").appendField "Y"
  @setOutput true, "Array"
  #@setInputsInline true
  @setTooltip ""
  return

Blockly.JavaScript["coordinate_array"] = (block) ->
  value_xcoord = Blockly.JavaScript.valueToCode(block, "xcoord", Blockly.JavaScript.ORDER_ATOMIC)
  value_ycoord = Blockly.JavaScript.valueToCode(block, "ycoord", Blockly.JavaScript.ORDER_ATOMIC)
  code = "[" + value_xcoord + "," + value_ycoord + "]"
  [code,Blockly.JavaScript.ORDER_ATOMIC]

Blockly.Blocks["get_element_property"] = init: ->
  @setColour(230);
  properties = [[L.translations['x_coordinate'],"xcoord"],[L.translations['y_coordinate'],"ycoord"]]
  @appendDummyInput().setAlign(Blockly.ALIGN_LEFT).appendField L.translations['return_for_element_before']
    .appendField new Blockly.FieldDropdown(CodeArea.settableElementsDropdownValues()), "element"
  @appendDummyInput().setAlign(Blockly.ALIGN_RIGHT).appendField L.translations['return_for_element_after']
    .appendField new Blockly.FieldDropdown($.merge([[L.translations['select_brackets'],"0"]],properties)), "property"
  @setOutput(true, "Array");
  #@setInputsInline(false);

Blockly.JavaScript["get_element_property"] = (block) ->
  element = block.getFieldValue("element")
  element = if element is "0" then null else element
  property = block.getFieldValue("property")
  property = if property is "0" then null else property
  return ["getElementProperty('"+element+"','"+property+"')",Blockly.JavaScript.ORDER_ATOMIC]

Blockly.Blocks["text_element"] =
  init: ->
    @setColour 120
    @appendValueInput("text").setAlign(Blockly.ALIGN_RIGHT).appendField L.translations['draw_text']
      .setCheck(['String','Number'])
    @setPreviousStatement true
    @setNextStatement true
    @setMutator(new Blockly.Mutator(['position_mutator'])); # ,'color_mutator' TODO
    @extraProperties = []
Blockly.Blocks["text_element"] = $.extend Blockly.Blocks["text_element"], BlocklyExtraPropertiesPatch._i()

Blockly.JavaScript["text_element"] = (block) ->
  value_text = Blockly.JavaScript.valueToCode(block, "text", Blockly.JavaScript.ORDER_ATOMIC)
  value_text = "''" if value_text == ""
  properties = JSON.stringify
    position: eval Blockly.JavaScript.valueToCode(block, "position_mutator", Blockly.JavaScript.ORDER_ATOMIC)
  code = "createText("+value_text+",'"+properties+"');\n"
  code

elementBase = (text,mutators) ->
  init: ->
    @setColour 120
    #@appendValueInput("name").appendField "Luo nelikulmio"
    @appendDummyInput()
      .appendField text
      .appendField(new Blockly.FieldTextInput(L.translations['called_brackets']), "name")
    @setPreviousStatement true
    @setNextStatement true
    @setTooltip ""
    @setMutator(new Blockly.Mutator(mutators)); # ,'color_mutator' TODO
    @extraProperties = []

Blockly.Blocks["rectangle_element"] = elementBase(L.translations['create_rectangle'],['position_mutator','width_mutator','height_mutator'])
Blockly.Blocks["rectangle_element"] = $.extend Blockly.Blocks["rectangle_element"], BlocklyExtraPropertiesPatch._i()

Blockly.Blocks["circle_element"] = elementBase(L.translations['create_ball'],['position_mutator','radius_mutator'])
Blockly.Blocks["circle_element"] = $.extend Blockly.Blocks["circle_element"], BlocklyExtraPropertiesPatch._i()

Blockly.Blocks["small_circle_element"] = elementBase(L.translations['create_small_ball'],['position_mutator','radius_mutator'])
Blockly.Blocks["small_circle_element"] = $.extend Blockly.Blocks["small_circle_element"], BlocklyExtraPropertiesPatch._i()

Blockly.Blocks["medium_circle_element"] = elementBase(L.translations['create_medium_ball'],['position_mutator','radius_mutator'])
Blockly.Blocks["medium_circle_element"] = $.extend Blockly.Blocks["medium_circle_element"], BlocklyExtraPropertiesPatch._i()

Blockly.Blocks["big_circle_element"] = elementBase(L.translations['create_large_ball'],['position_mutator','radius_mutator'])
Blockly.Blocks["big_circle_element"] = $.extend Blockly.Blocks["big_circle_element"], BlocklyExtraPropertiesPatch._i()

Blockly.Blocks["edit_element"] =
  init: ->
    @setColour 120
    @appendDummyInput("name")
      .appendField L.translations['alter_element']
      .appendField new Blockly.FieldDropdown(CodeArea.settableElementsDropdownValues), "element"
    @setPreviousStatement true
    @setNextStatement true
    @setTooltip ""
    @setMutator(new Blockly.Mutator(['position_mutator','width_mutator','height_mutator','radius_mutator', 'velocity_mutator'])); # ,'color_mutator' TODO
    @extraProperties = []
Blockly.Blocks["edit_element"] = $.extend Blockly.Blocks["edit_element"], BlocklyExtraPropertiesPatch._i()

buildPropertiesObjectAsString = (pairs) ->
  eo = "{"
  keyCount = (k for own k of pairs).length
  i = 0
  for k, v of pairs
    v = "null" if v? && v is ""
    eo+= ""+k+": "+v
    eo+= ", " if i isnt keyCount - 1
    i++
  eo+= "}"
  return eo

elementBlocksJavascript = (block) ->
  inputs = {}
  for i, v of block.inputList
    name = v.name.replace("_mutator","")
    switch name
      when "position","width","height","radius","color","velocity" # REFACTOR: These into a global list of allowed properties
        inputs[name] = Blockly.JavaScript.valueToCode(block, v.name, Blockly.JavaScript.ORDER_ATOMIC)
  # get name from text field
  inputs['name'] = "'"+block.getFieldValue("name")+"'" if block.type isnt "edit_element"
  # define type by block
  inputs['type'] = "'rectangle'" if block.type is "rectangle_element"
  inputs['type'] = "'circle'" if block.type.indexOf("circle_element") != -1
  # set few exeptions
  unless inputs['radius']
    inputs['radius'] = 20 if block.type is "small_circle_element"
    inputs['radius'] = 60 if block.type is "medium_circle_element"
    inputs['radius'] = 100 if block.type is "big_circle_element"

  # edit field has element dropdown
  element = block.getFieldValue("element")
  # property object as string
  pos = buildPropertiesObjectAsString inputs
  if inputs.radius?
    # collects an error only if we have it defined (see for example Vars.errorCollector)
    # otherwise passes without errors
    Errors.collect('createElement_variable', {values: {radius:inputs.radius}, block: block})
  if block.type is 'edit_element'
  then code = "editElement('"+element+"',"+pos+");\n";
  else code = "createElement("+pos+");\n"
  code

Blockly.JavaScript["rectangle_element"] = elementBlocksJavascript
Blockly.JavaScript["circle_element"] = elementBlocksJavascript
Blockly.JavaScript["small_circle_element"] = elementBlocksJavascript
Blockly.JavaScript["medium_circle_element"] = elementBlocksJavascript
Blockly.JavaScript["big_circle_element"] = elementBlocksJavascript
Blockly.JavaScript["edit_element"] = elementBlocksJavascript
