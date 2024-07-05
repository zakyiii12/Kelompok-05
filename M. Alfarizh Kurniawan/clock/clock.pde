void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);

  // Draw flower petals
  int numPetals = 12;
  float petalLength = 250;  // Increased petal length
  float petalWidth = 460;   // Increased petal width

  for (int i = 0; i < numPetals; i++) {
    float angle = i * TWO_PI / numPetals;
    drawPetal(angle, petalLength, petalWidth);
  }

  // Draw clock face
  fill(255);
  stroke(0);
  ellipse(0, 0, 350, 350);  // Increased clock face size

  // Draw clock numbers
  textSize(32);
  textAlign(CENTER, CENTER);
  for (int i = 1; i <= 12; i++) {
    float angle = TWO_PI / 12 * i - HALF_PI;
    float x = cos(angle) * 150; // Position numbers closer to the edge
    float y = sin(angle) * 150;
    fill(0);
    text(i, x, y);
  }

  // Get current time
  float s = second();
  float m = minute() + s / 60.0;
  float h = hour() % 12 + m / 60.0;

  // Draw clock hands
  strokeWeight(8);
  stroke(255, 0, 0);
  line(0, 0, cos(TWO_PI * s / 60 - HALF_PI) * 140, sin(TWO_PI * s / 60 - HALF_PI) * 140); // Second hand

  strokeWeight(10);
  stroke(0);
  line(0, 0, cos(TWO_PI * m / 60 - HALF_PI) * 100, sin(TWO_PI * m / 60 - HALF_PI) * 100); // Minute hand

  strokeWeight(12);
  line(0, 0, cos(TWO_PI * h / 12 - HALF_PI) * 70, sin(TWO_PI * h / 12 - HALF_PI) * 70); // Hour hand

  // Draw clock center
  fill(0);
  ellipse(0, 0, 20, 20);
}

void drawPetal(float angle, float length, float width) {
  pushMatrix();
  rotate(angle);
  fill(255, 0, 0);
  noStroke();
  beginShape();
  vertex(0, 0);
  bezierVertex(width / 2, -length / 4, width / 2, -3 * length / 4, 0, -length);
  bezierVertex(-width / 2, -3 * length / 4, -width / 2, -length / 4, 0, 0);
  endShape(CLOSE);
  popMatrix();
}
