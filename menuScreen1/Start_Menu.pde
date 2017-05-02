class menu{
  boolean xRot;
  menu(){
    xRot= false;
  }
  
  void rotateClifford(){
   translate(50, 500);
    rotate(angle);
    image(clifford, -50,-500);
    angle+=0.1; 
    
  }
}