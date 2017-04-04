/*
This class is responsible for the start menu and changing of levels (eventually)
Eliza Zardiackas
03/30/2017
*/

class menu {

  int level;

  menu(int Level) {
    level=Level;
  }


  void startMenu() {

    background(cliffordStart);

    stroke(255);
    rectMode(CENTER);
    fill(0);
    rect(200, 285, 140, 40);
    rect(400, 285, 140, 40);
    fill(255);
    textSize(35);
    text("Start 1", 145, 300);
    text("Start 2", 350, 300);

    if (mouseX >=(200) && mouseX <=(200+140) && mouseY >=(285)&& mouseY <=(285+40)&& mousePressed) {
      level=1;
      if (mouseX >=(400) && mouseX <=(400+140) && mouseY >=(285)&& mouseY <=(285+40)&& mousePressed) {
        level=2;
      }

      if (mouseX >=(200) && mouseX <=(200+140) && mouseY >=(285)&& mouseY <=(285+40)) {
        fill(255, 0, 0);
      }else{ 
        fill(0);
        if (mouseX >=(400) && mouseX <=(400+140) && mouseY >=(285)&& mouseY <=(285+40)) {
          fill(255, 0, 0);
        } else{ 
          fill(0);
        }
      }
    }
  }
}