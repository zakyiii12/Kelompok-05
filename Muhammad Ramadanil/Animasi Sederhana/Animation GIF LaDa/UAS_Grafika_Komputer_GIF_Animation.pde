import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
ArrayList<AudioPlayer> sounds = new ArrayList<AudioPlayer>();

PImage img;
PImage[] fish = new PImage[8];
PImage[] ikan = new PImage[3];
PImage[] paus = new PImage[24];
PImage[] badut = new PImage[27];
PImage[] duyung = new PImage[40];
PImage[] bubble = new PImage[30];
PImage[] kepiting = new PImage[8];

int fishX = -100;
int fishX2 = -100;
int fishX3 = -100;
int ikanX = -100;
int pausX = width + 1000;
int badutX = width + 10000;
int badutX2 = width + 10000;
int badutX3 = width + 10000;
int badutX4 = width + 10000;
int duyungX = width + 500;
int bubbleX = - 500;
int kepitingX = - 500;
int kepitingX2 = - 500;
int kepitingX3 = - 500;

float[] volumes = new float[1];

void setup() {
  size (1000, 600);
  smooth();
  minim = new Minim(this);
  
  addSound("Ikan.mp3");
  addSound("Gelembung.mp3");
  
  img = loadImage ("Aquarium.jpg");
  
  fish[0] = loadImage ("fish_01.gif");
  fish[1] = loadImage ("fish_02.gif");
  fish[2] = loadImage ("fish_03.gif");
  fish[3] = loadImage ("fish_04.gif");
  fish[4] = loadImage ("fish_05.gif");
  fish[5] = loadImage ("fish_06.gif");
  fish[6] = loadImage ("fish_07.gif");
  fish[7] = loadImage ("fish_08.gif");
  
  ikan[0] = loadImage ("Ikan.gif");
  ikan[1] = loadImage ("Ikan1.gif");
  ikan[2] = loadImage ("Ikan2.gif");


  paus[0] = loadImage ("Paus.gif");
  paus[1] = loadImage ("Paus1.gif");
  paus[2] = loadImage ("Paus2.gif");
  paus[3] = loadImage ("Paus3.gif");
  paus[4] = loadImage ("Paus4.gif");
  paus[5] = loadImage ("Paus5.gif");
  paus[6] = loadImage ("paus6.gif");
  paus[7] = loadImage ("paus7.gif");
  paus[8] = loadImage ("paus8.gif");
  paus[9] = loadImage ("paus9.gif");
  paus[10] = loadImage ("paus10.gif");
  paus[11] = loadImage ("paus11.gif");
  paus[12] = loadImage ("paus12.gif");
  paus[13] = loadImage ("paus13.gif");
  paus[14] = loadImage ("paus14.gif");
  paus[15] = loadImage ("paus15.gif");
  paus[16] = loadImage ("paus16.gif");
  paus[17] = loadImage ("paus17.gif");
  paus[18] = loadImage ("paus18.gif");
  paus[19] = loadImage ("paus19.gif");
  paus[20] = loadImage ("paus20.gif");
  paus[21] = loadImage ("paus21.gif");
  paus[22] = loadImage ("paus22.gif");
  paus[23] = loadImage ("paus23.gif");

  badut[0] = loadImage ("badut.gif");  
  badut[1] = loadImage ("badut1.gif");
  badut[2] = loadImage ("badut2.gif");
  badut[3] = loadImage ("badut3.gif");
  badut[4] = loadImage ("badut4.gif");
  badut[5] = loadImage ("badut5.gif");
  badut[6] = loadImage ("badut6.gif");
  badut[7] = loadImage ("badut7.gif");
  badut[8] = loadImage ("badut8.gif");
  badut[9] = loadImage ("badut9.gif");
  badut[10] = loadImage ("badut10.gif");
  badut[11] = loadImage ("badut11.gif");
  badut[12] = loadImage ("badut12.gif");
  badut[13] = loadImage ("badut13.gif");
  badut[14] = loadImage ("badut14.gif");
  badut[15] = loadImage ("badut15.gif");
  badut[16] = loadImage ("badut16.gif");
  badut[17] = loadImage ("badut17.gif");
  badut[18] = loadImage ("badut18.gif");
  badut[19] = loadImage ("badut19.gif");
  badut[20] = loadImage ("badut20.gif");
  badut[21] = loadImage ("badut21.gif");
  badut[22] = loadImage ("badut22.gif");
  badut[23] = loadImage ("badut23.gif");
  badut[24] = loadImage ("badut24.gif");
  badut[25] = loadImage ("badut25.gif");
  badut[26] = loadImage ("badut26.gif");
  
  duyung[0] = loadImage ("duyung.gif");
  duyung[1] = loadImage ("duyung1.gif");
  duyung[2] = loadImage ("duyung2.gif");
  duyung[3] = loadImage ("duyung3.gif");
  duyung[4] = loadImage ("duyung4.gif");
  duyung[5] = loadImage ("duyung5.gif");
  duyung[6] = loadImage ("duyung6.gif");
  duyung[7] = loadImage ("duyung7.gif");
  duyung[8] = loadImage ("duyung8.gif");
  duyung[9] = loadImage ("duyung9.gif");
  duyung[10] = loadImage ("duyung10.gif");
  duyung[11] = loadImage ("duyung11.gif");
  duyung[12] = loadImage ("duyung12.gif");
  duyung[13] = loadImage ("duyung13.gif");
  duyung[14] = loadImage ("duyung14.gif");
  duyung[15] = loadImage ("duyung15.gif");
  duyung[16] = loadImage ("duyung16.gif");
  duyung[17] = loadImage ("duyung17.gif");
  duyung[18] = loadImage ("duyung18.gif");
  duyung[19] = loadImage ("duyung19.gif");
  duyung[20] = loadImage ("duyung20.gif");
  duyung[21] = loadImage ("duyung21.gif");
  duyung[22] = loadImage ("duyung22.gif");
  duyung[23] = loadImage ("duyung23.gif");
  duyung[24] = loadImage ("duyung24.gif");
  duyung[25] = loadImage ("duyung25.gif");
  duyung[26] = loadImage ("duyung26.gif");
  duyung[27] = loadImage ("duyung27.gif");
  duyung[28] = loadImage ("duyung28.gif");
  duyung[29] = loadImage ("duyung29.gif");
  duyung[30] = loadImage ("duyung30.gif");
  duyung[31] = loadImage ("duyung31.gif");
  duyung[32] = loadImage ("duyung32.gif");
  duyung[33] = loadImage ("duyung33.gif");
  duyung[34] = loadImage ("duyung34.gif");
  duyung[35] = loadImage ("duyung35.gif");
  duyung[36] = loadImage ("duyung36.gif");
  duyung[37] = loadImage ("duyung37.gif");
  duyung[38] = loadImage ("duyung38.gif");
  duyung[39] = loadImage ("duyung39.gif");
 
  bubble[0] = loadImage ("bubble.gif");
  bubble[1] = loadImage ("bubble1.gif");
  bubble[2] = loadImage ("bubble2.gif");
  bubble[3] = loadImage ("bubble3.gif");
  bubble[4] = loadImage ("bubble4.gif");
  bubble[5] = loadImage ("bubble5.gif");
  bubble[6] = loadImage ("bubble6.gif");
  bubble[7] = loadImage ("bubble7.gif");
  bubble[8] = loadImage ("bubble8.gif");
  bubble[9] = loadImage ("bubble9.gif");
  bubble[10] = loadImage ("bubble10.gif");
  bubble[11] = loadImage ("bubble11.gif");
  bubble[12] = loadImage ("bubble12.gif");
  bubble[13] = loadImage ("bubble13.gif");
  bubble[14] = loadImage ("bubble14.gif");
  bubble[15] = loadImage ("bubble15.gif");
  bubble[16] = loadImage ("bubble16.gif");
  bubble[17] = loadImage ("bubble17.gif");
  bubble[18] = loadImage ("bubble18.gif");
  bubble[19] = loadImage ("bubble19.gif");
  bubble[20] = loadImage ("bubble20.gif");
  bubble[21] = loadImage ("bubble21.gif");
  bubble[22] = loadImage ("bubble22.gif");
  bubble[23] = loadImage ("bubble23.gif");
  bubble[24] = loadImage ("bubble24.gif");
  bubble[25] = loadImage ("bubble25.gif");
  bubble[26] = loadImage ("bubble26.gif");
  bubble[27] = loadImage ("bubble27.gif");
  bubble[28] = loadImage ("bubble28.gif");
  bubble[29] = loadImage ("bubble29.gif");
  
  kepiting[0] = loadImage ("kepiting.gif");
  kepiting[1] = loadImage ("kepiting1.gif");
  kepiting[2] = loadImage ("kepiting2.gif");
  kepiting[3] = loadImage ("kepiting3.gif");
  kepiting[4] = loadImage ("kepiting4.gif");
  kepiting[5] = loadImage ("kepiting5.gif");
  kepiting[6] = loadImage ("kepiting6.gif");
  kepiting[7] = loadImage ("kepiting7.gif");


  frameRate (20);
  
}

