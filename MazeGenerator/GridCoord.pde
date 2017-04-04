class GridCoord {
  int xLoc;
  int yLoc;
  int x, y;
  boolean on;
  GridCoord(int x, int y, boolean on) {
    this.x = x;
    this.y = y;
    this.on = on;
  }
  
  void display() {
    xLoc = 86 + (x * 14);
    yLoc = -14 + (y * 14);   
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
}