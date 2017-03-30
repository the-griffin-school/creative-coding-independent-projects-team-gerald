/*
Team Gerald
Eliza Zardiackas
03/23/2017
*/

PImage cliffordMenu;
menu menu_;


void setup(){
size(900,700);
menu_= new menu(0);
cliffordMenu = loadImage("cliffordMenu0.png");
cliffordMenu.resize(900, 700);
}

void draw(){
menu_.startMenu();
  
}