void draw() {
  
  image (img, 0, 0, width, height);
  
  pushMatrix();
  scale(0.6);
  image (bubble[frameCount%30], -200, 650); //  5 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  bubbleX = bubbleX - 0;
    if (bubbleX > width) {
      bubbleX = 500;
    }
    
  popMatrix();  
  
  // Kepiting atas
  pushMatrix();
  scale(0.1);
  image (kepiting[frameCount%8], 8500, 4400); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  kepitingX = kepitingX - 0;
    if (kepitingX > width) {
      kepitingX = 500;
    }

  popMatrix();  

  pushMatrix();
  scale(0.1);
  image (kepiting[frameCount%8], 9200, 4800); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  kepitingX2 = kepitingX2 - 0;
    if (kepitingX2 > width) {
      kepitingX2 = 500;
    }  
    
  popMatrix();  
  
  pushMatrix();
  scale(0.1);
  image (kepiting[frameCount%8], 7500, 5000); //  -200 Makin kecil angka makin ke kiri, 650 makin besar angka makin ke bawah 
  kepitingX3 = kepitingX3 - 0;
    if (kepitingX3 > width) {
      kepitingX3 = 500;
    }  
    
  popMatrix();  
  
  pushMatrix();
  scale(0.3); // Mengatur ukuran GIF
  image (fish[frameCount%8], fishX, 1750); // Menggatur posisi atas / bawah GIF
  fishX = fishX + 10; // Kecepatan gerak GIF
    if (fishX > width + 2500) { // Titik akhir gerak GIF
      fishX = -400; // Titik awal gerak GIF
    }
    
  popMatrix();
    
  // Fish bagian bawah
  pushMatrix();
  scale(0.3);
  image (fish[frameCount%8], fishX2, 1800);
  fishX2 = fishX2 + 12;
    if (fishX2 > width + 2500) {
      fishX2 = -400;
    }
    
  popMatrix();  
   
  // Fish bagian atas  
  pushMatrix();
  scale(0.3);
  image (fish[frameCount%8], fishX3, 1650);
  fishX3 = fishX3 + 11;
    if (fishX3 > width + 2500) {
      fishX3 = -400;
    }
    
  popMatrix();  

  pushMatrix();
  scale(1.1);
  image (paus[frameCount%24], pausX, - 100);
  pausX = pausX - 5;
    if (pausX < - 1000) {
      pausX = width + 100;
    }
    
  popMatrix();
    
  pushMatrix();
  scale(0.5);
  image (ikan[frameCount%3], ikanX, 500);
  ikanX = ikanX + 5;
    if (ikanX > width + 1000) {
      ikanX = -400;
    }
  popMatrix();
   
  pushMatrix();
  scale(0.1); // Mengatur ukuran GIF
  image (badut[frameCount%27], badutX, 2500); // Posisi atas / bawah GIF
  badutX = badutX - 55; // Kecepatan gerak GIF
    if (badutX < - 600) { // Titik akhir gerak GIF ke arah kiri
      badutX = width + 10000; // Titik awal gerak GIF 
    }
    
  popMatrix();
  
  pushMatrix();
  scale(0.1); 
    image (badut[frameCount%27], badutX2, 2770);
  badutX2 = badutX2 - 49;
    if (badutX2 < - 600) {
      badutX2 = width + 10000;
    }
    
  popMatrix();
  
  pushMatrix();
  scale(0.1);
    image (badut[frameCount%27], badutX3, 3000);
  badutX3 = badutX3 - 57;
    if (badutX3 < - 600) {
      badutX3 = width + 10000;
    }
    
  popMatrix();
  
  pushMatrix();
  scale(0.1);
    image (badut[frameCount%27], badutX4, 3200);
  badutX4 = badutX4 - 51;
    if (badutX4 < - 600) {
      badutX4 = width + 10000;
    }
    
  popMatrix();
  
  pushMatrix();
  scale(0.8);
    image (duyung[frameCount%40], duyungX, 150);
  duyungX = duyungX - 10;
    if (duyungX < - 500) {
      duyungX = width + 4000;
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
