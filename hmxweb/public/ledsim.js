var NUMBULBS = 900;
var BULBSIZE = 9;
var BULBSPERROW = 100;

scriptFeedback = function(report)
{
    var error = document.getElementById('scriptErrors');
    error.innerHTML = report + "\n";
}

function hexToRgbArray(hex)
{
  var s = hex.substr(hex.search("#") + 1, 6);
  var bigint = parseInt(s, 16);
  var r = (bigint >> 16) & 255;
  var g = (bigint >> 8) & 255;
  var b = bigint & 255;

  return [ r, g, b ];
};
function rgbize(r, g, b) { return 'rgb( ' + r + ',' + g + ',' + b + ')'; };
function degToRad(degrees) { return degrees * Math.PI / 180; };

var bulbs = new Uint32Array(NUMBULBS);
var canvas = document.querySelector('#lightShow');
var width = canvas.width;   //= window.innerWidth/4;
var height = canvas.height; //= window.innerHeight;
var ctx = canvas.getContext('2d');
ctx.fillStyle = 'rgb(0, 0, 0)';
ctx.fillRect(0, 0, width, height);

function bulbPos(bulb) {
  return [
    (bulb % BULBSPERROW) * (BULBSIZE + 3) + BULBSIZE / 2,
    (Math.floor(bulb / BULBSPERROW)) * (BULBSIZE + 3) + BULBSIZE / 2 + 5
  ];
}

function colorBulb(bulb, color, fill)
{
    var pos = bulbPos(bulb);
    var oldlw = ctx.lineWidth;
    ctx.lineWidth = 2;
        ctx.strokeStyle = color;
        ctx.beginPath();
        ctx.arc(pos[0], pos[1], BULBSIZE / 2, degToRad(0), degToRad(360), false);
        ctx.stroke();
    if (fill)
    {
        ctx.fillStyle = color;
        ctx.beginPath();
        ctx.arc(pos[0], pos[1], BULBSIZE / 2, degToRad(0), degToRad(360), false);
        ctx.fill();
    }
    ctx.lineWidth = oldlw;
}

print = function(s, waitTime, callback)
{
    var output = document.getElementById('scriptOutput');
    if (waitTime)
    {
        var prior = output.innerHTML;

        output.innerHTML = prior + "<span class='lastLog'>" + s + "</span>" + "<br/>";
        window.setTimeout(function() {
            output.innerHTML = prior + s + "<br/>";
            callback();
        }, waitTime);
    }
    else
    {
        output.innerHTML = output.innerHTML + s + "<br/>";
        callback();
    }
}


function updateLights()
{
    var i;
    for (i = 0; i < NUMBULBS; i++)
    {
        var col = bulbs[i];
        colorBulb(i, rgbize(col >> 16, (col >> 8) & 255, col & 255), true);
    }
}

function setLight(idx, r, g, b)
{
    //console.log('setLight ' + idx + ' ' + r + ' ' + g + ' ' + b);
    if (typeof g == 'undefined')
    {
        colorBulb(idx, r, false);
        if (typeof r == 'undefined')
        {
            scriptFeedback("Error: You did not properly call the 'setLight' function.  Call it with setLight(light number, red, green, blue); or setLight(light number, \"#RRGGBB\");");
            throw("Error: You did not properly call the 'setLight' function.  Call it with setLight(light number, red, green, blue); or setLight(light number, \"#RRGGBB\");");
        }
        var rgb = hexToRgbArray(r);
        bulbs[idx] = (rgb[0] << 16) + (rgb[1] << 8) + rgb[2];
    }
    else
    {
        bulbs[idx] = (r << 16) + (g << 8) + b;
        colorBulb(idx, rgbize(r, g, b), false);
    }
}

function setLights(idx, count, arr)
{
    var i;

    if ((typeof idx == 'undefined')||(typeof count == 'undefined')||(typeof arr == 'undefined'))
    {
        scriptFeedback("Error: You did not properly call the 'setLights' function.  Call it with setLights(start light number, number of lights, Uint32Array);");
        throw("Error: You did not properly call the 'setLights' function.  Call it with setLights(start light number, number of lights, Uint32Array);");
    }

    if (count > arr.length)
    {
        count = arr.length;
    }

    for (i = 0; i < count; i++)
    {
        var col = arr[i];
        setLight(idx + i, col >> 16, (col >> 8) & 255, col & 255);
    }
}

