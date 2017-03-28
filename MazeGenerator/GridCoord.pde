/* 
The class for a block within the grid. It can:
-Be on & off, depending on if it's a wall or not
-Display itself
-Convert to index
-Determine possible directions a new grid can go in generation
Mostly Written by Peyton Tanzillo
*/

class GridCoord {
  int x, y;
  boolean on;
  GridCoord(int x, int y, boolean on) {
    this.x = x;
    this.y = y;
    this.on = on;
  }
  //The display function to display the grid cube.
  void display() {
    //Display the block based on its position within the grid. 
    int xLoc = 86 + (x * 14);
    int yLoc = -14 + (y * 14);   
    if (on) {
      fill(255, 0, 0);
    } else {
      noFill();
    }
    noStroke();
    rect(xLoc, yLoc, 14, 14);
  } 
  int XYtoIndex() {
    return (52 * y) + x;
  }
  
  int whichDirection(int prevDirec) {
    IntList directions = new IntList(0, 1, 2, 3);
    IntList possible = new IntList();
    for (int i = 0; i < directions.size(); i++) {
      if (!(directions.get(i) == prevDirec) && canGo(i)) {
        possible.append(directions.get(i));
      }
    }
    if (possible.size() == 1) {
      return possible.get(0);
    } else if (possible.size() > 1) {
      checkLater.add(XYtoIndex());
      return possible.get(int(random(0,possible.size())));
    } else {
      return 4;
    }
  }
  
  boolean canGo(int direction) {
    if (direction == 0) {
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
}

 