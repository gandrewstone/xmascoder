//23456789abcdef

setManyLights(0,500,'#000000');
updateLights();
// Set a light color.  Pass index and color.  Color can be in web notation or RGB 3 numbers
setLight(0,'#ff0000');
setLight(1,255,255,255);
// call updateLights to actually change the light bulbs
updateLights();
// delay for N milliseconds so people can perceive your changes
delay(5000);

// set lots of lights to a single color
// setManyLights (starting index, count, color)
setManyLights(0,500, 255,255,255);
delay(5000);
// Note that the circles aren't filled in!
// That's because we forgot to tell the bulbs to change.
// This is a simulator feature to help you debug your code.
// Let's updateLights() now:
updateLights();
delay(1000);

// Normal javascript of course works:
var i, j;
for(j=0;j<20;j++)
{
  for(i=0;i<500;i++)
  {
    setLight(i,(j*i*10)%255,0,0);
  }
updateLights();
delay(100);
}
// That's all you need to know!
