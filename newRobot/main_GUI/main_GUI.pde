import processing.serial.*; // Allow use of serial library

final static int WINDOW_WIDTH = 1080;
final static int WINDOW_HEIGHT = 608;
boolean sketchFullScreen() { return true; } // Whether or not to run in full screen

Serial serial; // Create new serial object
boolean serialConnected = false;
String serialName;
final static int BAUD_RATE = 4800; // Baud-Rate constant - Speed at which serial data travels
int commandsToSend[]; // Array of commands to send to Arduino
int commandsIndex = 0; // Index number that tells program where to put user values in the Array

// Create Command Objects and create corresponding constants for robot functions
Command cmdMoveForward;
final static int MOVE_FORWARD = 101;
Command cmdMoveBackward;
final static int MOVE_BACKWARD = 102;
Command cmdTurnLeft;
final static int TURN_LEFT = 103;
Command cmdTurnRight;
final static int TURN_RIGHT = 104;
Command cmdMoveForwardTime;
final static int MOVE_FORWARD_TIME = 105;
Command cmdMoveBackwardTime;
final static int MOVE_BACKWARD_TIME = 106;
Command cmdTurnLeft90;
final static int TURN_LEFT_90 = 107;
Command cmdTurnRight90;
final static int TURN_RIGHT_90 = 108;

// Create function buttons
Button upButton;
Button downButton;
Button leftButton;
Button rightButton;

TextBox commandConsole; // Create command console, which is a Text Box object
TextInput commandInput; // Create command input, which is a Text Input object

TextBox commandList; // Create command list, which is a Text Box object
Button sendButton; // Create button for sending of commands
Button commandClearButton; // Create button for clearing commands

void setup() {
  size(displayWidth, displayHeight); // Set window size and height, using constants made previously
  if(serial.list().length > 0) {
    serialName = serial.list()[0];
    serial = new Serial(this, serial.list()[0], BAUD_RATE); // Construct serial object, with the applet being this one, the serial port being the first available one, and the baud rate set to the constant made previously
    serialConnected = true;
  } else {
    serialConnected = false;
  }
    
  commandsToSend = new int[255]; // Construct commandsToSend array, setting a number as the amount of "cells" it can contain
  
  String prompts[] = {"Magnitude (0-255): ", "Duration (seconds; 0-255): "}; // Create array of strings to use as the promps for the commands
  String prompts2[] = {"Duration (seconds; 0-255): "};  
  // Construct the commands for Processing to send to Arduino
  // Arguments are command name, command number (for sending as serial data) in constant form, number of parameters for the function, and the prompts to use
  cmdMoveForward = new Command("Move Forward", MOVE_FORWARD, 2, prompts);
  cmdMoveBackward = new Command("Move Backward", MOVE_BACKWARD, 2, prompts);
  cmdTurnLeft = new Command("Turn Left", TURN_LEFT, 2, prompts);
  cmdTurnRight = new Command("Turn Right", TURN_RIGHT, 2, prompts);
  cmdMoveForwardTime = new Command("Move Forward", MOVE_FORWARD_TIME, 1, prompts2);
  cmdMoveBackwardTime = new Command("Move Backward", MOVE_BACKWARD_TIME, 1, prompts2);
  cmdTurnLeft90 = new Command("Turn Left 90°", TURN_LEFT_90);
  cmdTurnRight90 = new Command("Turn Right 90°", TURN_RIGHT_90);
  
  // Construct buttons for the user interface
  // Arguments are X-Position, Y-Position, and the text on the button
  upButton = new Button(80, height - 155, "MOVE\nFORWARD");
  downButton = new Button(80, height - 90, "MOVE\nBACKWARD");
  leftButton = new Button(15, height - 90, "TURN\nLEFT 90°");
  rightButton = new Button(145, height - 90, "TURN\nRIGHT 90°");
  
  commandConsole = new TextBox(width-width/3, 10, width/3 -3, height-40, "COMMAND CONSOLE"); // Construct command console with arguments X-Position, Y-Position, and title 
  
  // Constructs the commandInput using various fiddly methods, because I preferred not to make a class method for one use
  commandInput = new TextInput(commandConsole.m_xPos + 5, 0);
  commandInput.m_yPos = (commandConsole.m_yPos + commandConsole.m_height - commandInput.m_height -5);
  commandInput.m_width = commandConsole.m_width - 10;

  commandConsole.m_textYOffset = commandInput.m_height;  // Sets the command console's text offset (how high up the text is from the bottom of the window) as the height of the command input box, making it dynamic
  
  commandList = new TextBox(width-(2*width/3), 10, width/3 -3, height-40, "COMMAND LIST"); // Constructs the command list; setting X-Position, Y-Position, Width, and Height dynamically and giving it a title
  sendButton = new Button(width - commandList.m_xPos - commandList.m_width - 70, height - 90, "SEND"); // Constructs the send button; It was constructed here because it is based off the position of the command list
  commandClearButton = new Button(width - commandList.m_xPos - commandList.m_width - 70, height - 155, "CLEAR"); // Constructs the clear button - Also based off the command list
}

