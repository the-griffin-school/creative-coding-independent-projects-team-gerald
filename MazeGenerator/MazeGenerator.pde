/*
Cole, Peyton, and Eliza
Team Gerald

Maze Generation Project
*/
float playerX = 7;//declares playerX of type float
float playerY = height/2;//declares playerY of type float
float playerSpeed = 14;//declares playerSpeed of type float and set playerSpeed = 1
boolean xTrue;
boolean yTrue;

import java.util.Map;
ArrayList<GridCoord> fullGrid = new ArrayList<GridCoord>();
ArrayList<GridCoord> checkLater = new ArrayList<GridCoord>();

void setup() {
  size(900, 700);
  
  for (int i = 0; i <= 51; i++) {
    for (int j = 0; j <= 51; j++) {
      if ((i == 0) || (j == 0) || (i == 51) || (j == 51)) {
        fullGrid.add(new GridCoord(j, i, false));
      } else {
        fullGrid.add(new GridCoord(j, i, true));
      }
    }
  }
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
  for(int i=0; i < fullGrid.size(); i++){
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

void generateMaze() {
  int mazeStart = int(random(2,49));
  GridCoord coord = new GridCoord(1, mazeStart, false);
  fullGrid.get(coord.XYtoIndex()).on = false;
  coord.x += 1;
  fullGrid.get(coord.XYtoIndex()).on = false;
  checkLater.add(coord);
  while ((checkLater.size() != 0)) {
    
  }
}

int whichDirection(int prevDirec, GridCoord current) {
  IntList possible = new IntList(0, 1, 2, 3);
  for (int i = 0; i > 4; i++) {
    if (possible.get(i) == prevDirec) {
      possible.remove(i);
    } else if (!canGo(i, current)) {
      possible.remove(i);
    }
  }
  if (possible.size() == 1) {
    return possible.get(0);
  } else if (possible.size() > 1) {
    return possible.get(int(random(0,(possible.size()-1))));
    //ADD TO THE "CHECK LATER" LIST
  } else {
    return 4;
  }
}

boolean canGo(int direction, GridCoord current) {
  if (direction == 0) {
    current.y -= 2;
    GridCoord coord1 = current;
    current.y -= 1;
    current.x -= 1;
    GridCoord coord2 = current;
    current.x += 2;
    GridCoord coord3 = current;
    if (coord1.on && coord2.on && coord3.on) {
      return true;
    } else {
      return false;
    }
  } else if (direction == 1) {
    if (fullGrid.contains(new GridCoord(current.x + 2, current.y, true)) && fullGrid.contains(new GridCoord(current.x + 1, current.y - 1, true)) && fullGrid.contains(new GridCoord(current.x - 1, current.y - 1, true))) {
      return true;
    } else {
      return false;
    }
  } else {
  return false;
  }
}