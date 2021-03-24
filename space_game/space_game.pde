Stars s1;
Spaceship s2;
Enemyship e1;
Bossship b1;
ArrayList<Rock> rocks;
ArrayList<Lazer> lazers;
ArrayList<Enemyship> enemies;
ArrayList<Enemylazer> enemylazers;
Timer rockTimer;
Timer enemyTimer;
int rockRate = 1000;
int enemyRate = 10;
int score = 0;
boolean play = false;
PImage Start;
PImage GG;
Stars[] stars=new Stars[666];

void setup() {
  size(1000, 1000);
  s1 = new Stars(color(255), random(width), random(height), random(5, 22));
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Stars(color(255), random(width), random(height), random(5, 22));
  }
  s2=new Spaceship(width/2, height/2);
  e1=new Enemyship(width/2, height/2);
  rocks = new ArrayList<Rock>();
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  lazers = new ArrayList<Lazer>();
  enemies = new ArrayList<Enemyship>();
  enemyTimer = new Timer(enemyRate);
  enemyTimer.start();
  enemylazers = new ArrayList<Enemylazer>();
  Start = loadImage("Start.png");
  GG= loadImage("GG.png");
}

void draw() {
  noCursor();
  background(0);
  if (!play) {
    startScreen();
  } else {
    //ad rocks based on a timer
    if (rockTimer.isFinished())
      s1.display();
    s1.drive();
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].drive();
    }
    // rendering of rock
    for (int i = rocks.size()-1; i>0; i--) {
      Rock rock = (Rock) rocks.get(i);
      rock.move();
      rock.display();
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
      for (int j = lazers.size()-1; j>0; j--) {
        Lazer lazer = (Lazer) lazers.get(j);
        if (dist(lazer.x, lazer.y, rock.x, rock.y)<rock.health) {
          rock.health-=lazer.damage;
          lazers.remove(lazer);
          score+=10;
        }
        if (rock.health<1) {
          rocks.remove(rock);
        }
      }
      if (dist(s2.x, s2.y, rock.x, rock.y)<20) {
        rocks.remove(rock);
        /*if (rock.isPu) {
         s2.health+=10;
         rocks.remove(rock);
         }*/
        s2.health-=rock.health;
        score-=rock.health;
      }
    }
    //rendering of lazers
    for (int i = lazers.size()-1; i>0; i--) {
      Lazer lazer = (Lazer) lazers.get(i);
      for (int j = rocks.size()-1; j>0; j--) {
        Rock rock = (Rock) rocks.get(j);
        if (dist(lazer.x, lazer.y, rock.x, rock.y)<rock.w/2) {
          rock.health-=10;
          score +=10;
          lazers.remove(lazer);
          if (rock.health<1) {
            rocks.remove(rock);
          }
        }
        for (int k = enemies.size()-1; k>0; k--) {
          Enemyship enemy = (Enemyship) enemies.get(k);
          if (dist(lazer.x, lazer.y, enemy.x, enemy.y)<enemy.w/2) {
            enemy.health-=15;
            lazers.remove(lazer);
            if (enemy.health<1) {
              enemies.remove(enemy);
              score += 100;
            }
          }
        }
        lazer.fire();
        lazer.display();
        if (lazer.reachedTop()) {
          lazers.remove(lazer);
        }
      }
    }
    for (int k = enemies.size()-1; k>0; k--) {
      Enemyship enemy = (Enemyship) enemies.get(k);
      enemy.drive();
      enemy.display();

      if (dist(enemy.x, enemy.y, s2.x, s2.y)<s2.w/2) {
        s2.health-=100;
        e1.health-=100;
        enemies.remove(enemy);
        if (s2.health<1) {
          play = false;
          gameOver();
        } else {
          play = true;
        }
      }
    /*for (int u = 0; u<enemylazers.size(); u++) {
      Enemylazer enemylazer = (Enemylazer) enemylazers.get(u);
      if (dist(enemylazer.x, enemylazer.y, s2.x, s2.y)<s2.w/2) {
        s2.health-=15;
        score-=15;
        enemylazers.remove(enemylazer);
        if (s2.health<1) {
          play = false;
          gameOver();
        } else {
          play = true;
        }
      }
      enemylazer.fire();
      enemylazer.display();
      if (enemylazer.reachedBottom()) {
        enemylazers.remove(enemylazer);
      }
    }*/
    }
  }
  //distribution of rocks
  if (rockTimer.isFinished()) {
    rocks.add(new Rock(int(random(width)), -500, 20, 20));
    rockTimer.start();
  }
  if (enemyTimer.isFinished()) {
    enemies.add(new Enemyship(int(random(width)), -500));
    enemylazers.add(new Enemylazer(e1.x,e1.y));
    enemyTimer.start();
  }
  s2.display(mouseX, mouseY);
  infoPanel();
  if (s2.health < 1) {
    play = false;
    gameOver();
  } else {
    play = true;
  }
}
void infoPanel() {
  fill(140, 140);
  rect(0, 960, width, 70);
  textAlign(LEFT);
  text("Score:" + score, 20, 970);
  text("Health:" + s2.health, 20, 990);
}
void startScreen() {
  background(0);
  imageMode(CORNER);
  image(Start, 0, 0);
  textAlign(CENTER);
  fill(255);
  text("By William Bastian", width/2, height/2+230);
  text("Instructions: Click to start, press any key to shoot(except esc), move ship with mouse", width/2, height/2+250);
  if (mousePressed) {
    play = true;
  }
}
void gameOver() {
  background(0);
  imageMode(CORNERS);
  image(GG, 0, 0);
  textAlign(CENTER);
  fill(255);

  text("Your Score:" + score, width/2, height/2+230);
  noLoop();
}

void keyPressed() {
  lazers.add(new Lazer(s2.x-10, s2.y));
  lazers.add(new Lazer(s2.x+6, s2.y));
}
