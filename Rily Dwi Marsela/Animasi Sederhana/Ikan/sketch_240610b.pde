PImage img;
PImage[] fish = new PImage[8];
ArrayList<Fish> fishes = new ArrayList<Fish>();
int numFishes = 10; // Jumlah ikan yang akan dibuat
float fishScale = 0.5;  // Skala ukuran ikan

void setup() {
  size(1000, 600);
  smooth();
  img = loadImage("background.jpg");
  fish[0] = loadImage("frame_0_delay-0.15s.gif");
  fish[1] = loadImage("frame_1_delay-0.15s.gif");
  fish[2] = loadImage("frame_2_delay-0.15s.gif");
  fish[3] = loadImage("frame_3_delay-0.15s.gif");
  fish[4] = loadImage("frame_4_delay-0.15s.gif");
  fish[5] = loadImage("frame_5_delay-0.15s.gif");
  fish[6] = loadImage("frame_6_delay-0.15s.gif");
  fish[7] = loadImage("frame_7_delay-0.15s.gif");

  // Membuat banyak ikan
  for (int i = 0; i < numFishes; i++) {
    fishes.add(new Fish(random(width), random(height), fish, fishScale));
  }

  frameRate(10);
}

void draw() {
  image(img, 0, 0, width, height);

  // Gambar dan update setiap ikan
  for (Fish f : fishes) {
    f.update();
    f.display();
  }
}

// Kelas Fish untuk merepresentasikan ikan
class Fish {
  float x, y;
  PImage[] fishImages;
  float scale;
  int direction;  // 1 untuk ke kanan, -1 untuk ke kiri
  float speed;

  Fish(float startX, float startY, PImage[] images, float s) {
    x = startX;
    y = startY;
    fishImages = images;
    scale = s;
    direction = random(1) > 0.5 ? 1 : -1;
    speed = random(2, 5);
  }

  void update() {
    x += speed * direction;
    if (x > width || x < -fishImages[0].width * scale) {
      // Reset posisi dan arah ikan jika keluar layar
      x = direction == 1 ? -fishImages[0].width * scale : width;
      y = random(height);
      direction *= -1;
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);  // Terjemahkan posisi ikan
    if (direction == -1) {  // Balik gambar ikan jika arahnya ke kiri
      scale(-scale, scale);  // Skala negatif untuk membalik secara horizontal
      image(fishImages[frameCount % 8], -fishImages[frameCount % 8].width, 0);  // Atur posisi gambar
    } else {  // Gambar ikan normal jika arahnya ke kanan
      scale(scale, scale);
      image(fishImages[frameCount % 8], 0, 0);
    }
    popMatrix();
  }
}
