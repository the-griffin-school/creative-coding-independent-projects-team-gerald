/*
Cole, Peyton, and Eliza
Team Gerald

Maze Generation Project
*/
import java.util.Map;
ArrayList<GridCoord> fullGrid = new ArrayList<GridCoord>();
ArrayList<Integer> checkLater = new ArrayList<Integer>();

void setup() {
  size(900, 700);
  resetGrid();
  generateMaze();
}

void draw() {
  //Display Maze Grid
  for (int i = 0; i < fullGrid.size(); i++) {
    fullGrid.get(i).display();
  }
}
/* 
Peyton Tanzillo's Code \/
*/
void generateMaze() {
  GridCoord coord = new GridCoord(1, int(random(2,49)), false);
  fullGrid.get(coord.XYtoIndex()).on = false;
  coord.x += 1;
  fullGrid.get(coord.XYtoIndex()).on = false;
  checkLater.add(coord.XYtoIndex());
  int prevDirection = 3;
  while (checkLater.size() != 0) {
    int direction = coord.whichDirection(prevDirection);
    if (direction != 4) {
      prevDirection = direcToPrev(direction);
      coord = goDirection(direction, coord);
      fullGrid.get(coord.XYtoIndex()).on = false;
    } else {
      prevDirection = 4;
      coord = fullGrid.get(checkLater.get(checkLater.size()-1));
      checkLater.remove(checkLater.size()-1);
    }
  }
  IntList exits = new IntList();
  GridCoord exitHelp = new GridCoord(49, 2, false);
  for (int i = 2; i < 50; i++) {
    exitHelp.y = i;
    if (!(fullGrid.get(exitHelp.XYtoIndex()).on)) {
      exits.append(exitHelp.XYtoIndex());
    }
  }
  exitHelp = fullGrid.get(exits.get(int(random(0,exits.size()))));
  exitHelp.x += 1;
  fullGrid.get(exitHelp.XYtoIndex()).on = false; 
}

GridCoord goDirection(int direction, GridCoord previous) {
  if (direction == 0) {
    previous.y--;
  } else if (direction == 1) {
    previous.x++;
  } else if (direction == 2) {
    previous.y++;
  } else if (direction == 3) {
    previous.x--;
  }
  return previous;
}

int direcToPrev(int direction) {
  if (direction > 1) {
    return direction -= 2;
  } else {
    return direction += 2;
  }
}

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