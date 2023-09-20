class Arrays {
  void displayArrays() {
    //Creating rain array
    rain= new Rain[300];
    for (int i=0; i<rain.length; i++) {
      rain[i]=new Rain();
    }
    //Creating dash array
    int k=0; 
    dash= new Dash[5];
    for (int i = 0; i<dash.length; i++) {
      k=k+width/4;
      dash[i]= new Dash(k);
    }
    //Creating cloud array
    clouds = new Clouds[20];
    clandback = new Clouds();
    for (int i = 0; i<clouds.length; i++) {
      clouds[i] = new Clouds();
    }
    //Creating block array
    int h=1300;
    block= new Block[400];
    for (int i = 0; i<block.length; i++) {
      h=h+500;
      block[i]= new Block(h);
    }
  }
}
