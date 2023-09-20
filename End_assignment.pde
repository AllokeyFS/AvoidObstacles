Dash[] dash;
Clouds clandback;
Clouds[] clouds;
Car car;
smdDamper smd;
Rain[] rain;
Rain rains;
Arrays arrays;
int newLane;
int currentLane;
Block[] block;
int gameState;
void setup() {
  size(1000, 800);
  gameState=1;                  //1=game is running, 0=game is finished
  smooth();
  //Creating rain array
  arrays = new Arrays();
  arrays.displayArrays();
  //Drawing car and wheels
  car = new Car("car.png", 200, 500, "wheel.png", 0, 0, 0);
  smd = new smdDamper();
}

void draw() {
  background(#1FD4FF);
  clandback.drawBackground();
  clandback.displayCloud();
  //moving and displaying dashes
  for (int i=1; i<dash.length; i++) {
    dash[i].move();
    dash[i].display();
  }
  for (int i=1; i<block.length; i++) {
    block[i].display();
    block[i].collision();
  }

  car.display();
  clandback.displayScore();

  //Starting and finishing rain
  if (key=='d') {
    for (int i=0; i<rain.length; i++) {
      rain[i].drop();
      rain[i].dis();
    }
  } else if (key=='t') {
  }
}
void mousePressed() {
  car.reset();
}
void keyPressed() {
  //Controlling car
  if (keyCode == UP || key == 'w') {
    newLane = currentLane+1;
  } else if (keyCode == DOWN || key == 's') {
    newLane = currentLane-1;
  } else {
    return;
  }
  car.control();
}
