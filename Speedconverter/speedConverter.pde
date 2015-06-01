void setup() {
  size(950, 300);
}

void draw() {
  background(0);
  if(mouseX > 200) {
    fill(255, 0, 0);
    rect(100, 115, mouseX-100, 10);
  } else if(mouseX < 200) {
    fill(255, 150, 0);
    rect(100, 115, mouseX-100, 10);
  }
  
  fill(255);
  drawReference(100, 50);
  text("Miles Per Hour = " + int(mouseX-100), 50, 200);
  text("Kilometer Per Hour = " + speedConverter(mouseX-100), 50, 230);
  
  text("Speed Converter", width/2, 50);

  text("created by: Adam Shelton", 700, 215);


}

void drawReference(int xpos, int ypos) {
  stroke(200);
  line(xpos-50, ypos+50, 900, ypos+50);
  for(int i = 0; i < 800; i = i + 50) {
    text(i, xpos+i-8, ypos+50);
    line(xpos + i, ypos+50, xpos+i, ypos+55);
  }
}

void drawVertRef(int xpos, int ypos) {
  stroke(200);
  line(xpos, ypos, xpos, ypos + 200);
  for(int i = 0; i<300; i = i + 50) {
    text(i, xpos + 5, ypos + i);
    line(xpos, ypos+i, xpos, ypos);
  }
}

void drawVertRefInv(int xpos, int ypos) {
  stroke(200);
  line(xpos, ypos, xpos, ypos+height);
  for(int i = 300; i>0; i = i - 50) {
    text(i, xpos+5, height-i);
    line(xpos, height-i, xpos-5, height-i);
  }
}

float speedConverter(float mph) {
  float kmh = mph * 1.609344;
  return kmh;
}


