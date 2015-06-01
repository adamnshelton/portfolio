Button[] numButtons = new Button[10];
Button[] opButtons = new Button[7];
Button[] spButtons = new Button[1];


String displayValue = "0";
String valueToCompute = "";
String valueToCompute2= "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
char opValue;
boolean firstNum;

void setup() {
  size(360, 260);
  background(50, 55, 55);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(100);
  fill(255);
  rect(110, 30, 140, 200);

  numButtons[0] = new Button(150, 170).asNumber(0, 20, 20);
  numButtons[1] = new Button(120, 140).asNumber(1, 20, 20);
  numButtons[2] = new Button(150, 140).asNumber(2, 20, 20);
  numButtons[3] = new Button(180, 140).asNumber(3, 20, 20);
  numButtons[4] = new Button(120, 110).asNumber(4, 20, 20);
  numButtons[5] = new Button(150, 110).asNumber(5, 20, 20);
  numButtons[6] = new Button(180, 110).asNumber(6, 20, 20);
  numButtons[7] = new Button(120, 80).asNumber(7, 20, 20);
  numButtons[8] = new Button(150, 80).asNumber(8, 20, 20);
  numButtons[9] = new Button(180, 80).asNumber(9, 20, 20);

  opButtons[0] = new Button(210, 80).asOperator("+", 20, 20);
  opButtons[1] = new Button(210, 110).asOperator("-", 20, 20);
  opButtons[2] = new Button(210, 140).asOperator("x", 20, 20);
  opButtons[3] = new Button(210, 170).asOperator("÷", 20, 20);
  opButtons[4] = new Button(210, 200).asOperator("=", 20, 20);
  opButtons[5] = new Button(120, 170).asOperator("C", 10, 20);
  opButtons[6] = new Button(120, 200).asOperator("+/-", 70, 20);
  firstNum = true;

  spButtons[0] = new Button(180, 170).asSpecial(".");
}

void draw() {
  for (int i = 0; i < numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.display();
  }
  for (int i = 0; i < opButtons.length; i++) {
    Button iopButton = opButtons[i];
    iopButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.clickButton();
    if (inumButton.on) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    Button iOpButton = opButtons[i];
    iOpButton.clickButton();
    if (iOpButton.on) {
      if (iOpButton.opButtonValue == "+") {
        if (result !=0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "-") {
        if (result !=0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "x") {
        if (result !=0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "x";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "x";
        }
      } else if (iOpButton.opButtonValue == "÷") {
        if (result !=0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "÷";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "÷";
        }
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI = 0;
        result = 0;
        firstNum = true;
      } 
      if (iOpButton.opButtonValue == "+/-") {
        opValue = 'n';
        performCalculation();
      }
    }
  }


  for (int i=0; i<spButtons.length; i++) {
    Button iSpButton = spButtons[i];
    iSpButton.clickButton();
    if (iSpButton.on) {
      if (iSpButton.spButtonValue == ".") {
        //concantenate the values clicked on
        if (iSpButton.on && firstNum == true) {
          valueToCompute += iSpButton.spButtonValue;
          displayValue = valueToCompute;
        } else if (iSpButton.on && firstNum == false) {
          valueToCompute2 += iSpButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}


void performCalculation() {
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  }

  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }


  if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
      valueToCompute = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI);
      valueToCompute2 = str(valueToComputeI2);
    }
  }
}

void updateDisplay() {
  fill(120, 120, 130);
  rect(120, 40, 120, 30);
  fill(0);
  textSize(15);
  //if(iOpButton.on)
  text(displayValue, 122, 65);
  // if(!iOpButton.on)
  // text(displayValue, 272, 65);
}

class Button{
  // Class variables
  boolean isNumber;
  boolean isSpecial;
  boolean isOperator;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int boxSize = 20;
  int buttonW = 20;
  int buttonH = 20;
  boolean on = false;

  
  Button(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
}


//constructor for number buttons
  Button asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  
  //constructor for operator buttons
  Button asOperator(String tempOpButtonValue, int tempW, int tempH) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
    
  }
  
  //constructor for special buttons
  Button asSpecial(String buttonValue) {
    isSpecial = true;
    spButtonValue = buttonValue;
    return this;
  }
  
  //Draw the button on the canvas
  void display() {
    if(isNumber) {
      fill(120,120,130);
      stroke(200, 60, 80);
      strokeWeight(3);
      rect(xpos, ypos, buttonW, buttonH);
      fill(200,0,0);
      textSize(15);
      text(int(numButtonValue), xpos+6, ypos+16);
    } else if (isSpecial) {
      fill(120, 120, 130);
      stroke(100);
      strokeWeight(3);
      rect(xpos, ypos, buttonW, buttonH);
      fill(200,0,0);
      textSize(24);
      text(spButtonValue, xpos+6, ypos+12);
    } else if(isOperator) {
      fill(120,120,130);
      stroke(90, 180, 60);
      strokeWeight(3);
      rect(xpos, ypos, buttonW+10, buttonH);
      fill(200,90,0);
      textSize(15);
      //text(int(opButtonValue), xpos+6, ypos+16);
      //text((opButtonValue), xpos+9, ypos+15);
      text((opButtonValue), xpos+buttonW/2,ypos + buttonH/2+5);
    }
   }
 //Handle mouse actions
  void clickButton() {
    on = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}


  


