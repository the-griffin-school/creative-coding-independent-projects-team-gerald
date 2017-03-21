/*
Cole, Peyton, and Eliza
Team Gerald

Maze Generation Project
*/
import java.util.Map;
HashMap<GridCoord,Boolean> fullGrid = new HashMap<GridCoord,Boolean>();

void setup() {
  size(900, 700);
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
  //Put draw function things here
  for (GridCoord k: fullGrid.keySet()) {
    k.display(fullGrid.get(k));
  }
}