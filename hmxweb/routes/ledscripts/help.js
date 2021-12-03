var numLeds = 900;
var readingTime = 20;

function clear()
{
   setLightsTo(0,numLeds,'#000000');
   updateLights();
}

// Set lots of lights to a single color (in this case black)
print("Note that the prior light colors are NOT cleared from the tree.  If you want to start cleanly, set them all to black! Like this...", 200*readingTime);
setLightsTo(0,numLeds,'#000000');
delay(100*readingTime);

setLightsTo(0,numLeds,0,0,30);
delay(100);
print("Note that low color values may be barely visible on your screen, because your eye is adjusted to a bright room.", 100*readingTime);
print("This may look black on your screen but is an awesome deep blue shown as LEDs on a dark night!", 200*readingTime);

setLightsTo(0,numLeds,'#0A0000');
setLight(240, 50, 0, 0);
setLight(241, 100, 0, 0);
setLight(260, 100, 0, 0);
setLight(261, 200, 0, 0);
setLight(340, 0, 0, 50);
setLight(341, 0, 0, 100);
setLight(360, 0, 0, 100);
setLight(361, 0, 0, 200);
updateLights();
print("Human eyes are logarithmic.  They see double the intensity as a linear increase.  So changing the color from 10 to 20 is the same visual difference as 100 to 200!  Look at these 2 blocks of 4 pixels", 200*readingTime);

clear();

// Set a light color.  Pass index and color.  Color can be in web notation or RGB 3 numbers
setLight(420,'#ff0000');
setLight(455,255,255,255);
print("Now I will set 2 lights.  Note up in the simulation that these are circles", 300*readingTime);

print("Now by calling delay(), delayUntil(), or updateLights(), commands will be sent to the tree, and in simulation the circles become disks.", 200*readingTime);
print("Do not use the print to delay, like I am in this demo, because it is for debugging only -- it only delays in SIMULATION", 200*readingTime);
// Call updateLights to actually change the light bulbs
updateLights();
// Delay for N milliseconds so people can perceive your changes
print("Like this!", 10*readingTime);
delay(200*readingTime);

print("A circle means that the bulb color has been assigned but not sent to the tree.  You can think of it like all the instructions you write happen at the same time (and instantly), until a delay slows things down.", 300*readingTime);
print("This lets you do complex stuff which will seem to happen instantly.  Like this!", 300*readingTime);
for(j=0;j<50;j++)
{
  for(i=0;i<numLeds;i++)
  {
    setLight(i,(j*i*10)%255,0,0);
  }
updateLights();
delay(100);
}

// Smooth fade many LEDs from the LED's current color to a new color.  Simulation will not show the fade.
// fadeLights(start, count, fade time in 10 ms steps, color red, green, blue, stride -- 3 means change every 3rd led)
// So by calling this 3 times with slightly different starting positions, we cover all the LEDs with a pattern of 3 colors.
print("You can fade lights from the current color to another color, over some time.  But this will just set the color in simulation.", 2000);
fadeLights(0,numLeds/5, 2000, 255,0,80, 5);
fadeLights(1,numLeds/5, 2000, 0,255,50, 5);
fadeLights(2,numLeds/5, 2000, 100,0,255, 5);
fadeLights(3,numLeds/5, 2000, 100,100,0, 5);
fadeLights(4,numLeds/5, 2000, 0,200,200, 5);

delay(200*readingTime);

// Normal javascript of course works:
print("You can rotate the colors shown on the bulbs", 100*readingTime);
var i, j;
for(j=0;j<200;j++)
{
    rotateLights(0,450, 1);  // rotate (marquee) 400 lights starting at light 0, step by 1
    rotateLights(450,450,-2);  // rotate (marquee) 400 lights starting at light 0, step by 1
    updateLights();
    delay(100);
    if (j==100) print("Its more efficient to call this function rather than implement your own rotation", 1);
}

print("If you want to synchronize your script with some external events (like a song), use delayUntil().  This is like delay, but the parameter is the stopwatch time from the start of the script!", 100*readingTime);
print("If you watch the timer above, you will see that this script ends at exactly 100 seconds", 100*readingTime);
delayUntil(100000);
