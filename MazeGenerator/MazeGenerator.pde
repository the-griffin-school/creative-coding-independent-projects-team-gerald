/*
Cole, Peyton, and Eliza
Team Gerald

Maze Generation Project
*/
import java.util.Map;
HashMap<GridCoord,Boolean> fullGrid = new HashMap<GridCoord,Boolean>();
ArrayList<GridCoord> checkLater = new ArrayList<GridCoord>();

void setup() {
  size(900, 700);
  //Generate the Grid coordinates for each spot and declare each coordinate as false or true
  for (int i = 1; i <= 52; i++) {
    for (int j = 1; j <= 52; j++) {
      if ((i == 1) || (j == 1) || (i == 52) || (j == 52)) {
        fullGrid.put(new GridCoord(j, i), false);
      } else {
        fullGrid.put(new GridCoord(j, i), true);
      }
    }
  }
}

void draw() {
  //Display Maze Grid
  for (GridCoord k: fullGrid.keySet()) {
    k.display(fullGrid.get(k));
  }
}

void generateMaze() {
  fullGrid.get(new GridCoord(2, int(random(3, 48))));
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
    if (fullGrid.get(new GridCoord(current.x, current.y - 2)) && fullGrid.get(new GridCoord(current.x + 1, current.y - 1)) && fullGrid.get(new GridCoord(current.x - 1, current.y - 1))) {
      return true;
    } else {
      return false;
    }
  } else if (direction == 1) {
    if (fullGrid.get(new GridCoord(current.x + 2, current.y)) && fullGrid.get(new GridCoord(current.x + 1, current.y - 1)) && fullGrid.get(new GridCoord(current.x + 1, current.y + 1))) {
      return true;
    } else {
      return false;
    }
  } else if (direction == 2) {
    if (fullGrid.get(new GridCoord(current.x, current.y + 2)) && fullGrid.get(new GridCoord(current.x + 1, current.y + 1)) && fullGrid.get(new GridCoord(current.x - 1, current.y + 1))) {
      return true;
    } else {
      return false;
    }
  } else if (direction == 3) {
    if (fullGrid.get(new GridCoord(current.x - 2, current.y)) && fullGrid.get(new GridCoord(current.x - 1, current.y + 1)) && fullGrid.get(new GridCoord(current.x - 1, current.y - 1))) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}