import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
ArrayList<AudioPlayer> sounds = new ArrayList<AudioPlayer>();

PImage img;
PImage[] motor = new PImage[3]; // 3 Jumlah frame dalam GIF setelah di SPLIT
PImage[] frame = new PImage[2];
PImage[] burung = new PImage[14];
PImage[] bulan = new PImage[15];

int motorX = -500;
int frameX = -500;
int burungX = width + 500;
int bulanX = -500;

float[] volumes = new float[4]; // Array untuk menyimpan volume setiap suara
float volumeIncrement = 0.1; // Jumlah perubahan volume saat tombol ditekan

void setup() {
  size(1000, 600);
  smooth();
  minim = new Minim(this);
  
  // Menambahkan suara
  addSound("Angin.mp3");
  addSound("Burung.mp3");
  addSound("Motor1.mp3");
  addSound("Motor2.mp3");
  
  // Background
  img = loadImage("jalan.jpg");

  // Motor Pertama
  motor[0] = loadImage("motor_1.gif");
  motor[1] = loadImage("motor_2.gif");
  motor[2] = loadImage("motor_3.gif");
  
  // Motor Kedua
  frame[0] = loadImage("frame1.gif");
  frame[1] = loadImage("frame2.gif");
  
  // Burung Hantu
  burung[0] = loadImage("burung1.gif");
  burung[1] = loadImage("burung2.gif");
  burung[2] = loadImage("burung3.gif");
  burung[3] = loadImage("burung4.gif");
  burung[4] = loadImage("burung5.gif");
  burung[5] = loadImage("burung6.gif");
  burung[6] = loadImage("burung7.gif");
  burung[7] = loadImage("burung8.gif");
  burung[8] = loadImage("burung9.gif");
  burung[9] = loadImage("burung10.gif");
  burung[10] = loadImage("burung11.gif");
  burung[11] = loadImage("burung12.gif");
  burung[12] = loadImage("burung13.gif");
  burung[13] = loadImage("burung14.gif");
  
  // Bulan
  bulan[0] = loadImage("bulan01.gif");
  bulan[1] = loadImage("bulan02.gif");
  bulan[2] = loadImage("bulan03.gif");
  bulan[3] = loadImage("bulan04.gif");
  bulan[4] = loadImage("bulan05.gif");
  bulan[5] = loadImage("bulan06.gif");
  bulan[6] = loadImage("bulan07.gif");
  bulan[7] = loadImage("bulan08.gif");
  bulan[8] = loadImage("bulan08.gif");
  bulan[9] = loadImage("bulan010.gif");
  bulan[10] = loadImage("bulan11.gif");
  bulan[11] = loadImage("bulan12.gif");
  bulan[12] = loadImage("bulan13.gif");
  bulan[13] = loadImage("bulan14.gif");
  bulan[14] = loadImage("bulan15.gif");
    
  frameRate(30); // Mengatur kecepatan gerak GIF agar terlihat smooth

  // Inisialisasi volume awal setiap suara
  for (int i = 0; i < sounds.size(); i++) {
    volumes[i] = 1.0; // Volume awal adalah 1.0 (maksimum)
    setVolume(sounds.get(i), volumes[i]); // Mengatur volume awal setiap suara
  }
}

void draw() {
  image(img, 0, 0, width, height);
  pushMatrix();
  scale(0.7); // Mengatur ukuran GIF
  image(motor[frameCount % 3], motorX, 280); // %3 Jumlah frame, 280 Mengatur posisi GIF ke atas / ke bawah
  motorX = motorX + 40; // 25 Kecepatan gerak GIF ke arah kanan
  if (motorX > width + 400) { // + 400 Titik akhir GIF
    motorX = -500; // Titik awal GIF
  }
  
  popMatrix();
  pushMatrix();
  image(frame[frameCount % 2], frameX, 240);
  frameX = frameX + 30;
  if (frameX > width) {
    frameX = -500;
  }
  
  popMatrix();
  pushMatrix();
  scale(0.4);
  image(bulan[frameCount % 15], 10, 30);
  bulanX = bulanX - 0;
  if (bulanX > width) {
    bulanX = 500;
  }
  
  popMatrix();
  pushMatrix();
  scale(0.2);
  image(burung[frameCount % 14], burungX, 100);
  
  burungX = burungX - 20; // Bergerak dari kanan ke kiri
  if (burungX < -500) { // Muncul kembali dari kanan setelah melewati kiri
    burungX = width + 4000;
  }
  
  popMatrix();  

  if (keyPressed) {
    if (key == 'q') { // Mengecilkan volume suara pertama (Angin.mp3)
      adjustVolume(0, -volumeIncrement);
    } else if (key == 'w') { // Memperbesar volume suara pertama (Angin.mp3)
      adjustVolume(0, volumeIncrement);
    } else if (key == 'a') { // Mengecilkan volume suara kedua (Burung.mp3)
      adjustVolume(1, -volumeIncrement);
    } else if (key == 's') { // Memperbesar volume suara kedua (Burung.mp3)
      adjustVolume(1, volumeIncrement);
    } else if (key == 'z') { // Mengecilkan volume suara ketiga (Motor1.mp3)
      adjustVolume(2, -volumeIncrement);
    } else if (key == 'x') { // Memperbesar volume suara ketiga (Motor1.mp3)
      adjustVolume(2, volumeIncrement);
    } else if (key == 'c') { // Mengecilkan volume suara keempat (Motor2.mp3)
      adjustVolume(3, -volumeIncrement);
    } else if (key == 'v') { // Memperbesar volume suara keempat (Motor2.mp3)
      adjustVolume(3, volumeIncrement);
    }
  }
}

void stop() {
  for (AudioPlayer sound : sounds) {
    if (sound != null) sound.close();
  }
  minim.stop();
  super.stop();
}

void addSound(String filename) {
  AudioPlayer sound = minim.loadFile(filename);
  if (sound == null) {
    println("=== Error ===");
    println("=== Couldn't load the file " + filename + " ===");
  } else {
    sounds.add(sound);
    sound.loop();
  }
}

void adjustVolume(int index, float increment) {
  volumes[index] += increment; // Menambah/mengurangi volume suara
  volumes[index] = constrain(volumes[index], 0.0, 1.0); // Membatasi volume antara 0.0 dan 1.0
  setVolume(sounds.get(index), volumes[index]); // Mengatur volume suara baru
}

void setVolume(AudioPlayer player, float volume) {
  // Mengatur volume dengan mengatur amplitudo sinyal
  player.setGain(20 * (volume - 1)); // Konversi volume ke desibel untuk gain
}
