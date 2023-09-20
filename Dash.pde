///dash by  Joshua Schneider from https://openprocessing.org/sketch/118751
class Dash { 
  float xPosDash;
  float yPosDash = 490;
  float yPosDash1 = 580;
  float dashWidth = 25; //width
  float dashHeight = 5;  //height
  float speed = 5.0;

  Dash(float tempXpos) {
    xPosDash = tempXpos;
  }

  void display() {
    //drawing dashes
    fill(255, 234, 151);
    rectMode(CENTER);
    rect(xPosDash, yPosDash, dashWidth, dashHeight);
    rect(xPosDash, yPosDash1,dashWidth, dashHeight);
  }

  void move() {
    //Moving dashes
    xPosDash = xPosDash - speed;
    if (xPosDash < 0-dashWidth) {
      xPosDash = width+dashWidth;
    }
  }
}
