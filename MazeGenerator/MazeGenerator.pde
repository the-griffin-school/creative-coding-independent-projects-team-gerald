/*
Cole, Peyton, and Eliza
Team Gerald

Maze Generation Project
*/

import java.util.Map;

float playerX = 7;//declares playerX of type float
float playerY = height/2;//declares playerY of type float
float playerSpeed = 14;//declares playerSpeed of type float and set playerSpeed = 1
boolean xTrue;
boolean yTrue;
ArrayList<GridCoord> fullGrid = new ArrayList<GridCoord>();
ArrayList<Integer> checkLater = new ArrayList<Integer>();

void setup() {
  size(900, 700);  
  resetGrid();
  generateMaze();
}

void draw() {
  if(key == 'w'){//if w is pressed
  playerY = playerY-playerSpeed;//move up
  }
  if(key == 'a'){//if a is pressed
  playerX = playerX-playerSpeed;//move left
  }
  if(key == 's'){//if s is pressed
  playerY = playerY+playerSpeed;//move down
  }    
  if(key == 'd'){//if d is pressed
  playerX = playerX+playerSpeed;//move right
  }
  if(playerX > width || playerX < 0 || playerY > height || playerY < 0){//if player goes out of map
    fill(0);
    rect(0, 0, width, height);//make screen black
  }
  for(int i=0; i < fullGrid.size(); i++) {
    if(playerX > fullGrid.get(i).xLoc && playerX < fullGrid.get(i).xLoc+14){
      xTrue = true;
    }
    else{
      xTrue = false;
    }
    if(playerY < fullGrid.get(i).yLoc && playerY > fullGrid.get(i).yLoc+14){
      yTrue = true;
    }
    else{
      yTrue = false;
    }
  }
  if(xTrue == true && yTrue == true){
    fill(0);
    rect(0, 0, width, height);//make screen black
  }
  noStroke();
  fill(195, 0, 0);//make dark red
  ellipse(playerX, playerY, 10, 10);//draw ellipse at playerX, playerY, with a radius 10
  
  //Display Maze Grid
  for (int i = 0; i < fullGrid.size(); i++) {
    fullGrid.get(i).display();
  }
}

void keyReleased(){//if any key is released
  playerSpeed = 0;//set playerSpeed = 0
}
void keyPressed(){//if any key is pressed
  playerSpeed = 1;//set playerSpeed = 1
}
/* 
Peyton Tanzillo's Code
*/
//The full function for generating a maze
void generateMaze() {
  //Create a coordinate for reference so we can call the correct values
  GridCoord coord = new GridCoord(1, int(random(2,49)), false);
  //Get the entrance coord and make it false
  fullGrid.get(coord.XYtoIndex()).on = false;
  //Get the coord to the right of that coord and make it false
  coord.x += 1;
  fullGrid.get(coord.XYtoIndex()).on = false;
  //Add that index to the "check later" list in order to revisit and see if it can go in a new direciton.
  checkLater.add(coord.XYtoIndex());
  //Set the inital "previous direction" to 3, as it came from the West (N:0 E:1 S:2 W:3)
  int prevDirection = 3;
  //While there are still branches in the maze that need to be checked
  while (checkLater.size() != 0) {
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
  }
  //After the maze is generated, create a random exit.
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

/* 
End Peyton Tanzillo's code
*/