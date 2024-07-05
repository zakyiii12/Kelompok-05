float angle = 0;
float scale = 1;
float tx = 0, ty = 0;
float moveX = 1; // Variabel baru untuk mengontrol pergerakan horizontal
float moveY = 1; // Variabel baru untuk mengontrol pergerakan vertikal

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(angle);
  scale(scale);
  translate(tx, ty);
  drawShape();
  
  angle += 0.01; // Mengatur rotasi
  scale += 0.01; // Mengatur skala
  
  // Mengontrol pergerakan objek
  tx += moveX;
  ty += moveY;
  
  // Memantulkan objek saat mencapai tepi layar
  if (tx > width/2 - 100 || tx < -width/2 + 100) {
    moveX *= -1; // Membalikkan arah horizontal
  }
  if (ty > height/2 - 100 || ty < -height/2 + 100) {
    moveY *= -1; // Membalikkan arah vertikal
  }
}

void drawShape() {
  for (int i = 0; i < 300; i += 30) {
    pushMatrix();
    rotate(radians(i));
    fill(map(i, 0, 360, 0, 255), 255, 255);
    rect(100, 0, 50, 20);
    popMatrix();
  }
}
