int armAngle = 0;
int angleChange = 3;
final int ANGLE_LIMIT = 60;


void setup()
{
  size(200, 200);
}

void draw()
{
  background(255);
  pushMatrix();
  translate(width/2 - 38, height/2 - 60);
  drawRobot();
  armAngle += angleChange;

  if (armAngle > ANGLE_LIMIT || armAngle < 0)
  {
    angleChange = -angleChange;
    armAngle += angleChange;
  }
  popMatrix();
}

void drawRobot()
{
  noStroke();
  fill(255, 0, 0);
  rect(20, 0, 38, 30); // head
  rect(14, 32, 50, 50); // body

  rect(0, 32, 12, 37); // left arm
  rect(66, 32, 12, 37); // right arm
  
  pushMatrix();
  translate(22, 84);
  rotate(radians(armAngle));
  rect(0, 0, 16, 50); // left leg
  popMatrix();
  
  pushMatrix();
  translate(40 + 16, 84);
  rotate(radians(-armAngle));
  rect(-16, 0, 16, 50); // right leg
  popMatrix();

  fill(222, 222, 249);
  ellipse(30, 12, 12, 12); // left eye
  ellipse(47, 12, 12, 12); // right eye
}
