/* //<>// //<>//
Cole, Peyton, and Eliza
 
 Team Gerald
 Maze Generation Project
 */

import java.util.Map;

boolean gen, menuing;
int prevDirection, count;
int startTime = 0, waitTime = 30000;
GridCoord currCoord;
Player player = new Player(20, height/2);
ArrayList<GridCoord> fullGrid = new ArrayList<GridCoord>();
ArrayList<Integer> checkLater = new ArrayList<Integer>();
int currentRate = 60;
float currentPlace = 1;
int startPointY = (int(random(2, 49)));
float rndR = random(0, 255), rndG = random(0, 255), rndB = random(0, 255);
float scaled;
PImage img, img2;
boolean rainbowing = false;
int rainbow = 0;
Menu fullmenu;
float Idontcare, sliderRect = 0;
boolean clickable = false;

void setup() {
  size(900, 700);  
  fullmenu = new Menu();
  menuing = true;
  resetGrid();
  mazeSetup();
  img = loadImage("welcometotheinternetsayscole.jpeg");
  img2 = loadImage("Joke.jpg");
  fill(200, 200, 200);//make grey(increase all at same rate to make lighter)
  textSize(50);//make text small
  text("joke", 0, 850);//display joke in bottom left corner
}
void draw() {
  scaled = map(abs(width/2 - mouseX), 0, 450, 0, 48);
  if (player.x > 800) {//if player finishes the maze
    rainbowing = true;//activate rainbow
    startTime = millis();
  } else {//otherwise
    rainbowing = false;//no rainbow :(
  }
  /*
    CHO WANTS PARTIAL CREDIT FOR THESE LINES TO SETUP THE MAZE GENERATION ANIMATION GIVE HIM CREDIT \/ \/ 
   */
  if (currentRate < 60) {
    currentRate++;
    frameRate(currentRate);
  } else {
    currentPlace += .1;
  }
  /* 
   OKAY CHO DOESN'T WANT CREDIT ANYMORE THAT IS ALL KTHXBAI
   */
  for (int i=0; i < fullGrid.size(); i++) {
    if (fullGrid.get(i).on == true && player.x > fullGrid.get(i).xLoc-5 && player.x < fullGrid.get(i).xLoc+19 && player.y < fullGrid.get(i).yLoc+19 && player.y > fullGrid.get(i).yLoc-5 || player.x < 0 || player.y < 0 || player.y > height) {
      player.x = player.prevX;
      player.y = player.prevY;
    }
  }
  background(255);
  if (gen) {
    GridCoord coord = currCoord;
    for (int i = 0; i < currentPlace; i++) {
      if (checkLater.size() == 0) {
        break;
      } else {
        currCoord = mazeGenDraw(coord);
        coord = currCoord;
      }
    }
  }
  if (checkLater.size() == 0 && gen) {
    mazeGenEnd();
    gen = false;
  }
  noStroke();
  if (menuing) {
    fullmenu.display();
  } else {
    //Display Maze Grid
    rectMode(CORNER);
    for (int i = 0; i < fullGrid.size(); i++) {
      fullGrid.get(i).display();
    }
    //Dis-player
    player.drawLoop();
    fill(0);
    rect(0, 0, 100, 50);
  textSize(35);
  fill(255);
  text("Menu", 0, 35);
  }
  if (rainbowing) {
    imageMode(CENTER);//move image to center
    image(img, width/2, height/2);
    textSize(scaled);
    fill(rainbower(rainbow, 0), rainbower(rainbow, 2), rainbower(rainbow, 4));
    text("Y", (width/2)-(scaled*3)-25, height/2);
    fill(rainbower(rainbow+30, 0), rainbower(rainbow+30, 2), rainbower(rainbow+30, 4));
    text("o", (width/2)-(scaled*2)-25, height/2);
    fill(rainbower(rainbow+60, 0), rainbower(rainbow+60, 2), rainbower(rainbow+60, 4));
    text("u", (width/2)-scaled-25, height/2);
    fill(rainbower(rainbow+90, 0), rainbower(rainbow+90, 2), rainbower(rainbow+90, 4));
    text("W", (width/2)+scaled+25, height/2);
    fill(rainbower(rainbow+120, 0), rainbower(rainbow+120, 2), rainbower(rainbow+120, 4));
    text("i", (width/2)+(scaled*2)+35, height/2);
    fill(rainbower(rainbow+180, 0), rainbower(rainbow+180, 2), rainbower(rainbow+180, 4));
    text("n", (width/2)+(scaled*3)+25, height/2);
    rainbow++;
    /*if (millis() - float(startTime) < waitTime) {
      rainbowing = false;
      player.x = 50;
      player.y = width/2;
      resetGrid();
      mazeSetup();
    }
    */
  }

  if (mouseX < 15 && mouseY > height-15) {//if mouse is in bottom left coorner(this if statment if cole's code)
    textSize(scaled);//make the textSize bigger the farther from the middle
    textAlign(CENTER);//move text to center
    fill(rndR, rndG, rndB);//fill with random colors once
    text("Would you like to hear a joke?", width/2, height/2);//displays text
    text("Hold something", width/2, height/2+50);
    if (keyPressed == true) {
      imageMode(CENTER);//move image to center
      img2.resize(width, height);//make the image take up the entire screen
      image(img2, width/2, height/2);//display meme from prequalmemes
    }
  }
  if (fullmenu.options == true) {//if in the options menu(slider)
    rectMode(CENTER);//set rectMode to center
    fill(174, 174, 174);//make grey
    rect(width/2, height/2, 900, 30);//draw a horizontal rect across the screen in the middle
    fill(255, 255, 255);//make black
    text("Straightness", width/2-130, 50);
    if (clickable == true) {
      Idontcare = map(mouseX, 0, 900, 0, 100);//scale mouseX to the hardness of the maze
      rect(mouseX, height/2, 70, 50);//draw rect at mouseX on a horizontal line in the middle
      text(Idontcare, mouseX-50, height/2-50);//display the number above slider
      sliderRect = mouseX;
    } else {
      Idontcare = map(sliderRect, 0, 900, 0, 100);//scale mouseX to the hardness of the maze
      rect(sliderRect, height/2, 70, 50);//draw rect at mouseX on a horizontal line in the middle
      text(Idontcare, sliderRect-50, height/2-50);//display the number above slider
    }
  }
}

