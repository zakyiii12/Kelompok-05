PImage[] red_witch = new PImage[9];
PImage[] blue_witch = new PImage[5];
PImage[] blue_witch_attack = new PImage[9];
boolean attack = false;

void setup() {
  size( 700, 400);
  smooth();

  for (int i = 0; i <= 8; i++) {
    red_witch[i] = loadImage("RedWitch/Idle" + String.valueOf(i) + ".png");
  }

  for (int i = 0; i <= 4; i++) {
    blue_witch[i] = loadImage("BlueWitch/tile00" + String.valueOf(i) + ".png");
  }

  for (int i = 0; i <= 8; i++) {
    blue_witch_attack[i] = loadImage("BlueWitchAttack/tile00" + String.valueOf(i) + ".png");
  }
}

void draw() {
  background(51);
  imageMode(CENTER);
  pushMatrix();
  scale(2);
  image( red_witch[frameCount%9], width/2 - 220, height/2 - 95);
  popMatrix();

  pushMatrix();
  scale(2.3);
  if(!attack) {
    image( blue_witch[frameCount%5], width/2 - 160, height/2 -110);
  } else {
    image( blue_witch_attack[frameCount%9], width/2 - 190, height/2 -110);
  }
  popMatrix();

  frameRate(13);
}

void keyPressed() {
  if (key == ' ') {
    attack = !attack;
  }
}