/*
// MAIN METHOD
// Where all the work gets done - always make as compact as possible
*/
void draw() {
  textSize(10);
  background(43); // Dark grey background color - "refreshes" the screen
  
  // Outsourcing code to functions for the sake of abstraction
  displayButtons();
  displayCommandTerminal();
  displayCommandList();
  checkMouseOver();
  
  if(serialConnected == false && serial.list().length > 0) {
    serial = new Serial(this, serial.list()[0], BAUD_RATE);
    serialConnected = true;
  }
  
  if(serialConnected == false) {
    fill(127, 20, 20);
    textSize(32);
    textAlign(LEFT, CENTER);
    text("NO SERIAL CONNECTION", 20, 20);
  }
}

void displayButtons() { // Displays buttons; is called by main "draw" function
  upButton.display();
  downButton.display();
  leftButton.display();
  rightButton.display();
  sendButton.display();
  commandClearButton.display();
}

void displayCommandTerminal() { // Displays the command terminal and input box; is called by main "draw" function
  commandConsole.display();
  commandInput.display();
}

void displayCommandList() { // Displays the command list; is called by main "draw" method
  commandList.display();
}

void checkMouseOver() { // Checks if mouse is over an object, and acts appropriately

  if(upButton.isMouseOver()) // Checks if mouse is over button
    upButton.display(color(0,255,0), color(0)); // If it is, changes button color to green (RGB) and text color to black (A)
  if(downButton.isMouseOver())
    downButton.display(color(0,255,0),color(0));
  if(leftButton.isMouseOver())
    leftButton.display(color(0,255,0), color(0));
  if(rightButton.isMouseOver())
    rightButton.display(color(0,255,0), color(0));
  if(sendButton.isMouseOver())
    sendButton.display(color(0,255,0), color(0));
  if(commandClearButton.isMouseOver())
    commandClearButton.display(color(255,25,25), color(0));
}

void mousePressed() { // Does things when the mouse is clicked, called by Processing itself, not the "draw" function
  
  sendCommands();
  
  if(commandInput.isMouseOver()) { // If mouse is over command input
    commandInput.focus(); // Activate it for typing in
  } else { // Otherwise,
    commandInput.isActive(false); // Deactivate it for typing
  }
  
  // If mouse is over function button, begin the function
  if(upButton.isMouseOver()) {
    buildCommand(cmdMoveForwardTime, "");
  }
  if(downButton.isMouseOver()) {
    buildCommand(cmdMoveBackwardTime, "");
  }
  if(leftButton.isMouseOver()) {
    buildCommand(cmdTurnLeft90, "");
  }
  if(rightButton.isMouseOver()) {
    buildCommand(cmdTurnRight90, "");
  }
  
  if(sendButton.isMouseOver()) { // If mouse is over send button
    sendCommands(); // Send the commands in the array to Arduino
  }
  if(commandClearButton.isMouseOver()) { // If mouse is over clear button
    clearCommands(); // Get rid of the commands and clear text boxes
  }
}

void keyPressed() { // Does things when a key is pressed; called by Processing itself, not the "draw" function
  if(commandInput.isActive()) { // If the input box is ready for typing
    if(Character.isDigit(key)) { // Check if the character being typed is a number
    commandInput.addChar(key); // If so, add it to the input box
    }
    
    switch(keyCode) { // If it is one of these special keys:
      case BACKSPACE:
        commandInput.removeChar(); // Remove the last character from the input box
        break;
      case ENTER:
        if(commandInput.getText().length() > 0) { // If there's any text in the input box
          String inputText = commandInput.getText(); // Get the text from the input box, and store it as a string 
          
          if(inputText.length() < 10 && int(inputText) >= 0 && int(inputText) <= 255) { // If the value input is 1 byte and is not too big to accurately measure 
            // Check which command is waiting for input, and send the text to it
            if(cmdMoveForward.isWaiting())
              buildCommand(cmdMoveForward, inputText);
            else if(cmdMoveBackward.isWaiting())
              buildCommand(cmdMoveBackward, inputText);
            else if(cmdTurnLeft.isWaiting())
              buildCommand(cmdTurnLeft, inputText);
            else if(cmdTurnRight.isWaiting())
              buildCommand(cmdTurnRight, inputText);
            else if(cmdMoveForwardTime.isWaiting())
              buildCommand(cmdMoveForwardTime, inputText);
            else if(cmdMoveBackwardTime.isWaiting())
              buildCommand(cmdMoveBackwardTime, inputText);
          }
        }
        commandInput.clearText(); // Clear the input box when done
        break;
      default:
        break;
    }
  }
  
  switch(key) { // If it is:
    case ' ': // The space bar
      sendCommands(); // Send the commands to Arduino
      break;
    case '`': // The grave accent
      clearCommands(); // Clear the commands array
      // Make all commands stop waiting
      cmdMoveForward.stopWaiting();
      cmdMoveBackward.stopWaiting();
      cmdTurnLeft.stopWaiting();
      cmdTurnRight.stopWaiting();
      cmdMoveForwardTime.stopWaiting();
      cmdMoveBackwardTime.stopWaiting();
      cmdTurnLeft90.stopWaiting();
      cmdTurnRight90.stopWaiting();      
      break;
    default:
      break;
  }
  switch(keyCode) {
    case UP:
      buildCommand(cmdMoveForward, "");
      break;
    case DOWN:
      buildCommand(cmdMoveBackward, "");
      break;
    case LEFT:
      buildCommand(cmdTurnLeft, "");
      break;
    case RIGHT:
      buildCommand(cmdTurnRight, "");
      break;
    default:
      break;
  }
}