void keyReleased() {//if any key is released
  player.keyLoop(false);
}
void keyPressed() {//if any key is pressed
  player.keyLoop(true);
}

void mousePressed() {
  if (menuing) {
    fullmenu.keyPressLoop();
  }
  clickable = true;//set clickable equal to true
  if((mouseX <= 100 && mouseX >= 0) && (mouseY <= 50 && mouseY >= 0)){
    menuing = true;
    fullmenu.menu = true;
    fullmenu.options = false;
    fullmenu.controls = false;
    fullmenu.start = false;
    player.x = 50;
    player.y = width/2;
  }
}

void mouseReleased() {
  clickable = false;//set clickable equal to false
}
/* 
 Peyton Tanzillo's Code
 */
//The full function for generating a maze
void mazeSetup() {
  //Create a coordinate for reference so we can call the correct values
  currCoord = new GridCoord(1, startPointY, false);
  //Get the entrance coord and make it false
  fullGrid.get(currCoord.XYtoIndex()).on = false;
  //Get the coord to the right of that coord and make it false
  currCoord.x += 1;
  fullGrid.get(currCoord.XYtoIndex()).on = false;
  //Add that index to the "check later" list in order to revisit and see if it can go in a new direciton.
  checkLater.add(currCoord.XYtoIndex());
  //Set the inital "previous direction" to 3, as it came from the West (N:0 E:1 S:2 W:3)
  prevDirection = 3;
  gen = true;
  frameRate(1);
  currentRate = 1;
  currentPlace = 1;
}

void mazeGenEnd() {
  //Create a list of possible exits based on if the space at x:49 is a wall or not.
  IntList exits = new IntList();
  GridCoord exitHelp = new GridCoord(49, 2, false);
  for (int i = 2; i < 50; i++) {
    exitHelp.y = i;
    if (!(fullGrid.get(exitHelp.XYtoIndex()).on)) {
      exits.append(exitHelp.XYtoIndex());
    }
  }

  //Once that list is generated, get a random number in that list and make that the exit.
  exitHelp = fullGrid.get(exits.get(int(random(0, exits.size()))));
  exitHelp.x += 1;
  fullGrid.get(exitHelp.XYtoIndex()).on = false;
}

//Change the direction that the pice just went into a direction that the piece came from
int direcToPrev(int direction) {
  if (direction > 1) {
    return direction -= 2;
  } else {
    return direction += 2;
  }
}

//Reset the grid to a full block
void resetGrid() {
  fullGrid.clear();
  for (int i = 0; i <= 51; i++) {
    for (int j = 0; j <= 51; j++) {
      if ((i == 0) || (j == 0) || (i == 51) || (j == 51)) {
        fullGrid.add(new GridCoord(j, i, false));
      } else {
        fullGrid.add(new GridCoord(j, i, true));
      }
    }
  }
}

GridCoord mazeGenDraw(GridCoord coord) {
  //Generate a direction for the cell to go
  int direction = coord.whichDirection(prevDirection);
  //If it generates any direction (4 returns when there is no direction it can go)
  if (direction != 4) {
    //Get the previous direction
    prevDirection = direcToPrev(direction);
    //Move the focus in the specified direction
    coord = coord.goDirection(direction);
    //Set this new spot to be empty
    fullGrid.get(coord.XYtoIndex()).on = false;
  } else {
    //Set the previous direction to have none
    prevDirection = 4;
    //Find a random index in checkLater and make that the new focus
    int newBranch = int(random(0, checkLater.size()));
    coord = fullGrid.get(checkLater.get(newBranch));
    //Remove the branch from checkLater, so it doesn't check the same spot twice.
    checkLater.remove(newBranch);
  }
  return coord;
}

float rainbower(int rainbow, int shift) {
  return ((cos((float(rainbow) / 20) + ((shift * PI) / 3)))* 127) + 127;
}

/* 
 End Peyton Tanzillo's code
 */