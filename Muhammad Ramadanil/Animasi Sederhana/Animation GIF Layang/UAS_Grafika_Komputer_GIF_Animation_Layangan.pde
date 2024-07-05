import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
ArrayList<AudioPlayer> sounds = new ArrayList<AudioPlayer>();

PImage img;
PImage[] layangan = new PImage[8];
PImage[] layang = new PImage[8];
PImage[] matahari = new PImage[4];
PImage[] bunga = new PImage[8];
PImage[] ayam = new PImage[7];

int layanganX = - 500;
int layangX = - 500;
int matahariX = - 500;
int bungaX = - 500;
int bungaX1 = - 500;
int bungaX2 = - 500;
int ayamX = - 500;

float[] volumes = new float[1];

void setup () {
  size (1000, 600);
  smooth();
  minim = new Minim(this);
  
  addSound("Bermain.mp3");
  addSound("Angin.mp3");
    
  img = loadImage ("Lapangan.jpg");
  
  layangan[0] = loadImage ("Layangan.gif");
  layangan[1] = loadImage ("Layangan1.gif");
  layangan[2] = loadImage ("Layangan2.gif");
  layangan[3] = loadImage ("Layangan3.gif");
  layangan[4] = loadImage ("Layangan4.gif");
  layangan[5] = loadImage ("Layangan5.gif");
  layangan[6] = loadImage ("Layangan6.gif");
  layangan[7] = loadImage ("Layangan7.gif");
  
  layang[0] = loadImage ("layang.gif");
  layang[1] = loadImage ("layang1.gif");
  layang[2] = loadImage ("layang2.gif");
  layang[3] = loadImage ("layang3.gif");
  layang[4] = loadImage ("layang4.gif");
  layang[5] = loadImage ("layang5.gif");
  layang[6] = loadImage ("layang6.gif");
  layang[7] = loadImage ("layang7.gif");
  
  matahari[0] = loadImage ("Matahari.gif");
  matahari[1] = loadImage ("Matahari1.gif");
  matahari[2] = loadImage ("Matahari2.gif");
  matahari[3] = loadImage ("Matahari3.gif");
  
  bunga[0] = loadImage ("Bunga.gif");
  bunga[1] = loadImage ("Bunga1.gif");
  bunga[2] = loadImage ("Bunga2.gif");
  bunga[3] = loadImage ("Bunga3.gif");
  bunga[4] = loadImage ("Bunga4.gif");
  bunga[5] = loadImage ("Bunga5.gif");
  bunga[6] = loadImage ("Bunga6.gif");
  bunga[7] = loadImage ("Bunga7.gif");
  
  ayam[0] = loadImage ("Ayam.gif");
  ayam[1] = loadImage ("Ayam1.gif");
  ayam[2] = loadImage ("Ayam2.gif");
  ayam[3] = loadImage ("Ayam3.gif");
  ayam[4] = loadImage ("Ayam4.gif");
  ayam[5] = loadImage ("Ayam5.gif");
  ayam[6] = loadImage ("Ayam6.gif");

  
  frameRate (5);

}

void draw() {
  
  image (img, 0, 0, width, height);
  
  pushMatrix();
  scale(0.2);
  image (layangan[frameCount%8], 2400, 800); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  layanganX = layanganX - 0;
    if (layanganX > width) {
      layanganX = 500;
    }
    
  popMatrix(); 
  
  pushMatrix();
  scale(0.2);
  image (layang[frameCount%8], 1800, 1550); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  layangX = layangX - 0;
    if (layangX > width) {
      layangX = 500;
    }
    
  popMatrix(); 
  
  pushMatrix();
  scale(0.3);
  image (bunga[frameCount%8], 2350, 1820); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  bungaX = bungaX - 0;
    if (bungaX > width) {
      bungaX = 500;
    }
    
  popMatrix(); 
  
  pushMatrix();
  scale(0.2);
  image (bunga[frameCount%8], 3450, 2800); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  bungaX1 = bungaX1 - 0;
    if (bungaX1 > width) {
      bungaX1 = 500;
    }
    
  popMatrix(); 
  
  pushMatrix();
  scale(0.2);
  image (bunga[frameCount%8], 3700, 2800); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  bungaX2 = bungaX2 - 0;
    if (bungaX2 > width) {
      bungaX2 = 500;
    }
    
  popMatrix(); 
  
  pushMatrix();
  scale(0.4);
  image (ayam[frameCount%7], 1150, 1200); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  ayamX = ayamX - 0;
    if (ayamX > width) {
      ayamX = 500;
    }
    
  popMatrix(); 
  
  pushMatrix();
  scale(0.3);
  image (matahari[frameCount%4], 10, 15); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  matahariX = matahariX - 0;
    if (matahariX > width) {
      matahariX = 500;
    }
    
  popMatrix(); 

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
