ArrayList<Tank> blueTanks;
ArrayList<Tank> redTanks;
ArrayList<Bullet> bullets;
boolean gameOver;
String winner;
PlayerTank playerTank;

void setup() {
  size(800, 600);
  blueTanks = new ArrayList<Tank>();
  redTanks = new ArrayList<Tank>();
  bullets = new ArrayList<Bullet>();
  
  // Inisialisasi tank pemain (biru)
  playerTank = new PlayerTank(width/4, height/2, color(0, 0, 255));
  blueTanks.add(playerTank);
  
  // Inisialisasi tank biru tambahan
  for (int i = 0; i < 2; i++) {
    blueTanks.add(new Tank(random(width/2), random(height), color(0, 0, 255), true));
  }
  
  // Inisialisasi tank merah
  for (int i = 0; i < 3; i++) {
    redTanks.add(new Tank(random(width/2, width), random(height), color(255, 0, 0), false));
  }
  
  gameOver = false;
  winner = "";
}

void draw() {
  background(200);
  
  if (!gameOver) {
    // Update dan tampilkan tank biru
    for (Tank tank : blueTanks) {
      tank.update();
      tank.display();
      if (frameCount % 60 == 0 && tank != playerTank) tank.shoot(); // Tank AI menembak setiap detik
    }
    
    // Update dan tampilkan tank merah
    for (Tank tank : redTanks) {
      tank.update();
      tank.display();
      if (frameCount % 60 == 0) tank.shoot(); // Tembak setiap detik
    }
    
    // Update dan tampilkan peluru
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet bullet = bullets.get(i);
      bullet.update();
      bullet.display();
      
      // Cek tumbukan peluru dengan tank
      if (bullet.isBlue) {
        for (int j = redTanks.size() - 1; j >= 0; j--) {
          if (bullet.hits(redTanks.get(j))) {
            redTanks.remove(j);
            bullets.remove(i);
            break;
          }
        }
      } else {
        for (int j = blueTanks.size() - 1; j >= 0; j--) {
          if (bullet.hits(blueTanks.get(j))) {
            blueTanks.remove(j);
            bullets.remove(i);
            break;
          }
        }
      }
      
      // Hapus peluru jika keluar layar
      if (bullet.isOffscreen()) {
        bullets.remove(i);
      }
    }
    
    // Cek kondisi kemenangan
    if (blueTanks.size() == 0) {
      gameOver = true;
      winner = "Red";
    } else if (redTanks.size() == 0) {
      gameOver = true;
      winner = "Blue";
    }
  } else {
    // Tampilkan layar game over
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);
    text(winner + " team wins!\nClick to restart", width/2, height/2);
  }
}

void keyPressed() {
  playerTank.setMove(keyCode, true);
  if (key == ' ') playerTank.shoot();
}

void keyReleased() {
  playerTank.setMove(keyCode, false);
}

void mousePressed() {
  if (gameOver) {
    setup(); // Restart game
  }
}

class Tank {
  PVector pos, vel;
  color c;
  boolean isBlue;
  
  Tank(float x, float y, color c, boolean isBlue) {
    pos = new PVector(x, y);
    vel = PVector.random2D().mult(2);
    this.c = c;
    this.isBlue = isBlue;
  }
  
  void update() {
    pos.add(vel);
    
    // Pantul di tepi layar
    if (pos.x < 0 || pos.x > width) vel.x *= -1;
    if (pos.y < 0 || pos.y > height) vel.y *= -1;
  }
  
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading());
    fill(c);
    rect(-15, -10, 30, 20);
    rect(0, -5, 20, 10);
    popMatrix();
  }
  
  void shoot() {
    bullets.add(new Bullet(pos.x, pos.y, vel.heading(), isBlue));
  }
}

class PlayerTank extends Tank {
  boolean isUp, isDown, isLeft, isRight;
  
  PlayerTank(float x, float y, color c) {
    super(x, y, c, true);
  }
  
  void setMove(int k, boolean b) {
    switch (k) {
      case UP:
        isUp = b;
        break;
      case DOWN:
        isDown = b;
        break;
      case LEFT:
        isLeft = b;
        break;
      case RIGHT:
        isRight = b;
        break;
    }
  }
  
  void update() {
    vel.set(0, 0);
    if (isUp) vel.y -= 2;
    if (isDown) vel.y += 2;
    if (isLeft) vel.x -= 2;
    if (isRight) vel.x += 2;
    
    pos.add(vel);
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
}

class Bullet {
  PVector pos, vel;
  boolean isBlue;
  
  Bullet(float x, float y, float angle, boolean isBlue) {
    pos = new PVector(x, y);
    vel = PVector.fromAngle(angle).mult(5);
    this.isBlue = isBlue;
  }
  
  void update() {
    pos.add(vel);
  }
  
  void display() {
    fill(isBlue ? color(0, 0, 255) : color(255, 0, 0));
    ellipse(pos.x, pos.y, 8, 8);
  }
  
  boolean hits(Tank tank) {
    return pos.dist(tank.pos) < 20;
  }
  
  boolean isOffscreen() {
    return pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height;
  }
}