function setManyLights(idx, count, r, g, b)
{
    var i;

    if ((typeof idx == 'undefined')||(typeof count == 'undefined')||(typeof r == 'undefined'))
    {
        scriptFeedback("Error: You did not properly call the 'setManyLights' function.  Call it with setManyLights(start light number, number of lights, red, green, blue); or setManyLights(start light number, number of lights, \"#RRGGBB\");");
        throw("Error: You did not properly call the 'setManyLights' function.  Call it with setManyLights(start light number, number of lights, red, green, blue); or setManyLights(start light number, number of lights, \"#RRGGBB\");");

    }
  for (i = 0; i < count; i++) {
    setLight(idx + i, r, g, b);
  }
}

function setLightsTo(idx, count, r, g, b)
{
    var i;

    if ((typeof idx == 'undefined')||(typeof count == 'undefined')||(typeof r == 'undefined'))
    {
        scriptFeedback("Error: You did not properly call the 'setLightsTo' function.  Call it with setLightsTo(start light number, number of lights, red, green, blue); or setLightsTo(start light number, number of lights, \"#RRGGBB\");");
        throw("Error: You did not properly call the 'setLightsTo' function.  Call it with setLightsTo(start light number, number of lights, red, green, blue); or setLightsTo(start light number, number of lights, \"#RRGGBB\");");

    }
  for (i = 0; i < count; i++) {
    setLight(idx + i, r, g, b);
  }
}


fadeLights = function(idx, count, fadeCount, r, g, b, stride)
{
    var i,j;
    var step = 1;

    if ((typeof idx == 'undefined')||(typeof count == 'undefined')||(typeof fadeCount == 'undefined'))
    {
        scriptFeedback("Error: You did not properly call the 'fadeLights' function.  Call it with fadeLights(start light number, number of lights, fade time in 10ms steps, red, green, blue, stride); or fadeLights(start light number, number of lights, fade time in 10ms steps, \"#RRGGBB\", stride);");
        throw("Error: You did not properly call the 'fadeLights' function.  Call it with fadeLights(start light number, number of lights, fade time in 10ms steps, red, green, blue, stride); or fadeLights(start light number, number of lights, fade time in 10ms steps, \"#RRGGBB\", stride);");
    }

    if (typeof r == 'string')
    {
        var rgb = hexToRgbArray(r);
        stride = g;
        r = rgb[0];
        g = rgb[1];
        b = rgb[2];
    }

    if (typeof stride != 'undefined') step = stride;
    if (typeof b == 'undefined')
    {
        if (typeof g != 'undefined') step = g;
    }

    for (j=0,i = 0; j < count; j++,i+=step)
    {
        setLight(idx + i, r, g, b);
    }
}

function newLedArray(count)
{
    var arr = [];
    for(var i=0;i<count;i++)
        arr.push(0);
    return arr;
}

function delay(milliseconds, callback)
{
    //    console.log("delay " + milliseconds);
    if (typeof milliseconds == 'undefined')
    {
        scriptFeedback("Error: You forgot to pass a number to the 'delay' function. For example, 'delay(500);' waits for 1/2 second.");
        throw("Error: You forgot to pass a number to the 'delay' function. For example, 'delay(500);' waits for 1/2 second.");
        milliseconds = 0;
    }
    updateLights();
    window.setTimeout(callback, milliseconds);
}


var delayUntilStart = 0;
function delayUntil(milliseconds, callback)
{
    if ((typeof milliseconds == 'undefined') || (milliseconds <= 0))
    {
        scriptFeedback("Error: You forgot to pass a number to the 'delay' function. For example, 'delay(500);' waits for 1/2 second.");
        throw("Error: You forgot to pass a number to the 'delay' function. For example, 'delay(500);' waits for 1/2 second.");
        milliseconds = 0;
    }
    updateLights();
    var now = new Date().getTime();
    var wait = (delayUntilStart+milliseconds) - now;
    if (wait < 0) wait = 0;
    window.setTimeout(callback, wait);
}

Number.prototype.mod = function (n) {
  return ((this % n) + n) % n;
};

