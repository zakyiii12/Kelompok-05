int x, y;
int s1, s2, s3;
Star[] stars = new Star[400];

int posx=width + 250;
float posy=-300;


void setup() {
  size(600, 800);
  x = width/2;
  y = height + 100;

  s1 = 0;
  s2 = 0;
  s3 = 0;

  for (int i = 0; i < 400; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(51);
  for (int i = 0; i < stars.length; i++) {
    stars[i].draw();
  }

  pushMatrix();
  rotate(45);
  meteorit(posx, posy);
  posy=posy + random(-0.4, 0.6);
  if (posy>=height) {
    posy=0;
    posx=posx+ 10;
  }
  popMatrix();

  noStroke();


  stroke(255);
  strokeWeight(5);
  fill(#C1C0D8);
  beginShape();
  vertex(x, y - 60);
  vertex(x + 20, y - 30);
  vertex(x + 20, y + 180);
  vertex(x - 20, y + 180);
  vertex(x - 20, y - 30);
  endShape(CLOSE);
  fill(#52508E);
  triangle(x - 20, y, x - 90, y + 75, x - 20, y + 75);
  triangle(x + 20, y, x + 90, y + 75, x + 20, y + 75);
  triangle(x - 20, y + 75, x - 65, y + 130, x - 20, y + 130);
  triangle(x + 20, y + 75, x + 65, y + 130, x + 20, y + 130);
  noStroke();
  fill(#9F9EC1);
  ellipse(x, y + 10, 25, 50);

  fill(#52508E);
  rect(x - 10, y + 120, 20, 80);

  fill(#FC7D7F);
  stroke(255);
  strokeWeight(2);
  ellipse(x, y + 220, s1, s1);
  ellipse(x, y + 245, s2, s2);
  ellipse(x, y + 260, s3, s3);

  pushMatrix();
  translate(width/2 + 190, height - 110);
  rotate(radians(frameCount));
  fill(255);
  for (int i = 0; i < 8; i++) {
    ellipse(0, -50, 30, 20);
    rotate(radians(360/5));
  }

  fill(#DBCEDB);
  ellipse(0, 0, 50, 50);
  popMatrix();

  if (y < -200) {
    y = height + 100;
  }

  y -= 4;
  s1 += 3;
  s2 += 2;
  s3 += 1;

  if (s1 > 25) {
    s1 = 0;
  };

  if (s2 > 15) {
    s2 = 0;
  };

  if (s3 > 7) {
    s3 = 0;
  };
}

class Star {
  float x, y, size, t;
  Star() {
    x = random(width);
    y = random(height);
    size = random(0.5, 2);
    t = random(TAU);
  }

  void draw() {
    t += 0.05;
    float scale = size + sin(t) * 1;
    noStroke();
    ellipse(x, y, scale, scale);
  }
}

void meteorit (int posx, float posy) {

  for (int i=1; i<=40; i++) {
    stroke(13, 255, 225, 80/i);
    strokeWeight(160.0+i);
    strokeCap(ROUND);
    line(posx, posy-800, posx, posy);
  }

  stroke(13, 255, 225);
  strokeWeight(160.0);
  strokeCap(ROUND);
  line(posx, posy-800, posx, posy);

  stroke(72, 60, 107);
  strokeWeight(140.0);
  strokeCap(ROUND);
  line(posx, posy-160, posx, posy);

  stroke(72, 60, 107);
  strokeWeight(20.0);
  strokeCap(ROUND);
  line(posx-60, posy-220, posx-60, posy);
  stroke(72, 60, 107);
  strokeWeight(20.0);
  strokeCap(ROUND);
  line(posx-20, posy-300, posx-20, posy);
  stroke(72, 60, 107);
  strokeWeight(20.0);
  strokeCap(ROUND);
  line(posx+20, posy-250, posx+20, posy);
  stroke(72, 60, 107);
  strokeWeight(20.0);
  strokeCap(ROUND);
  line(posx+60, posy-200, posx+60, posy);

  stroke(13, 255, 225);
  strokeWeight(20.0);
  strokeCap(ROUND);
  line(posx-40, posy-220, posx-40, posy-170);
  stroke(13, 255, 225);
  strokeWeight(20.0);
  strokeCap(ROUND);
  line(posx, posy-250, posx, posy-220);
  stroke(13, 255, 225);
  strokeWeight(21.0);
  strokeCap(ROUND);
  line(posx+41, posy-300, posx+41, posy-180);

  stroke(255, 33, 123);
  strokeWeight(119.0);
  strokeCap(ROUND);
  line(posx, posy-70, posx, posy);

  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-56, posy-110, posx-56, posy-50);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-42, posy-120, posx-42, posy-90);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-28, posy-140, posx-28, posy-90);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-14, posy-140, posx-14, posy-90);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx, posy-155, posx, posy-90);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+14, posy-130, posx+14, posy-90);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+28, posy-145, posx+28, posy-90);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+42, posy-125, posx+42, posy-90);
  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+56, posy-110, posx+56, posy-80);

  stroke(223, 29, 108);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-49, posy-150, posx-49, posy-50);
  stroke(223, 29, 108);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-35, posy-150, posx-35, posy-80);
  stroke(223, 29, 108);//3
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-21, posy-150, posx-21, posy-60);
  stroke(223, 29, 108);//4
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-7, posy-150, posx-7, posy-70);
  stroke(223, 29, 108);//5
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+7, posy-150, posx+7, posy-50);
  stroke(223, 29, 108);//6
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+21, posy-150, posx+21, posy-40);
  stroke(223, 29, 108);//6
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+35, posy-150, posx+35, posy-65);
  stroke(223, 29, 108);//6
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+49, posy-150, posx+49, posy-75);


  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-49, posy-150, posx-49, posy-70);
  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-35, posy-150, posx-35, posy-100);
  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-21, posy-150, posx-21, posy-80);
  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-7, posy-150, posx-7, posy-90);
  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+7, posy-150, posx+7, posy-70);
  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+21, posy-150, posx+21, posy-60);
  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+35, posy-150, posx+35, posy-85);
  stroke(72, 60, 107);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+49, posy-150, posx+49, posy-95);

  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx-56, posy-135, posx-56, posy-125);

  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+14, posy-160, posx+14, posy-145);

  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+14, posy-180, posx+14, posy-175);

  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+56, posy-124, posx+56, posy-127);

  stroke(255, 33, 123);
  strokeWeight(7.0);
  strokeCap(ROUND);
  line(posx+56, posy-140, posx+56, posy-150);
}
