/*
Cole, Peyton, and Eliza

Team Gerald
Maze Generation Project
*/

import java.util.Map;

boolean gen;
int prevDirection, count;
GridCoord currCoord;
Player player = new Player(20, height/2);
ArrayList<GridCoord> fullGrid = new ArrayList<GridCoord>();
ArrayList<Integer> checkLater = new ArrayList<Integer>();
int currentRate = 1;
float currentPlace = 1;
int startPointY = (int(random(2,49)));
float rndR = random(0, 255);
float rndG = random(0, 255);
float rndB = random(0, 255);
float scaled = map(abs(width/2-mouseX), 0, 450, 0, 48);
PImage img;
boolean rainbowing = false;

void setup() {
  size(900, 700);  
  resetGrid();
  mazeSetup();
  gen = true;
  frameRate(1);
  img = loadImage("welcometotheinternetsayscole.jpeg");
}
void draw() {
  /*
  //if(the player reaches a deadend){//if the player reaches a dead end
    if(mouseX > width/2){//if the mouse is on the right side of the screen
      textSize(48-scaled);
    }
    if(mouseX < width/2){//if the mouse is on the left side of the screen
      textSize(48-scaled);
    }
    fill(rndR, rndG, rndB);//fill with random colors once
    text("Congragulations, you reached an end", width/2, height/2);//display "Congragulation, you reached and end" at the middle
  //}
  */
  image(img, 0, 0);
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
    player.x = 20;
    player.y = height/2;
  }
}
  background(255);
  player.drawLoop();
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
  
  //Display Maze Grid
  for (int i = 0; i < fullGrid.size(); i++) {
    fullGrid.get(i).display();
  }
}


void keyReleased(){//if any key is released
  player.keyLoop(false);
}
void keyPressed(){//if any key is pressed
  player.keyLoop(true);

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
  //After the maze is generated, create a random exit.
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
  exitHelp = fullGrid.get(exits.get(int(random(0,exits.size()))));
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

/* 
End Peyton Tanzillo's code
*/