void setup()
{
  size(200, 200);
  background(255);
  smooth();
  translate(60,60);
  drawRobot();
}

void drawRobot()
{
  noStroke();
  fill(38, 38, 200);
  rect(20, 0, 38, 30); // head
  rect(14, 32, 50, 50); // body
  fill(100, 222, 249);
  
  drawLeftArm();
  drawRightArm();
  
  drawLeftLeg();
  drawRightLeg();

  fill(222, 50, 100);
  ellipse(30, 12, 12, 12); // left eye
  ellipse(47, 12, 12, 12);  // right eye
}

void drawRightLeg()
{
  pushMatrix();
  translate(66,84);
  rotate(radians(270));
  rect(0, 0, 12, 50);
  popMatrix();
}

void drawLeftLeg()
{
  pushMatrix();
  translate(12,84);
  rotate(radians(90));
  rect(-12, 0, 12, 37);
  popMatrix();
}



void drawLeftArm()
{
  pushMatrix();
  translate(12, 32);
  rotate(radians(315));
  rect(-12, 0, 12, 37);
  popMatrix();
}

void drawRightArm()
{
  pushMatrix();
  translate(66, 32);
  rotate(radians(320));
  rect(0, 0, 12, 37);
  popMatrix();
}
