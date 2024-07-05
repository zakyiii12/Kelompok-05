PImage sunTexture, mercuryTexture, venusTexture, earthTexture, marsTexture;
PImage sunMasked, mercuryMasked, venusMasked, earthMasked, marsMasked;

void setup() {
  size(800, 800);
  sunTexture = loadImage("matahari.jpg");
  mercuryTexture = loadImage("merkurius.jpg");
  venusTexture = loadImage("venus.jpg");
  earthTexture = loadImage("bumi.jpg");
  marsTexture = loadImage("mars.jpg");

  // Create masked images for the planets and sun
  sunMasked = createMaskedImage(sunTexture, 100);
  mercuryMasked = createMaskedImage(mercuryTexture, 20);
  venusMasked = createMaskedImage(venusTexture, 30);
  earthMasked = createMaskedImage(earthTexture, 40);
  marsMasked = createMaskedImage(marsTexture, 30);
}

void draw() {
  background(0);
  translate(width / 2, height / 2); // Move origin to the center

  // Sun
  imageMode(CENTER);
  image(sunMasked, 0, 0, 100, 100); // Draw sun at the center

  // Mercury
  drawPlanet(mercuryMasked, 50, 0.01, 20);

  // Venus
  drawPlanet(venusMasked, 100, 0.008, 30);

  // Earth
  drawPlanet(earthMasked, 150, 0.006, 40);

  // Mars
  drawPlanet(marsMasked, 200, 0.004, 30);
}

void drawPlanet(PImage texture, float orbitRadius, float orbitSpeed, float planetSize) {
  float angle = frameCount * orbitSpeed;
  float x = cos(angle) * orbitRadius;
  float y = sin(angle) * orbitRadius;
  image(texture, x, y, planetSize, planetSize);
}

PImage createMaskedImage(PImage img, int size) {
  PGraphics pg = createGraphics(size, size);
  pg.beginDraw();
  pg.background(0, 0);
  pg.ellipseMode(CENTER);
  pg.noStroke();
  pg.ellipse(size / 2, size / 2, size, size);
  pg.endDraw();

  PImage mask = pg.get();
  img.resize(size, size);
  img.mask(mask);

  return img;
}
