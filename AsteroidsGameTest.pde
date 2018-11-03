
Spaceship fighter;
boolean accelerating, decelerating, leftTurn, rightTurn, shoot;
boolean releasedKey = false;
boolean clicked = false;
int accelerateCount = 0;
int decelerateCount = 0;
double ex;
boolean movingMouse = false;
int notMovingMouse;
// UPGRADES
int uSpeed;
// CURRENCY
int nova;
boolean deceleratingDown;
boolean away;
//int counter;

public void setup(){
  size(1000,650);
  frameRate(40);
  strokeJoin(ROUND);
  fighter = new Spaceship();
  nova = 4000;
}

public void draw(){
  background(0);
  if(movingMouse == false){
    notMovingMouse++;
  }else{
    cursor(CROSS);
    notMovingMouse = 0;
    movingMouse = false;
  }
  if(notMovingMouse > 100){
    noCursor();
  }
  translate(width/2 - (int)fighter.myCenterX, height/2 - (int)fighter.myCenterY);
  pushMatrix();
  //translate(width/2 - (int)fighter.myCenterX, height/2 - (int)fighter.myCenterY);
  fighter.show();
  fighter.move();
  fighter.deceleratee();
  
  popMatrix();
  fill(255);
  textAlign(CENTER);
  //if(accelerating == false && deceleratingDown == false){
  text("Nova: $" + nova, (int)fighter.myCenterX - 400 , (int)fighter.myCenterY - 250);
  //}
  float distFromBaseXz = (900- (float)fighter.myCenterX)-(width/2);
  float distFromBaseYz = (725- (float)fighter.myCenterY)-(height/2);
  textSize(15);
  int di = ((int)((dist(width/2, height/2, distFromBaseXz + width/2, distFromBaseYz + height/2))/10)*10);
  if(away == true){
    text("Distance from Base: " + di + "m", (int)fighter.myCenterX - 400 , (int)fighter.myCenterY - 230);
  }
  /*
  pushMatrix();
  translate(0,0);
    float distFromBaseXy = (900- (float)fighter.myCenterX)-(width/2);
  float distFromBaseYy = (725- (float)fighter.myCenterY)-(height/2);
  int diy = ((int)((dist(width/2, height/2, distFromBaseXz + width/2, distFromBaseYz + height/2))/10)*10);

  text("Distance from Base: " + diy + "m", 50, 50);
  popMatrix();
  */
  if(accelerating == true){// && maxSpdCtAcc <= 100){ // && leftTurn == false && rightTurn == false
    fighter.accelerate(0.5); //fighter.constantVel(5); //fighter.accelerate(0.1);
  }
  if(decelerating == true){// && maxSpdCtAcc >= -100){ // && leftTurn == false && rightTurn == false
    fighter.acceleratee(-0.2); //fighter.constantVel(-5); //fighter.accelerate(-0.1);
  }
  if(leftTurn == true){
    fighter.turn(-2);
  }
  if(rightTurn == true){
    fighter.turn(2);
  }
  //if(accelerateCount > 0 && releasedKey == true){
  //  accelerateCount = accelerateCount - 1;
  //  fighter.accelerate(-0.1);
  //}
  //////////println(accelerateCount);
  //fighter.myCenterX = lerp((int)fighter.myCenterX, (int)ex, 0.01);
}
public void mouseMoved(){
  movingMouse = true;
}
public void mousePressed(){
  clicked = true;
}
//public void mouseReleased(){
//  //clicked = false;
//}
public void keyPressed(){
  releasedKey = false;
  if(key == 'w'){accelerating = true;}
  if(key == 's'){decelerating = true;}
  if(key == 'a'){leftTurn = true;}
  if(key == 'd'){rightTurn = true;}
  if(keyCode == UP){shoot = true;}
}

public void keyReleased(){
  releasedKey = true;
  if(key == 'w'){accelerating = false;}
  if(key == 's'){decelerating = false;}
  if(key == 'a'){leftTurn = false;}
  if(key == 'd'){rightTurn = false;}
  if(keyCode == UP){shoot = false;}
}
