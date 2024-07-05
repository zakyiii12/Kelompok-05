PImage[] Panda = new PImage[12];
PImage[] Panda02 = new PImage[7];
PImage[] Panda03 = new PImage[40];

void setup() {
  size( 1000, 800 );
  smooth();

  for (int i = 0; i <= 11; i++) {
    Panda[i] = loadImage("Panda/frame_" + String.valueOf(i) + "_delay-0.01s.gif");
  }

  for (int i = 0; i <= 6; i++) {
    Panda02[i] = loadImage("Panda_02/frame_" + String.valueOf(i) + "_delay-0.2s.gif");
  }

  for (int i = 0; i <= 39; i++) {
    Panda03[i] = loadImage("Panda_03/frame_" + String.valueOf(i) + "_delay-0.03s.gif");
  }

  frameRate(25);
}

void draw() {
  imageMode(CENTER);
  background(255);
  pushMatrix();
  image( Panda[frameCount%12], width/2 - 300, height/2 );
  popMatrix();
  pushMatrix();
  image( Panda02[frameCount%7], width/2, height/2 );
  popMatrix();
  pushMatrix();
  scale(0.7);
  image( Panda03[frameCount%40], width/2 + 650, height/2 + 200);
  popMatrix();
}
