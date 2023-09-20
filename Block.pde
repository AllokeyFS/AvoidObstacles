class Block {
  float xBlock;
  float yBlock;
  float blockSpeed;
  float blockWidth;
  float blockLength;

  PImage block;

  int m;


  Block(float xPosBlock) {
    block = loadImage("block.png");
    blockWidth=100;
    blockLength=50;
    xBlock= xPosBlock;
    yBlock=random(400, 600);
  }
  //Display block and block movement
  void display() {
    pushMatrix();
    noFill();
    noStroke();
    rect(xBlock+50, yBlock+50, blockWidth, blockLength);
    popMatrix();
    image(block, xBlock, yBlock);
    m = millis();
    if (m>=50) {
      xBlock-=5;       
    }
  }
  //This function detects the collision between an obstruction and a car
  void collision() {
    if (car.xCar+203 < xBlock+50 + blockWidth &&
      car.xCar+203 + car.carWidth > xBlock+50 &&
      car.yCar+90 < yBlock+50 + blockLength &&
      car.carLength+car.yCar+90 >yBlock+50) {            //When the car collides with the obstacle the gamestate turns 0 meaning that the game is finished
      gameState=0;
      car.xCar-=35;        //Here we move the the car's parts when the collision happens
      car.partX-=35;
      car.translateX-=35;
      xBlock-=15;          //this is block's movement
    }
  }
}
