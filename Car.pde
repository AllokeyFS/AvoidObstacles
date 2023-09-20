class Car {
  //End_assignment end;
  float xCar;
  float yCar;
  float xWheel;
  float yWheel;
  float translateX;
  float translateY;
  float imageRotation;
  int counter;

  float xpos;
  float ypos;
  PImage wheel;
  PImage car;
  float x1pos;
  float y1pos;


  float yFirstLane;
  float ySecondLane;
  float yThirdLane;

  float partX;
  float partY;

  float carWidth;
  float carLength;
  
  
  ArrayList particles = new ArrayList();
  Car(String carShape, float xpos, float ypos, String wheelShape, float x1pos, float y1pos, int lane) {
    car = loadImage(carShape);
    wheel = loadImage(wheelShape);
    //end = new End_assignment();
    xCar = xpos;
    yCar = ypos;
    xWheel=x1pos;
    yWheel=y1pos;
    translateX=xWheel;
    translateY=yWheel;
    counter = 1;
    currentLane = lane;
    yFirstLane = currentLane*90;
    ySecondLane = yFirstLane -90;
    yThirdLane = yFirstLane -180;
    partX=250;
    partY=600;
    carWidth=150;
    carLength=40;
    for (int z = 0; z < 200; z++) {
      particles.add(new Particle(new PVector(partX, partY), new PVector(0, 0), random(10, 30)));
    
    //if (particles.isDead()) {
    //    particles.remove(z);
    //  }
      }
  }
  void display() {

    pushMatrix();
    noFill();
    noStroke();
    rect(xCar+203, yCar+90, carWidth, carLength);
    popMatrix();
    //Car appearing
    image(car, xCar, yCar);
    counter=counter +5 ;
    imageMode(CENTER);

    //Wheel rotation
    pushMatrix();
    translate(translateX+277, translateY+603);
    rotate(counter*TWO_PI/360);
    image(wheel, xWheel, yWheel);
    popMatrix();

    pushMatrix();
    translate(translateX+277+156, translateY+603);
    rotate(counter*TWO_PI/360);
    image(wheel, xWheel, yWheel);
    popMatrix();
    imageMode(CORNER);
    //Creating and drawing particles
    for (int n = 0; n < particles.size(); n++) {
      Particle p = (Particle) particles.get(n);
      p.drawParticles();
      p.move();
      //Creating condition with using boolean isDead to remove Particles with lifespan lower than 40;
      if (p.isDead()) {
        particles.remove(n);
      }
    }
    //Spring-mass-damper system
    pushMatrix();
    smd.display();
    popMatrix();
  }
  //Car movement control
  void control() {
    //end.keyPressed();
    switch(newLane) {
    case 0:
      yCar = yFirstLane+500;

      translateY = yFirstLane;
      partY=yCar+100;
      currentLane = 0;
      smd.speedOfRotation += 0.02;
      break;
    case 1:
      yCar = ySecondLane+500;
      translateY = yWheel-90;
      partY=yCar+100;
      currentLane = 1;
      smd.speedOfRotation += 0.02;
      break;
    case 2:
      yCar = yThirdLane+500;
      translateY = yWheel-180;
      partY=yCar+100;
      currentLane = 2;
      smd.speedOfRotation += 0.02;
      break;
    default:
      break;
    }
    for (int n = 0; n < particles.size(); n++) {
      Particle p = (Particle) particles.get(n);
      p.changeLocation(yCar+100);
      //Creating condition with using boolean isDead to remove Particles with lifespan lower than 40;
      if (p.isDead()) {
        particles.remove(n);
      }
    }
  }
  void reset() {
    frameCount = -1;
  }
}
