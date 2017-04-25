/*
Team Gerald
Eliza Zardiackas
03/23/2017
*/

PImage cliffordStart;
menu menu_;


void setup(){
size(900,700);
menu_= new menu(0);
cliffordStart = loadImage("cliffordStart.png");

}

void draw(){
 if(menu_.level==0){
  menu_.startMenu();
  }
 if(menu_.level==1){
   background(255);
 }
  
}