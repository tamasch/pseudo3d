Brick b;
PVector vpa;
PVector vpb;
boolean freeze = false;

void setup(){
  size(800, 600);
  
  vpa = new PVector(300, height / 2);
  vpb = new PVector(width - 300, height / 2);
    
  b = new Brick(floor(random(200)), floor(random(200)), floor(random(200)), vpa, vpb);
}

void draw(){
  background(0);
  stroke(255);
  b.show(mouseX, mouseY - b.getHeight() / 2);
  
  
  //stroke(0, 255, 0);
  //b.drawVectors();
  
  
}

void mouseClicked(){
 freeze = !freeze;
 if (freeze){
  noLoop(); 
 }
 else{
   loop();
 } 
}