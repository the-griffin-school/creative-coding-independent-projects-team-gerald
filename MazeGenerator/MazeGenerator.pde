/*
Cole, Peyton, and Eliza
Team Gerald

Maze Generation Project
*/
import java.util.Map;
ArrayList<GridCoord> fullGrid = new ArrayList<GridCoord>();
ArrayList<GridCoord> checkLater = new ArrayList<GridCoord>();

void setup() {
  size(900, 700);
  //Generate the Grid coordinates for each spot and declare each coordinate as false or true
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
  //Display Maze Grid
  for (int i = 0; i < fullGrid.size(); i++) {
    fullGrid.get(i).display();
  }
}

void generateMaze() {
  GridCoord coord = new GridCoord(50, 50, false);
  fullGrid.get(coord.XYtoIndex()).on = false;
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
    if (fullGrid.contains(new GridCoord(current.x, current.y - 2, true))) {
      return true;
    } else {
      return false;
    }
  } else {
  return false;
  }
}