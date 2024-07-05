Eye e2, e3;

// Variabel untuk mengontrol kecepatan gerakan ke atas
float speed = 1;

// Variabel untuk posisi objek badan
float bodyY = 360;

void setup() {
  size(640, 360);
  noStroke();
  e2 = new Eye(280, bodyY - 230, 80);  
  e3 = new Eye(360, bodyY - 230, 80);  
}

void draw() {
  background(102);
  
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);

  // Gambar objek badan yang bergerak ke atas
  noFill();
  circle(420, bodyY - 100, 60); 
  circle(220, bodyY - 100, 60); 
  circle(220, bodyY - 160, 60); 
  circle(420, bodyY - 160, 60); 

  noFill();
  stroke(5);
  strokeWeight(5);
  fill(230);
  circle(260, bodyY - 130, 100); 
  circle(380, bodyY - 130, 100);

  fill(0);
  circle(320, bodyY - 210, 130); 

  fill(0); 
  circle(320, bodyY - 135, 50);  
  circle(320, bodyY - 95, 30);  
  circle(320, bodyY - 73, 10);  

  e2.display();
  e3.display();

  // Perbarui posisi y objek badan untuk bergerak ke atas
  updateBodyPosition();
}

class Eye {
  float x, y;
  int size;
  float angle = 0.0;
  
  Eye(float tx, float ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my - y, mx - x);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0, 204, 0);
    ellipse(size / 4, 0, size / 2, size / 2);
    popMatrix();
  }
  
  // Perbarui posisi y objek Eye untuk bergerak ke atas
  void moveUp(float speed) {
    y -= speed;
    if (y < -size / 2) {
      y = height + size / 2;  // Kembali ke bawah layar jika sudah melewati atas layar
    }
  }
}

// Fungsi untuk memperbarui posisi objek badan agar bergerak ke atas
void updateBodyPosition() {
  bodyY -= speed;
  if (bodyY < 0) {
    bodyY = height + 300;  // Kembali ke bawah layar jika sudah melewati atas layar
  }

  // Perbarui posisi mata
  e2.y = bodyY - 230;
  e3.y = bodyY - 230;
}
