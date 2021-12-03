Blockly.Blocks['delay'] = {
  init: function() {
    this.appendValueInput("milliseconds")
        .setCheck("Number")
        .setAlign(Blockly.ALIGN_RIGHT)
        .appendField("Delay for");
    this.appendDummyInput()
        .appendField("milliseconds");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
 this.setTooltip("pause for N milliseconds");
 this.setHelpUrl("pauses for N milliseconds.  There are 1000 milliseconds (ms) in a second. Use 50 to achieve good animation.  That will give you 20 changes per second");
  }
};

Blockly.Blocks['color_by_name'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(new Blockly.FieldDropdown([["red","COLOR_RED"], ["green","COLOR_GREEN"], ["white","COLOR_WHITE"]]), "NAME");
    this.setOutput(true, "color");
    this.setColour(20);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.Blocks['color_by_picker'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("color")
        .appendField(new Blockly.FieldColour("#ff0000"), "NAME");
    this.setOutput(true, "color");
    this.setColour(20);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.Blocks['color_by_rgb'] = {
  init: function() {
    this.appendValueInput("red")
        .setCheck("Number")
        .appendField("red");
    this.appendValueInput("green")
        .setCheck("Number")
        .appendField("green");
    this.appendValueInput("blue")
        .setCheck("Number")
        .appendField("blue");
    this.setInputsInline(true);
    this.setOutput(true, "color");
    this.setColour(20);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.Blocks['setlight'] = {
  init: function() {
    this.appendValueInput("idx")
        .setCheck("Number")
        .appendField("set bulb number");
    this.appendValueInput("color")
        .setCheck(["color", "Colour"])
        .appendField("to color");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.Blocks['setlightsto'] = {
  init: function() {
    this.appendValueInput("count")
        .setCheck("Number")
        .setAlign(Blockly.ALIGN_CENTRE)
        .appendField("set");
    this.appendDummyInput()
        .appendField("bulbs");
    this.appendValueInput("idx")
        .setCheck("Number")
        .appendField("starting at");
    this.appendValueInput("color")
        .setCheck(["color", "Colour"])
        .appendField("to color");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
 this.setTooltip("assigns the same color to a bunch of bulbs");
 this.setHelpUrl("");
  }
};

Blockly.Blocks['rotatelights'] = {
  init: function() {
    this.appendValueInput("count")
        .setCheck("Number")
        .setAlign(Blockly.ALIGN_CENTRE)
        .appendField("rotate");
    this.appendDummyInput()
        .appendField("bulbs");
    this.appendValueInput("idx")
        .setCheck("Number")
        .appendField("starting at");
    this.appendValueInput("stride")
        .setCheck("Number")
        .appendField("with stride");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
 this.setTooltip("assigns the same color to a bunch of bulbs");
 this.setHelpUrl("");
  }
};


Blockly.Blocks['fadelights'] = {
  init: function() {
    this.appendValueInput("count")
        .setCheck("Number")
        .setAlign(Blockly.ALIGN_CENTRE)
        .appendField("fade");
    this.appendDummyInput()
        .appendField("bulbs");
    this.appendValueInput("idx")
        .setCheck("Number")
        .appendField("starting at");
    this.appendValueInput("color")
        .setCheck(["color", "Colour"])
        .appendField("to color");
    this.appendValueInput("fadetime")
        .setCheck("Number")
          .appendField("over time");
    this.appendValueInput("stride")
        .setCheck("Number")
        .appendField("with stride");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
 this.setTooltip("fades a bunch of bulbs to the same color");
 this.setHelpUrl("");
  }
};


Blockly.Blocks['updatelights'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("update all bulbs");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
 this.setTooltip("actually show all the changes you made");
 this.setHelpUrl("");
  }
};

Blockly.Blocks['updatelightsanddelay'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("Show lights for");
    this.appendDummyInput()
        .appendField(new Blockly.FieldNumber(50, 0, 10000, 1), "delay")
        .appendField("milliseconds");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};
