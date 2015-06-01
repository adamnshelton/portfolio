int x, y;

void setup() {
  size (400, 400);
  frameRate(10);
  //set start coords
  x = width/2;
  y = height/2;
}

void draw() {
  fill(255);
  drawName();
}

void drawName() {
  }

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      moveRight(1);
    } else if (keyCode == LEFT) {
      moveLeft(1);
    } else if (keyCode == UP) {
      moveUp(1);
    } else if (keyCode == DOWN) {
      moveDown(1);
    }
  }
}

void moveRight(int rep) {
  for(int i = 0; i < rep * 2; i ++) {
    point(x + i, y);
  }
  x = x + (2*rep);
}

void moveLeft(int rep) {
  for(int i = 0; i < rep * 2; i ++) {
    point(x - i, y);
  }
  x = x - (2*rep);
}

void moveUp(int rep) {
  for(int i = 0; i < rep * 2; i ++) {
    point(x, y-i);
  }
  y = y - (2*rep);
}

void moveDown(int rep) {
  for(int i = 0; i < rep * 2; i ++) {
    point(x, y+i);
  }
  y = y + (2*rep);
}







/*void moveUpRight(int rep) {
  for(int i = 0; i < rep * 10; i ++) {
    point(x + i, y-i);
  }
  y = y - (10*rep);
  x = x + (10*rep);
}

void moveUpLeft(int rep) {
  for(int i = 0; i < rep * 10; i ++) {
    point(x - i, y - i);
  }
  y = y - (10*rep);
  x = x - (10*rep);
}

void moveDownRight(int rep) {
  for(int i = 0; i < rep * 10; i ++) {
    point(x + i, y + i);
  }
  y = y + (10*rep);
  x = x + (10*rep);
}

void moveDownLeft(int rep) {
  for(int i = 0; i < rep * 10; i ++) {
    point(x - i, y + i);
  }
  y = y + (10*rep);
  x = x - (10*rep);
}
*/

void mouseClicked() {
  saveFrame("line-######.png");
}

