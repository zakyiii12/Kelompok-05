Player player;
ArrayList<Enemy> enemies;
ArrayList<Bullet> playerBullets;
ArrayList<Bullet> enemyBullets;
int score;
boolean gameOver;

void setup() {
  size(800, 600);
  player = new Player(width/2, height - 50);
  enemies = new ArrayList<Enemy>();
  playerBullets = new ArrayList<Bullet>();
  enemyBullets = new ArrayList<Bullet>();
  score = 0;
  gameOver = false;
}

void draw() {
  if (!gameOver) {
    background(0);
    
    player.display();
    player.move();
    
    // Spawn musuh baru setiap 2 detik
    if (frameCount % 120 == 0) {
      enemies.add(new Enemy(random(width), 0));
    }
    
    // Update dan tampilkan musuh
    for (int i = enemies.size() - 1; i >= 0; i--) {
      Enemy enemy = enemies.get(i);
      enemy.move();
      enemy.display();
      
      // Musuh menembak
      if (random(1) < 0.02) {
        enemyBullets.add(new Bullet(enemy.x, enemy.y, 0, 5));
      }
      
      // Hapus musuh jika keluar layar
      if (enemy.y > height) {
        enemies.remove(i);
      }
    }
    
    // Update dan tampilkan peluru pemain
    for (int i = playerBullets.size() - 1; i >= 0; i--) {
      Bullet bullet = playerBullets.get(i);
      bullet.move();
      bullet.display();
      
      // Hapus peluru jika keluar layar
      if (bullet.y < 0) {
        playerBullets.remove(i);
        continue;
      }
      
      // Cek tumbukan peluru dengan musuh
      for (int j = enemies.size() - 1; j >= 0; j--) {
        Enemy enemy = enemies.get(j);
        if (bullet.hits(enemy)) {
          enemies.remove(j);
          playerBullets.remove(i);
          score++;
          break;
        }
      }
    }
    
    // Update dan tampilkan peluru musuh
    for (int i = enemyBullets.size() - 1; i >= 0; i--) {
      Bullet bullet = enemyBullets.get(i);
      bullet.move();
      bullet.display();
      
      // Hapus peluru jika keluar layar
      if (bullet.y > height) {
        enemyBullets.remove(i);
        continue;
      }
      
      // Cek tumbukan peluru dengan pemain
      if (bullet.hits(player)) {
        gameOver = true;
      }
    }
    
    // Tampilkan skor
    fill(255);
    textSize(24);
    text("Score: " + score, 40, 30);
  } else {
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Game Over\nScore: " + score + "\nClick to restart", width/2, height/2);
  }
}

void keyPressed() {
  if (key == ' ' && !gameOver) {
    playerBullets.add(new Bullet(player.x, player.y, 0, -10));
  }
}

void mousePressed() {
  if (gameOver) {
    setup();
  }
}

class Player {
  float x, y;
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(0, 255, 0);
    triangle(x, y - 20, x - 20, y + 20, x + 20, y + 20);
  }
  
  void move() {
    x = constrain(mouseX, 20, width - 20);
  }
}

class Enemy {
  float x, y;
  
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(255, 0, 0);
    triangle(x, y + 20, x - 20, y - 20, x + 20, y - 20);
  }
  
  void move() {
    y += 2;
  }
}

class Bullet {
  float x, y;
  float speedY;
  
  Bullet(float x, float y, float speedX, float speedY) {
    this.x = x;
    this.y = y;
    this.speedY = speedY;
  }
  
  void display() {
    fill(255, 255, 0);
    ellipse(x, y, 10, 10);
  }
  
  void move() {
    y += speedY;
  }
  
  boolean hits(Enemy e) {
    return dist(x, y, e.x, e.y) < 20;
  }
  
  boolean hits(Player p) {
    return dist(x, y, p.x, p.y) < 20;
  }
}
