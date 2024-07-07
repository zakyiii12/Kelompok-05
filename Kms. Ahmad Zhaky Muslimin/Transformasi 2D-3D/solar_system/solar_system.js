let zoom = 2;
let starTexture;
let sun;

function setup() {
  createCanvas(windowWidth, windowHeight - 4, WEBGL);
  camera(0, -1000, 2200);
  sun = new CelestialObject(300, 0, null, loadImage("Textures/sun.jpg"));
  m = new CelestialObject(7.5, 400, sun, loadImage("Textures/mercury.jpg"));
  v = new CelestialObject(18, 460, sun, loadImage("Textures/venus.jpg"));
  e = new CelestialObject(19, 520, sun, loadImage("Textures/earth.jpg"));
  new CelestialObject(2, 25, e, loadImage("Textures/moon.jpg"));
  r = new CelestialObject(11, 620, sun, loadImage("Textures/mars.jpg"));
  j = new CelestialObject(138, 820, sun, loadImage("Textures/jupiter.jpg"));
  new CelestialObject(3, 22, r, loadImage("Textures/phobos.jpg"));
  new CelestialObject(2, 30, r, loadImage("Textures/deimos.jpg"));
  s = new CelestialObject(116, 1250, sun, loadImage("Textures/saturn.jpg"));
  u = new CelestialObject(50, 1500, sun, loadImage("Textures/uranus.jpg"));
  n = new CelestialObject(48, 1900, sun, loadImage("Textures/neptune.jpg"));
  starTexture = loadImage('Textures/2k_stars_milky_way.jpg');
}

function draw() {
  background(0);
  displayBackground();
  noStroke();
  orbitControl();
  rotateX(PI/2);

  sun.update();
  sun.show();
}


function mouseWheel(event) {
  zoom += event.delta * 0.0005;
}

function displayBackground() {
  push();
  rotateY(millis() * 0.000005);
  texture(starTexture);
  sphere(width * 3);
  pop();
}

class CelestialObject {

  constructor(radius, distance, parent, tex) {
    this.radius = radius;
    this.distance = distance;
    this.orbitLength = distance * 2 * PI;
    this.angle = random(2 * PI);
    this.tex = tex;
    this.children = [];
    this.parent = parent;
    if (parent) {
      parent.children.push(this);
    }
  }

  update() {
    if (this.orbitLength > 0) {
      let speed = pow((width - this.distance) / (width), 0.5);
      this.angle += (speed / this.orbitLength) * (2 * PI);
    }
    for (let CelestialObject of this.children) {
      CelestialObject.update();
    }
  }

  show() {
    push();
    {
      push();
      {
        strokeWeight(0.1);
        stroke(255);
        noFill();
        ellipse(0, 0, this.distance * 2);
      }
      pop();

      rotate(-this.angle);
      translate(this.distance, 0);

      texture(this.tex);
      push();
      rotateX(-PI/2);
      sphere(this.radius);
      pop();
      for (let CelestialObject of this.children) {
        CelestialObject.show();
      }
    }
    pop();
  }
}
