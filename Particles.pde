//Simple Particle System by Daniel Shiffman https://processing.org/examples/simpleparticlesystem.html
class Particle {
  PVector loc, vel;
  float s, ms, lifespan;

  Particle(PVector l, PVector v, float s) {
    loc = l;
    vel = v;
    this.s = s;
    ms = s;
    lifespan = 120;
  }

  void drawParticles() {
    strokeWeight(1+s/10);
    fill(255, lifespan);
    ellipse(loc.x, loc.y, s, s); 
    if (s > 0) {
      s-=0.3;
    } else {
      s = ms;
      PVector newVel = new PVector(-50, 0);
      newVel.normalize();                               //Normalizing(making independent from bg)
      newVel.mult(6);                                   //Particle movement multiplication
      newVel.y = random(-3, -1);
      newVel.x += random(-1, 1);
      update(new PVector(car.partX, car.partY), newVel);
    }
  }

  void update(PVector l, PVector v) {
    loc = l; 
    vel = v;
    lifespan -= 30;
    if (lifespan<=40) {
      lifespan=120;
    }
  }

  void move() {
    loc.add(vel);
  }

  void changeLocation(float newPosition) {
    loc.y = newPosition;
  }
  //Creating boolean to check if the Particles lifespan lower than 40 or not
  boolean isDead() {
    if (lifespan <= 40) {
      return true;
    } else {
      return false;
    }
  }
}
