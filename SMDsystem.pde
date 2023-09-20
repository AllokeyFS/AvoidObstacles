class smdDamper {

  float springRatio;
  float dampingRatio;
  float friction;
  float acceleration;
  float torque;
  float rotation;
  float speedOfRotation;
  float mass;

  smdDamper() {
    mass = 10;
    springRatio = 80;
    dampingRatio = 0.1;
    torque = 0;
    rotation = 0;
    speedOfRotation = 0;
  }
  void display() {
    //Spring-Mass-Damper System
    torque = rotation/springRatio;
    friction = dampingRatio*speedOfRotation;
    acceleration = -(torque+friction)/mass;
    speedOfRotation+=acceleration;
    rotation+=speedOfRotation;
    //Position for antenna
    translate(car.xCar+100, car.yCar+50);
    rotate(rotation);
    //Drawing antenna
    pushMatrix();
    translate(0, -25);
    strokeWeight(10); 
    line(0, 0, 0, 100);
    line(0, 0, 0, 200);
    line(0, 0, 0, -200);
    fill(0, 0, 0);
    rect(0, 0, 1, 50);
    popMatrix();
  }
}
