class Player {
  float x, y;
  boolean up,left,down,right;
  int moveSpeed;

  Player(int x, int y) {
  this.x = x;
  this.y = y;
  up = false;
  left = false;
  down = false;
  right = false;
  moveSpeed = 3;
}

  void drawLoop() {
    move();
    fill(195, 0, 0); //make dark red
    noStroke();
    ellipse(x,y,10,10);
  }
  
  void keyLoop(boolean test) {
    up = checkInput(87, test, up);
    left = checkInput(65, test, left);
    down = checkInput(83, test, down);
    right = checkInput(68, test, right);
  }

  boolean checkInput(int code, boolean set, boolean curr) {
    if (keyCode == code) {
      return set;
    } else {
      return curr;
    }
  }
  
  void move() {
    if (up) {
      y -= moveSpeed;
    }
    if (left) {
      x -= moveSpeed;
    }
    if (down) {
      y += moveSpeed;
    }
    if (right) {
      x += moveSpeed;
    }
  }
}