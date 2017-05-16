
/*
Start Screen
Made by ELiza Zardiackas
Last Updated: 5/2/2017
Last Updated: 5/4/2017
Last Updated: 05/09/2017
*/

boolean moveX,moveY,click,move,start,options,menu,controls, paused;
color startColor,rectC,optionsColor,controlsColor,rectCC,rectCCC,back,backR;
PImage clifford, tbone, bone, bone0;
float angle;
menu menu_;

void setup() {
  size(900,700);
  frameRate(60);
  smooth();
  menu_=new menu();
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

void draw() {
  if(!paused){
  menu_.screen();
  }
}


void keyPressed(){
 if(paused){
   paused=false;
 } else{
   paused=true;
 }
}
void mousePressed() {
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
  if ((menu == true) && (mouseX > width/2-90 ) && (mouseX < width/2 + 110) && (mouseY > height/2+320-50) && (mouseY <height/2+320+50)) {
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