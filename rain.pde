//Rain byRain  Kaisei Tomita from https://openprocessing.org/sketch/1218561
class Rain {
  float xRain;
  float yRain;
  float yRainspeed;
  float size;
  Rain() {
    xRain=random(50, 2000);
    xRain=random(-300, -100);
    yRainspeed=random(4, 11);
    size=random(10, 23);
  }
  void drop() {
    yRain=yRain+yRainspeed;
    xRain=xRain-yRainspeed;
    //Repositioning rain
    if (yRain>height&& xRain<0) {
      xRain=random(-250, 2000);
      yRain=random(-400, -500);
    }
  }

 
  void dis() {
    //Drawing rain
    stroke(#c9d4d9);
    strokeWeight(2);
    fill(255);
    line(xRain, yRain, xRain-10, yRain+size);
  }
}
