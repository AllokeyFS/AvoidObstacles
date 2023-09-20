class Clouds {
  float yoff = 0.0;
  float xClouds;
  float yClouds;
  float size;
  float direction;
  float directionY;
  float newY;
  

  PFont f;
  int score=0;
  int m;
  boolean counting=true;
  int xText=10;
  Clouds() {
    xClouds = random(-200, 1200);
    yClouds = random(-200, 90);
    size = 0.5;
    direction = random(-2, 2);
    directionY= -10;
    newY = random(-200, 140);
  }
  void display() {
    //Displaying clouds
    pushMatrix();
    translate(xClouds, yClouds);
    scale(size);
    fill(255);
    stroke(0);
    strokeWeight(5);
    circle(250, 220, 100);
    circle(200, 240, 70);
    circle(300, 240, 70);

    fill(255);
    noStroke();
    circle(250, 220, 100);
    circle(200, 240, 70);
    circle(300, 240, 70);

    popMatrix();
  }
  void update() {
    //Cloud movement
    xClouds=xClouds+direction;
    if (xClouds>width+50||xClouds<-200) {
      direction = -direction;
    }
  }

  void displayCloud() {
    //Creating several clouds
    for (int i = 0; i <clouds.length; i++) {                
      clouds[i].display();
    }
    //For clouds position update
    for (int i = 0; i <clouds.length; i++) {              
      clouds[i].update();
    }
  }
  void drawBackground() {
    //Perlin noise for background


    beginShape(); 
    fill(#896363);
    float xoff = yoff;
    for (float x = 0; x <= width; x += 10) {

      float y1 = map(noise(xoff), 0, 1, 100, 200);  
      // Set the vertex
      vertex(x, y1); 
      // Increment x dimension for noise
      xoff += 0.05;
    }
    // Increment y dimension for noise
    yoff += 0.01;
    vertex(width, 490);
    vertex(0, 490);
    endShape(CLOSE);

    beginShape(); 
    fill(#31FF81);

    for (float x = 0; x <= width; x += 10) {

      float y = map(noise(xoff), 0, 1, 200, 300);   

      // Set the vertex
      vertex(x, y); 

      // Increment x dimension for noise
      xoff += 0.05;
    }

    vertex(width, 490);
    vertex(0, 490);
    endShape(CLOSE);

    //Drawing road
    fill(#A1A2A2);
    rect(0, 535, 2000, 270);
    fill(245, 246, 250);
    rect(999, 665, 2000, 4);
    rect(999, 405, 2000, 4);

    fill(#FFE51A);
    ellipse(1000, 0, 80, 80);
    fill(#31FF81);
    rect(1000, 735, 2000, 130);
  }
  //Displaying score
  void displayScore() {
    f = loadFont("AgencyFB-Bold-48.vlw");      // Arial, 16 point, anti-aliasing on
    textFont(f, 60);            
    fill(0); 
    m = millis();
    //Score counter
    if (counting) {
      score +=1;
    }
    //After crashing shows the final score and asks to restart
    if (gameState==0) {
      counting=false;
      fill(255);
      textFont(f,150);
      text(score, width/2, height/2);
      xText-=1000;
      fill(0);
      textFont(f,60);
      text("CLICK TO RESTART",width/2, height/2+150);
    }
    text(score, xText, 50);
    
  }
}
