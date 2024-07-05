void setup() {
  size(800, 800);
  background(255);
  drawHelloKitty();
}

void drawHelloKitty() {
  // Kepala
  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse(400, 400, 300, 300);
  
  // Telinga Kiri
  beginShape();
  vertex(300, 300);
  bezierVertex(250, 220, 250, 250, 320, 320);
  endShape(CLOSE);

  // Telinga Kanan
  beginShape();
  vertex(500, 300);
  bezierVertex(550, 220, 550, 250, 480, 320);
  endShape(CLOSE);

  // Mata Kiri
  fill(0);
  ellipse(360, 380, 20, 35);

  // Mata Kanan
  ellipse(440, 380, 20, 35);

  // Hidung
  fill(255, 204, 0);
  ellipse(400, 420, 20, 15);

  // Kumis Kiri
  line(310, 410, 250, 400);
  line(310, 430, 250, 430);
  line(310, 450, 250, 460);

  // Kumis Kanan
  line(490, 410, 550, 400);
  line(490, 430, 550, 430);
  line(490, 450, 550, 460);

  // Pita
  fill(255, 0, 0);
  beginShape();
  vertex(360, 300);
  bezierVertex(320, 270, 320, 330, 360, 300);
  endShape(CLOSE);
  beginShape();
  vertex(440, 300);
  bezierVertex(480, 270, 480, 330, 440, 300);
  endShape(CLOSE);
  ellipse(400, 300, 40, 40);

  // Tubuh
  fill(255);
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(350, 500);
  vertex(450, 500);
  vertex(480, 700);
  vertex(320, 700);
  endShape(CLOSE);

  // Kaki Kiri
  ellipse(370, 730, 40, 40);

  // Kaki Kanan
  ellipse(430, 730, 40, 40);

  // Lengan Kiri
  ellipse(320, 600, 40, 80);

  // Lengan Kanan
  ellipse(480, 600, 40, 80);
}
