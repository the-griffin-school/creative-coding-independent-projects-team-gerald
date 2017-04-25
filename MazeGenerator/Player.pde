/* 
 Team Gerald
 
 The class for the player
 
 Written by Peyton Tanzillo & Cole Mills
 */
class Player {
  //X and Y locations
  float x, y;
  //Is up, down, left, and right being pressed?
  boolean up,left,down,right;
  //The speed that the player is moving at
  float moveSpeed;
  //The Diamater of the player
  int playerDiamater = 10;
  /* 
  Player Constructor (x position, y position)
  */
  Player(int x, int y) {
  this.x = x;
  this.y = y;
  //Player is not pressing anything yet
  up = false;
  left = false;
  down = false;
  right = false;
  //Move speed is 3
  moveSpeed = 1;
}

  void drawLoop() {
    //Move the player
    move();
    //make dark red
    fill(195, 0, 0);
    //No stroke on the circle
    noStroke();
    //Draw the player circle
   fill(random(0,255), random(0,255), random(0,255));
   ellipse(x,y,playerDiamater,playerDiamater);
  }
  
  //Check if up, down, left, and right are pressed/released and set them to false/true if they are pressed/released.
  void keyLoop(boolean test) {
    up = checkInput(87, test, up);
    left = checkInput(65, test, left);
    down = checkInput(83, test, down);
    right = checkInput(68, test, right);
  }

  //Check if a button is pressed/released, then set it to something if it is. If not, keep it as is.
  boolean checkInput(int code, boolean set, boolean curr) {
    if (keyCode == code) {
      return set;
    } else {
      return curr;
    }
  }
  
  
  void move() {
    //If pressing up, move it up.
    if (up) {
      y -= moveSpeed;
    }
    //If pressing left, move it left.
    if (left) {
      x -= moveSpeed;
    }
    //If pressing down, move it down.
    if (down) {
      y += moveSpeed;
    }
    //If pressing right, move it right.
    if (right) {
      x += moveSpeed;
    }
  }
}