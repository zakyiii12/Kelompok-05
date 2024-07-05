let flame = [],
  wax = [],
  size = Infinity,
  candleHeight = 400,
  burnRate = 0.01;

let lapse = 0;    

function setup() {
  createCanvas(windowWidth, windowHeight - 4);
}

function draw() {
  background(51, 30)
    fill(255, 200, 140, random(0.2, 1));
  circle(width/2, height/2 + 60, 200 + random(-10, 10));
  circle(width/2, height/2 + 60, 250 + random(-10, 10));
  circle(width/2, height/2 + 60, 300 + random(-20, 20));
  if (candleHeight > 0) {
    stroke(0);
    line(width / 2, height - candleHeight, width / 2, height - candleHeight - 25);
    noStroke();
  }
  fill(249, 255, 191);
  rect(width / 2 - 20, height - candleHeight, 40, candleHeight + 10, 20);
  for (let particle of flame.concat(wax)) {
    particle.update();
  }
  flame = flame.filter(p => p.radius > 0)
    wax = wax.filter(w => w.lifetime > 0)
    if (candleHeight > 0) {
    flame.push(new FlameParticle(width / 2, height - candleHeight - 25, random(30, 50)));
    if (frameCount % 2 === 0) wax.push(new WaxParticle(width / 2, height - candleHeight));
  }
  candleHeight -= burnRate;
}

class FlameParticle {
  constructor(x, y, radius) {
    this.pos = new p5.Vector(x, y);
    this.radius = radius;
    this.color = random([color(255, 255, 50, 50), color(255, 235, 50, 50), color(255, 255, 50, 50)]);
  }

  update() {
    this.update_attributes();
    this.show();
  }

  show() {
    noStroke();
    fill(this.color);
    ellipse(this.pos.x, this.pos.y+10, this.radius / 2);
  }

  update_attributes() {
    this.pos.add(random(-2, 2), -random(1, 3));
    this.radius -= 0.9;
  }
}

class WaxParticle {
  constructor(x, y) {
    this.pos = new p5.Vector(x, y);
    this.vel = new p5.Vector(0, 1);
    this.dir = random([-1, .1])
      this.on_ground = false
      this.lifetime = 20
      this.radius = 5
  }
  update() {
    this.move();
    this.show();
  }

  show() {
    noStroke();
    fill(249, 255, 191);
    ellipse(this.pos.x, this.pos.y, this.radius*2);
  }

  move() {
    //if(this.pos.y < height) this.vel.y += 0.1;
    if (this.pos.x < 0 || this.pos.x > width) {
      this.pos.x -= this.vel.x
        this.vel.x *= -0.6
    }
    this.pos.add(this.vel);
    if (/*!this.on_ground && */this.pos.y > height) {
      this.pos.y = height
        //this.vel.y = 0;
        this.vel.x = random([-0.5, 0.5])
        this.on_ground = true
    }
    if (this.on_ground) {
      this.vel.x /= 1.01
        for (let particle of wax.filter(x => x != this)) {
        if (particle.pos.dist(this.pos) < this.radius) {
          let to = p5.Vector.sub(this.pos, particle.pos);
          this.pos = p5.Vector.add(particle.pos, to.setMag(this.radius))
        }
      }
      this.lifetime --
        return
    }
    if (Math.abs(this.pos.x - width / 2) < 20 && dist(this.pos.x, this.pos.y, width / 2, height - candleHeight + 20) < 20) {
      while (dist(this.pos.x, this.pos.y, width / 2, height - candleHeight + 20) < 20) {
        this.pos.x += this.dir
      }
    }
    if (Math.abs(this.pos.x - width / 2) < 20 && this.pos.y > height - candleHeight + 20) {
      this.pos.x = this.dir * (width / 2 + 22)
    }
  }
}