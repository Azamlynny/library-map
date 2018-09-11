/* Created by Adam Zamlynny
   azamlynny@hotmail.com
   github.com/Azamlynny
*/

import java.util.*; // for ArrayList and list
import java.io.*; // for Calendar

Information info = new Information();
Map map;
KeyTracker keyTracker = new KeyTracker();
MouseTracker mouseTracker = new MouseTracker();

Calendar calendar = Calendar.getInstance();
TimeZone tz = TimeZone.getTimeZone("GMT-04");// EST East Coast of America

void settings(){ // This runs before void setup()
  size(displayWidth, displayHeight); //Sets the size to the resolution of the computer so that later on everything is scaled to it.
}
  
void setup(){
  calendar.setTimeZone(tz); // Changes timezone from GMT to EST
  map = new Map(); // Constructor needs to be called here so that displayWidth and displayHeight can be used to find the correct aspect ratio for the resolution
  
  Input inputData = new Input(); // Constructor inputs MapData.txt and makes objects from it
}

void draw(){
  background(255);
  map.drawMap();
}

void keyPressed(){
  keyTracker.checkKeyPress();
}

void keyReleased(){ // keyReleased() is used so that buttons may be held down and then the mouse can click in combination.
  keyTracker.resetKey(); // Gives the key value a value of Null so that key is not equal to a character when not being pressed.
}

void mousePressed(){
  mouseTracker.checkMousePress();
}

void mouseWheel(MouseEvent event) {
  mouseTracker.scroll(event.getCount()); 
}

void exit() { 
  Output output = new Output("MapData.txt"); //Constructor outputs the objects data to MapData.txt, which will be in the same directory as the program.
  
  System.exit(0); //Makes sure the file closes because otherwise it will run in the background and create lag on the computer
} 