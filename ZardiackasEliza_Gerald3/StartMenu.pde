class menu{
  
  int level;
  
  menu(int Level){
   level=Level; 
  }


void startMenu(){

background(cliffordMenu);
textAlign(CENTER);
textSize(40);
fill(0);
text("Clifford Maze", 700, 100);
text("Generator", 700, 140);

stroke(255);
rectMode(CENTER);
noFill();
rect(400, 285, 140, 40);
rect(600, 485, 140, 40);
fill(255);
textSize(35);
text("Start 1", 400, 300);
text("Start 2", 600, 500);

 if (mouseX >=(350) && mouseX <=(440) && mouseY >=(273)&& mouseY <=(305)&& mousePressed) {
      level=1;
    } else if (mouseX >=(550) && mouseX <=(640) && mouseY >=(473)&& mouseY <=(505)&& mousePressed) {
      level=2;
    }
}
}