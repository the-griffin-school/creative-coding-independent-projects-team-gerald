class GridCoord {
  int x, y;
  GridCoord(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void display(boolean on) {
    int xLoc = 72 + (x * 14);
    int yLoc = -28 + (y * 14);   
    if (on) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    noStroke();
    rect(xLoc, yLoc, 14, 14);
  } 
}