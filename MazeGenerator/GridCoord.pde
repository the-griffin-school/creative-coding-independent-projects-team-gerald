/* 

 Team Gerald
 
 The class for a block within the grid. It can:
 -Be on & off, depending on if it's a wall or not
 -Display itself
 -Convert to index
 -Determine possible directions a new grid can go in generation
 
 Written by Peyton Tanzillo
 */
 
class GridCoord {
  //x & y location of the block relative to other blocks
  int x, y, xLoc, yLoc;
  //Is the block a wall (on) or a gap? (not on)
  boolean on;
  GridCoord(int x, int y, boolean on) {
    this.x = x;
    this.y = y;
    this.on = on;
  }

  //The display function to display the grid cube.
  void display() {
    //Display the block based on its position within the grid. 
    xLoc = 86 + (x * 14);
    yLoc = -14 + (y * 14); 
    //If it's a wall, display the block, if not, don't.
    if (on) {
      fill(255, 0, 0);
    } else {
      noFill();
    }
    noStroke();
    if(mouseX > 850 && mouseY > 650){//if mouse is in bottom right 50 pixel coorner
      fill(random(0,255), random(0,255), random(0,255));//make the maze throwup
    }
    rect(xLoc, yLoc, 14, 14);
  } 

  //Convert the x & y variables to an index to be called in the full grid
  int XYtoIndex() {
    return (52 * y) + x;
  }

  //Determine which direction the piece should go during generation
  int whichDirection(int prevDirec) {
    //Determine wether these directions can be gone towards based on the canGo function and previous direction
    //If they can, add them to the possible list
    IntList directions = new IntList(0, 1, 2, 3);
    IntList possible = new IntList();
    //The main direction it is going, based on where it has been (to make the maze straighter)
    int mainDirec = direcToPrev(prevDirec);
    for (int i = 0; i < directions.size(); i++) {
      if (!(directions.get(i) == prevDirec) && canGo(i)) {
        possible.append(directions.get(i));
        //If it is possible to go in the main direction, add the direction more times so that it goes straight more often than it turns.
        if (directions.get(i) == mainDirec) {
          for (int j = 0; j < 9; j++) {
            possible.append(directions.get(i));
          }
        }
      }
    }
    //If the size is 1, don't add the index to checkLater as we already know that it can't go anywhere else
    //Return the only direction it can go
    if (possible.size() == 1) {
      return possible.get(0);

    //If the size is greater than 1, add the index to checkLater because it might be able to branch in the future
    //Return the only direction it can go
    } else if (possible.size() > 1) {
      checkLater.add(XYtoIndex());
      return possible.get(int(random(0,possible.size())));
      //If there are no direction it can go, return 4
    } else {
      return 4;
    }
  }

  //Check if it CAN go in a specific direction
  boolean canGo(int direction) {
    if (direction == 0) {
      //Check the 3 squares around the block it is intending to go towards in order to make sure none of them are open
      y -= 2;
      int c1Index = XYtoIndex();
      y += 1;
      x += 1;
      int c2Index = XYtoIndex();
      x -= 2;
      int c3Index = XYtoIndex();
      y += 1;
      x += 1;  
      if (fullGrid.get(c1Index).on && fullGrid.get(c2Index).on && fullGrid.get(c3Index).on) {
        return true;
      } else {
        return false;
      }
    } else if (direction == 1) {
      //Check the 3 squares around the block it is intending to go towards in order to make sure none of them are open
      x += 2;
      int c1Index = XYtoIndex();
      x -= 1;
      y += 1;
      int c2Index = XYtoIndex();
      y -= 2;
      int c3Index = XYtoIndex();
      x -= 1;
      y += 1;  
      if (fullGrid.get(c1Index).on && fullGrid.get(c2Index).on && fullGrid.get(c3Index).on) {
        return true;
      } else {
        return false;
      }
    } else if (direction == 2) {
      //Check the 3 squares around the block it is intending to go towards in order to make sure none of them are open
      y += 2;
      int c1Index = XYtoIndex();
      y -= 1;
      x += 1;
      int c2Index = XYtoIndex();
      x -= 2;
      int c3Index = XYtoIndex();
      y -= 1;
      x += 1;  
      if (fullGrid.get(c1Index).on && fullGrid.get(c2Index).on && fullGrid.get(c3Index).on) {
        return true;
      } else {
        return false;
      }
    } else if (direction == 3) {
      //Check the 3 squares around the block it is intending to go towards in order to make sure none of them are open
      x -= 2;
      int c1Index = XYtoIndex();
      x += 1;
      y += 1;
      int c2Index = XYtoIndex();
      y -= 2;
      int c3Index = XYtoIndex();
      x += 1;
      y += 1;  
      if (fullGrid.get(c1Index).on && fullGrid.get(c2Index).on && fullGrid.get(c3Index).on) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  //Go the direction 
  GridCoord goDirection(int direction) {
    //If direction 0, move north
    if (direction == 0) {
      y--;
    //If direction 1, move east
    } else if (direction == 1) {
      x++;
    //If direction 2, move south
    } else if (direction == 2) {
      y++;
    //If direction 3, move west

    } else if (direction == 3) {
      x--;
    }
    //Return the new focus location
    return this;
  }
}