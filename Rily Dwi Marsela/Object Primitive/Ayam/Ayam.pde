Turkey turkeyA;
void setup() {
  size(800, 800);
  turkeyA = new Turkey(800, 800);
}

void draw() {
  background(255, 30, 51);
  turkeyA.display();
}

class Turkey {
  int x, y;

  Turkey(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  void display() {
    fill(255, 250, 125);
    ellipse(250, 300, 50, 300);
    fill(255, 250, 125);
    ellipse(300, 250, 50, 300);
    fill(400, 400, 400);
    ellipse(400, 200, 50, 300);
    fill(0, 255, 100);
    ellipse(350, 225, 50, 300);
    fill(100, 300, 100);
    ellipse(450, 225, 50, 300);
    fill(300, 100, 300);
    ellipse(300, 250, 50, 300);
    fill(255, 0, 255);
    ellipse(250, 300, 50, 300);
    fill(400, 0, 400);
    ellipse(500, 275, 50, 300);
    fill(#B634F7);
    ellipse(550, 300, 50, 300);
    fill(#FFF36C);
    ellipse(400, 400, 300, 300);
    ellipse(400, 250, 150, 150);
    fill(255);
    ellipse(375, 220, 50, 50);
    ellipse(425, 220, 50, 50);
    fill(0);
    ellipse(380, 225, 25, 25);
    ellipse(420, 225, 25, 25);
    fill(255);
    ellipse(400, 275, 50, 50);
    fill(100, 250, 125);

  }
}
