float angle;
float x, y;
int radius = 100;

void setup() {
  size(900, 600, P3D);
  float deltaX = -7 - radius*4;
  float deltaY = -radius*1.5;
  angle = atan2(deltaX, deltaY);

}

void draw() {
  background(255);
  
  
  fill(0);
  noStroke();
  pushMatrix();
  translate(width/2, height/2, 0);
  sphere(radius);
  popMatrix();
  
  noFill();
  stroke(#A5A5A5);
  strokeWeight(4);
  
  pushMatrix();
  translate(width/2, height/2, 80);
  rotateX(20);
  rotateY(-0.2);
  ellipse(-7, 0, radius*4, radius*1.5);
  x = 1.9*cos(angle)*radius;
  y = sin(angle)*radius;
  translate(x, y);
  noFill();
  sphere(15);
  popMatrix();
  
  
  angle += 0.05;
  println(angle);
}
