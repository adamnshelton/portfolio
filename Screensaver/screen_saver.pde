Lines[] myLines = new Lines [1];



void setup() {
  background(random(240,240));
  size(1000, 500);
  frameCount=30;
  for (int i = 0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width),random(height),2,8);
  }
  
  myLines[0] = new Lines(30, 30, 30 ,30);



}

void draw() {
  if (frameCount == 2000) {
    frameCount = 0;
    background(random(240,240));
  } else {
    for(int i = 0; i < myLines.length; i++) {
      //Lines iLines = myLines[i];
      myLines[i].display();
      //iLines.display();
    }
  }
}
class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
 
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  
  void display() {
    strokeW = random(1, 2);
    lineLength = random(1, 20);
    stroke(random(10), random(100), random(200));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>70) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength );
      } else if (random(100)>65) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (random(100)>55) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      } else {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      }
    }
  }

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY);
      xpos = startX;
      ypos = startY - i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY);
      xpos = startX;
      ypos = startY + i;
    }
  }
}


