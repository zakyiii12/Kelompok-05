float x, y;
String name;

void setup() {
  x = width/2;
  y = height/2;
  size(500, 500);
  name = "Muhammad Ramadanil";
}

void draw () {
  background(5);
  fill(255);
  stroke(255);
  strokeWeight(3);
  line(x - 110, y + 50, x - 135, y + 80);
  ellipse(170, 250, 10, 10);
  ellipse(170, 280, 10, 10);
  line(x - 20, y + 50, x - 45, y + 80);
  line(x + 10, y + 00, x - 15, y + 30);
  line(x + 35, y + 50, x + 10, y + 80);
  line(x + 55, y + 50, x + 80, y + 80);
  line(x + 100, y - 20, x + 100, y + 60);
  line(x + 115, y - 20, x + 170, y + 20);
}