rotateLights = function(start,count,stride)
{
    if ((start + count) > NUMBULBS) count = (NUMBULBS-start);
    if (count <= 0) return;
    if (stride == 0) return;
    var old = new Uint32Array(count);
    for (var i=0, j=0; i < count; i++, j+=Math.abs(stride))
    {
        var pos = j.mod(count) + start;
        old[i] = bulbs[pos];
    }

    for (var i=0,j=stride; i < count; i++,j+=Math.abs(stride))
    {
        var pos = j.mod(count) + start;
        bulbs[pos] = old[i];
        colorBulb(pos, old[i], false);
    }
}


function random(amt)
{
    if (typeof amt == 'undefined')
    {
        scriptFeedback("Error: You forgot to pass a number to the 'random' function. For example, 'var i = random(50);' returns a value from 0 to 49.");
        throw("Error: You forgot to pass a number to the 'random' function. For example, 'var i = random(50);' returns a value from 0 to 49.");
    }
    return Math.floor((Math.random() * amt));
}

var jsLedSimInitFunc = function(interpreter, scope)
{
    // interpreter.setProperty(scope, 'url', String(location));

    interpreter.setProperty(scope, 'print', interpreter.createAsyncFunction(print));
    interpreter.setProperty(scope, 'rotateLights', interpreter.createNativeFunction(rotateLights));

    var wrapper = function(count) { return newLedArray(count); };
    interpreter.setProperty(scope, 'newLedArray', interpreter.createNativeFunction(wrapper));

    var wrapper = function(idx, r, g, b) { return setLight(idx, r, g, b); };
    interpreter.setProperty(scope, 'setLight', interpreter.createNativeFunction(wrapper));

    var wrapper = function(idx, count, arr) { return setLights(idx, count, arr); };
    interpreter.setProperty(scope, 'setLights', interpreter.createNativeFunction(wrapper));

    var wrapper = function(idx, count, r, g, b) {
        return setManyLights(idx, count, r, g, b);
    };
    interpreter.setProperty(scope, 'setManyLights', interpreter.createNativeFunction(wrapper));
    var wrapper = function(idx, count, r, g, b) {
        return setManyLights(idx, count, r, g, b);
    };
    interpreter.setProperty(scope, 'setLightsTo', interpreter.createNativeFunction(wrapper));

    var wrapper = function(idx, count, fadeCount, r, g, b, stride) {
        return fadeLights(idx, count, fadeCount, r, g, b, stride);
    };
    interpreter.setProperty(scope, 'fadeLights', interpreter.createNativeFunction(wrapper));

    wrapper = function() { return updateLights(); };
    interpreter.setProperty(scope, 'updateLights', interpreter.createNativeFunction(wrapper));

    interpreter.setProperty(scope, 'delay', interpreter.createAsyncFunction(delay));
    interpreter.setProperty(scope, 'delayUntil', interpreter.createAsyncFunction(delayUntil));
    interpreter.setProperty(scope, 'random', interpreter.createNativeFunction(random));
};

var myInterpreter;

function abortScript()
{
    myInterpreter.abort = true;
}

function simulateScript(scr)
{
    console.log("running: " + scr);
    var wasThereAnError;
    var count = 0;
    if (myInterpreter) // stop the prior run
    {
        myInterpreter.abort = true;
        clearTimeout(myInterpreter);
    }

    var output = document.getElementById('scriptOutput');
    output.innerHTML = "";
    delayUntilStart = new Date().getTime();
    myInterpreter = new Interpreter(scr, jsLedSimInitFunc);
    myInterpreter.abort = false;
    var step = function(interp)
    {
        try {
            if (interp.run()) // TBD: enhance interpreter to step multiple times for speed: .step(100)
            {
                wasThereAnError = "Time: " + (new Date().getTime() - delayUntilStart)  + "ms"; //           Step: " + count;
                count += 1;
                if (!interp.abort) window.setTimeout(function() {step(interp);}, 0);
                else wasThereAnError = "Script aborted";
            } else {
                wasThereAnError = "Script executed successfully!";
                console.log("done");
            }
        } catch (err)
        {
            wasThereAnError = err.message;
        }
        if (wasThereAnError)
        {
            var scriptError = document.querySelector('#scriptErrors');
            if (scriptError) {
                scriptError.innerHTML = wasThereAnError;
            }
        }
    };
    step(myInterpreter);
}
