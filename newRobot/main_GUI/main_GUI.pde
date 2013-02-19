import processing.serial.*;

Serial serial;
final static int BAUD_RATE = 9600;

Button upButton;
Button downButton;
Button leftButton;
Button rightButton;
TextBox commandList;
TextInput commandInput;

void setup() {
  size(displayWidth, displayHeight);
  serial = new Serial(this, serial.list()[0], BAUD_RATE);
  
  upButton = new Button(60, 15, "UP");
  downButton = new Button(60, 70, "DOWN");
  leftButton = new Button(5, 70, "LEFT");
  rightButton = new Button(115, 70, "RIGHT");
  commandList = new TextBox(width-width/3, 10, width/3 - 3, height-40, "TERMINAL");
}

void draw() {
  background(43);
  displayButtons();
  displayCommandList();
  checkMouseOver();
}

boolean sketchFullScreen() { return true; }

void displayButtons() {
  upButton.display();
  downButton.display();
  leftButton.display();
  rightButton.display();
}

void displayCommandList() {
  commandList.display();
}

void checkMouseOver() {
  if(upButton.isMouseOver())
    upButton.display(color(0,255,0), color(0));
  if(downButton.isMouseOver())
    downButton.display(color(0,255,0),color(0));
  if(leftButton.isMouseOver())
    leftButton.display(color(0,255,0), color(0));
  if(rightButton.isMouseOver())
    rightButton.display(color(0,255,0), color(0));
}

void mousePressed() {
  if(upButton.isMouseOver()) {
    serial.write(1);
  }
  if(downButton.isMouseOver()) {
    serial.write(2);
  }
  if(leftButton.isMouseOver()) {
    serial.write(3);
  }
  if(rightButton.isMouseOver()) {
    serial.write(4);
  }
}

void keyPressed() {
  switch(key) {
    default:
      break;    
  }
  switch(keyCode) {
    default:
      break;
  }
}
