class Sonic {
   // global members
   PImage[] frames = new PImage[5];
   int noFrames = 0;
   float x;
   float y;
   float speed = 15; // Increased speed
   
   // constructor
   Sonic(float startX, float startY) {
     x = startX;
     y = startY;
     noFrames = 0;
   }
   
   // add a new frame to the Sonic. The max number is 5.
   void addFrame(PImage frame) {
     if (noFrames < frames.length) {
       frames[noFrames] = frame;
       noFrames++;
     }
   }
   
   // move the Sonic horizontally
   void move() {
     x += speed;
     if (x > width + 100) {
        x = -250;
        y = height - 190; // Reset Y position to lower part of the screen
     }
   }
   
   // draw a new frame of the Sonic.
   void draw() {
     if (noFrames > 0) {
       // Increased size to 80x80
       image(frames[frameCount % noFrames], x, y, 80, 80);
     }
   }
}

Sonic sonic; // single instance of Sonic
PImage tank;

void setup() {
  // window geometry 
  size(1000, 600);
  smooth();
  
  // get the background image of the aquarium tank. 
  // This will be displayed every time draw() is called.
  tank = loadImage("landscape.jpg");
  
  // create the collection of images making up the animation
  // for the Sonic.
  PImage[] images = new PImage[5];
  images[0] = loadImage("sonic0.gif");
  images[1] = loadImage("sonic1.gif");
  images[2] = loadImage("sonic2.gif");
  images[3] = loadImage("sonic3.gif");
  images[4] = loadImage("sonic4.gif");
 
  // create the Sonic
  float startX = width / 2; // Start X position in the middle of the screen
  float startY = height - 190; // Start Y position at -190
  sonic = new Sonic(startX, startY);

  // add 5 frames for Sonic.
  for (int i = 0; i < 5; i++) {
    sonic.addFrame(images[i]);
  }
  
  // set the frame rate to 15, so that Sonic runs faster.
  frameRate(15);
}

void draw() {
  //--- Animation loop ---
  
  // display the background image. This erases the previous
  // images of the Sonic, so that we can draw newer frames,
  // offset by some tiny amount.
  image(tank, 0, 0, width, height);
  
  // display new frame for Sonic, then move Sonic
  sonic.draw();
  sonic.move();
}
