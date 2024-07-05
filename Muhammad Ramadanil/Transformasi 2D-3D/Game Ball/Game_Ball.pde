// Variabel untuk menyimpan posisi platform
float platformX, platformY;
float platformWidth = 100;
float platformHeight = 10;

// Variabel untuk menyimpan posisi bola
float ballX, ballY;
float ballSize = 30;
float ballSpeedX = 3;
float ballSpeedY = 3;

// Variabel untuk status permainan
boolean gameOver = false;
int score = 0;

void setup() {
  size(600, 600);
  resetGame();
}

void draw() {
  background(220);
  
  if (!gameOver) {
    // Gambar platform
    fill(0, 0, 255);
    rect(platformX, platformY, platformWidth, platformHeight);
    
    // Gambar bola
    fill(255, 0, 0);
    ellipse(ballX, ballY, ballSize, ballSize);
    
    // Perbarui posisi bola
    ballX += ballSpeedX;
    ballY += ballSpeedY;
    
    // Cek tabrakan dengan dinding
    if (ballX > width - ballSize / 2 || ballX < ballSize / 2) {
      ballSpeedX = -ballSpeedX;
    }
    if (ballY < ballSize / 2) {
      ballSpeedY = -ballSpeedY;
    }
    
    // Cek tabrakan dengan platform
    if (ballY + ballSize / 2 >= platformY && ballX > platformX && ballX < platformX + platformWidth) {
      ballSpeedY = -ballSpeedY;
      score++;
    }
    
    // Cek jika bola jatuh di bawah layar
    if (ballY > height) {
      gameOver = true;
    }
    
    // Tampilkan skor
    fill(0);
    textSize(20);
    text("Score: " + score, 40, 30);
  } else {
    // Jika game over
    fill(0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Game Over!", width / 2, height / 2);
    textSize(20);
    text("Final Score: " + score, width / 2, height / 2 + 40);
  }
}

void resetGame() {
  platformX = width / 2 - platformWidth / 2;
  platformY = height - 30;
  
  ballX = width / 2;
  ballY = height / 2;
  
  score = 0;
  gameOver = false;
}

void mouseMoved() {
  // Pindahkan platform mengikuti posisi mouse
  platformX = mouseX - platformWidth / 2;
  
  // Batasi gerakan platform agar tetap di dalam layar
  platformX = constrain(platformX, 0, width - platformWidth);
}

void mousePressed() {
  if (gameOver) {
    resetGame();
  }
}
