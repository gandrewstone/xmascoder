function hexToRgb(hex) {
    var s = hex.substr(hex.search("#")+1,6);
    var bigint = parseInt(s, 16);
    var r = (bigint >> 16) & 255;
    var g = (bigint >> 8) & 255;
    var b = bigint & 255;

    return r + "," + g + "," + b;
}

function hexToRgb2(hex) {
    // Expand shorthand form (e.g. "03F") to full form (e.g. "0033FF")
    var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
    hex = hex.replace(shorthandRegex, function(m, r, g, b) {
        return r + r + g + g + b + b;
    });

    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        red: parseInt(result[1], 16),
        green: parseInt(result[2], 16),
        blue: parseInt(result[3], 16)
    } : null;
}


function toRGBstr(obj) {
    if (typeof obj === 'string')
    {
        if (obj.search("#") >= 0)
            return hexToRgb(obj);
        if (obj == "") return '0,0,0';
        return obj;
    }
    return '0,0,0';
}

Blockly.JavaScript['delay'] = function(block) {
  var value_milliseconds = Blockly.JavaScript.valueToCode(
      block, 'milliseconds', Blockly.JavaScript.ORDER_ATOMIC);
  if (value_milliseconds == '')
    value_milliseconds = 0;

  var code = 'delay(' + value_milliseconds + ');\n';
  return code;
};

Blockly.JavaScript['color_by_name'] = function(block) {
  var dropdown_name = block.getFieldValue('NAME');
  // TODO: Assemble JavaScript into code variable.
  var code = '...';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['color_by_picker'] = function(block) {
  var colour_name = block.getFieldValue('NAME');
  // TODO: Assemble JavaScript into code variable.
  var code = '...';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['color_by_rgb'] = function(block) {
  var value_red = Blockly.JavaScript.valueToCode(block, 'red', Blockly.JavaScript.ORDER_ATOMIC);
  var value_green = Blockly.JavaScript.valueToCode(block, 'green', Blockly.JavaScript.ORDER_ATOMIC);
  var value_blue = Blockly.JavaScript.valueToCode(block, 'blue', Blockly.JavaScript.ORDER_ATOMIC);
  //var code = '{ red: ' + value_red + ', green: ' + value_green + ', blue: ' + value_blue + '}';
  var code = '' + value_red + ', ' + value_green + ', ' + value_blue;
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_ATOMIC];
};

Blockly.JavaScript['setlight'] = function(block) {
  var value_idx = Blockly.JavaScript.valueToCode(block, 'idx', Blockly.JavaScript.ORDER_ATOMIC);
  var value_color = Blockly.JavaScript.valueToCode(block, 'color', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  if (value_idx == '') value_idx=0;
  var code = 'setLight(' + value_idx + ',' + value_color + ');\n';
  return code;
};

Blockly.JavaScript['setlightsto'] = function(block) {
  var value_count = Blockly.JavaScript.valueToCode(block, 'count', Blockly.JavaScript.ORDER_ATOMIC);
  var value_idx = Blockly.JavaScript.valueToCode(block, 'idx', Blockly.JavaScript.ORDER_ATOMIC);
  var value_color = Blockly.JavaScript.valueToCode(block, 'color', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
  if (value_idx == '') value_idx=0;
  if (value_count == '') value_count=0;
  var code = 'setLightsTo(' + value_idx + ',' + value_count + ',' + value_color + ');\n';
  return code;
};

Blockly.JavaScript['fadelights'] = function(block)
{
    var value_count = Blockly.JavaScript.valueToCode(block, 'count', Blockly.JavaScript.ORDER_ATOMIC);
    var value_idx = Blockly.JavaScript.valueToCode(block, 'idx', Blockly.JavaScript.ORDER_ATOMIC);
    var value_fadetime = Blockly.JavaScript.valueToCode(block, 'fadetime', Blockly.JavaScript.ORDER_ATOMIC);
    var value_color = Blockly.JavaScript.valueToCode(block, 'color', Blockly.JavaScript.ORDER_ATOMIC);
    var value_stride = Blockly.JavaScript.valueToCode(block, 'stride', Blockly.JavaScript.ORDER_ATOMIC);

    if (value_idx == '') value_idx=0;
    if (value_count == '') value_count=0;
    if (value_stride == '') value_stride=1;
    var code = 'fadeLights(' + value_idx + ',' + value_count + ',' + value_fadetime + ',' + value_color + ',' + value_stride + ');\n';
    return code;
};

Blockly.JavaScript['rotatelights'] = function(block)
{
    var value_count = Blockly.JavaScript.valueToCode(block, 'count', Blockly.JavaScript.ORDER_ATOMIC);
    var value_idx = Blockly.JavaScript.valueToCode(block, 'idx', Blockly.JavaScript.ORDER_ATOMIC);
    var value_stride = Blockly.JavaScript.valueToCode(block, 'stride', Blockly.JavaScript.ORDER_ATOMIC);
    if (value_idx == '') value_idx=0;
    if (value_count == '') value_count=900;
    if (value_stride == '')  value_stride = 1;
    var code = 'rotateLights(' + value_idx + ',' + value_count + ',' + value_stride + ');\n';
    return code;
};

Blockly.JavaScript['updatelights'] = function(block) {
  var code = 'updateLights();\n';
  return code;
};

Blockly.JavaScript['updatelightsanddelay'] = function(block) {
  var number_delay = block.getFieldValue('delay');
  if (number_delay == '')
    number_delay = 0;
  var code = 'updateLights(); delay(' + number_delay + ');\n';
  return code;
};
