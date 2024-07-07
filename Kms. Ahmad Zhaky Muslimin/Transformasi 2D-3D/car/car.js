p5.disableFriendlyErrors = true;

var obj;

function preload() {
  obj = loadModel("mclaren02.obj", true)
}

function setup() {
  createCanvas(windowWidth, windowHeight -4, WEBGL);
  background(120);
}

function draw() {
  background(255);
  lights();
  orbitControl();
  scale(4);

  push();
  translate(0, 0, 38);
  noStroke();

  rotateZ(frameCount/100);
  specularMaterial(255, 64, 34);
  ambientMaterial(51, 51, 51);
  shininess(10);
  model(obj);
  pop();



  push();

  translate(0, 0, -38);
  stroke(0);
  strokeWeight(0.2);
    rotateZ(PI);
  rotateY(PI);
  rotateZ(-frameCount/100);
  emissiveMaterial(100, 100, 100, 100);
  model(obj);
  pop();
}
