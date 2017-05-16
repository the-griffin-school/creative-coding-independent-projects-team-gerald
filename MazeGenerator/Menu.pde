/*
Start Screen
Made by ELiza Zardiackas
Last Updated: 5/2/2017
*/
class Menu {

  boolean moveX,moveY,click,move,start,options,menu,controls;
  color startColor,rectC,optionsColor,controlsColor,rectCC,rectCCC,back,backR;
  PImage clifford, tbone, bone, bone0;
  float angle;
  
  Menu() {
    size(900,700);
    frameRate(60);
    smooth();
    clifford = loadImage("clifford.png");
    tbone = loadImage("t-bone.png");
    bone = loadImage("bone.png");
    bone.resize(150,100);
    bone0 = loadImage("bone0.png");
    bone0.resize(200,110);
    tbone.resize(140,180);
    clifford.resize(200,200);
    start = false;
    angle=0;
    options = false;
    move = true;
    rectC = color(20);
    optionsColor = color(230);
    rectCC = color(20);
    rectCCC = color(20);
    controlsColor = color(230);
    menu = true;
    controls = false;
  }
  void display() {
  if (menu == true) { 
    if ((start == false) && (options == false)) { 
      if ((mouseX > width/2-90) && (mouseX < width/2 + 110) && (mouseY > height/1.85-50) && (mouseY <height/1.85+50)) {
        startColor = color(20);
        rectC = color(230);
      } else if ((mouseX > width/2-90) && (mouseX < width/2 + 110) && (mouseY > height/2+180-50) && (mouseY <height/2+180+50)) {
        optionsColor = color(20);
        rectCC = color(230);
      } else if ((mouseX > width/2-90) && (mouseX < width/2 + 110) && (mouseY > height/2+320-50) && (mouseY <height/2+320+50)) {
        controlsColor = color(20);
        rectCCC = color(230);
      }
      else {
        startColor = color(230);
        rectC = color(20);
        optionsColor = color(230);
        rectCC = color(20);
        controlsColor = color(230);
        rectCCC = color(20);
      }
      
      background(#EB1111);
      image(clifford, 50, 500);
      image(tbone, 680, 520);
      image(bone, 50, 50);
      image(bone0, 680, 45);
  
      textSize(60);
      fill(230);
      text("Clifford Maze Generator", (width/2)-330, height/3);
      rectMode(CENTER);
      fill(rectC);
      rect(width/2+10,height/1.85,200,100);
      textSize(50);
      fill(startColor);
      text("Start", width/2-50, height/1.8);
      
      fill(rectCC);
      rect(width/2+10,height/2+180,200,100);
      textSize(45);
      fill(optionsColor);
      text("Options", width/2-75, height/2+195);
      
      fill(rectCCC);
      rect(width/2+10,height/2+320,200,100);
      textSize(40);
      fill(controlsColor);
      text("Controls", width/2-75, height/2+330);
          
    }
  }
    
    if (options == true) {//OPTIONS
      if ((mouseX > 0) && (mouseX < 200) && (mouseY > 10) && (mouseY < 110)) {
        optionsColor = color(20);
        rectCC = color(230);
        rectMode(CENTER);
        fill(174, 174, 174);
        rect(width/2, height/2, 300, 30);
        fill(0, 0, 0);
        rect(mouseX, height/2, 70, 50);
        float Idontcare = map(mouseX, 0, 200, 0, 100);
        textAlign(CENTER, CENTER);
        text(Idontcare, mouseX, height/2-100);
        textAlign(TOP, TOP);
      }
      
      else {
        optionsColor = color(230);
        rectCC = color(20);
      }
      
      fill(50);
      rect(0,0,width*2,height*2);
      fill(rectCC);
      rect(75,60,200,100);
      textSize(50);
      fill(optionsColor);
      text("Back",25,75);
      
      fill(230);
  
      
    }
    
    if (controls == true) {  //CONTROLS
      if ((mouseX > 0) && (mouseX < 200) && (mouseY > 10) && (mouseY < 110)) {
        controlsColor = color(20);
        rectCCC = color(230);
      } else {
        controlsColor = color(230);
        rectCCC = color(20);
      }
      fill(50);
      rect(0,0,width*2,height*2);
      fill(rectCCC);
      rect(75,60,200,100);
      textSize(50);
      fill(controlsColor);
      text("Back",25,75);
      
      fill(230);
      text("INPUT DIRECTIONS",75,200);
    }
  
    if (start == true) {
      menuing = false;//START
      resetGrid();
      mazeSetup();
    }
  }
  
  void keyPressLoop() {
    if ((menu == true) && (mouseX > width/2-90) && (mouseX < width/2 + 110) && (mouseY > height/1.85-50) && (mouseY <height/1.85+50)) {
      start = true;  //START
      menu = false;
      options = false;
      controls = false;
      fill(50);
      rect(0,0,width*2,height*2);
    }
    if ((menu == true) && (mouseX > width/2-90) && (mouseX < width/2 + 110) && (mouseY > height/2+180-50) && (mouseY <height/2+180+50)) {
        options = true;  //OPTIONS
        menu = false;
        start = false;
        controls = false;
        fill(50);
        rect(0,0,width*2,height*2);  
        optionsColor = color(230);
        rectCC = color(20);
    }
    if ((options == true) && (mouseX > 0) && (mouseX < 200) && (mouseY > 10) && (mouseY < 110)) {
      menu = true;    // BACK TO MENU
      options = false;
      start = false;
      controls = false;
      fill(50);
      rect(0,0,width*2,height*2);
    }
    if ((controls == true) && (mouseX > 0) && (mouseX < 200) && (mouseY > 10) && (mouseY < 110)) {
      menu = true;    // BACK TO MENU
      options = false;
      start = false;
      controls = false;
      fill(50);
      rect(0,0,width*2,height*2);
    }
    if ((menu == true) && (mouseX > width/2 - 90) && (mouseX < width/2 + 110) && (mouseY > height/2+320-50) && (mouseY <height/2+320+50)) {
        controls = true;  //CONTROLS
        options = false;  
        menu = false;
        start = false;
        fill(50);
        rect(0,0,width*2,height*2);  
        controlsColor = color(230);
        rectCCC = color(20);
    } 
  }
}