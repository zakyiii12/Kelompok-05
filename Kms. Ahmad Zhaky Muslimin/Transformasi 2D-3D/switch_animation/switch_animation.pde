int idx = 0;
PImage[] among_us = new PImage[25];
PImage[] astronaut_sink = new PImage[66];
PImage[] astronaut_surf = new PImage[73];
PImage[] grassfield = new PImage[50];
PImage[] txt = new PImage[72];

void setup() {
  size( 600, 1000 );
  smooth();

  for (int i = 0; i <= 24; i++) {
    among_us[i] = loadImage("among_us/frame_" + String.valueOf(i) + "_delay-0.2s.gif");
  }

  for (int i = 0; i <= 65; i++) {
    astronaut_sink[i] = loadImage("astronaut_sink/frame_" + String.valueOf(i) + "_delay-0.2s.gif");
  }

  for (int i = 0; i <= 72; i++) {
    astronaut_surf[i] = loadImage("astronaut_surf/frame_" + String.valueOf(i) + "_delay-0.2s.gif");
  }

  for (int i = 0; i <= 49; i++) {
    grassfield[i] = loadImage("grassfield/frame_" + String.valueOf(i) + "_delay-0.2s.gif");
  }

  for (int i = 0; i <= 71; i++) {
    txt[i] = loadImage("txt/frame_" + String.valueOf(i) + "_delay-0.03s.gif");
  }

  frameRate( 12 );
}


void draw() {
  imageMode(CENTER);

  switch (idx) {
  case 0:
    image( among_us[frameCount%25], width/2, height/2 );
    break;
  case 1:
    image( astronaut_sink[frameCount%66], width/2, height/2 );
    break;
  case 2:
    image( astronaut_surf[frameCount%73], width/2, height/2 );
    break;
  case 3:
    image( grassfield[frameCount%50], width/2, height/2 );
    break;
  }

  pushMatrix();
  scale(0.5);
  image( txt[frameCount%72], width/2 + 310, height/2 + 1300);
  popMatrix();
}

void keyPressed() {
  if (key == ' ') {
    idx = (idx + 1)%4;
  }
}
