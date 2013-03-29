const int BAUD_RATE = 4800; // How fast the serial data is transferred

// PINS
//11, 9, 3, 10
const int LF_PIN = 11; // Left Forward
const int LB_PIN = 9; // Left Backward
const int RF_PIN = 3; // Right Forward
const int RB_PIN = 10; // Right Backward
const int SEND_PIN = A0; // Do Actions Buttons

const int MOVE_FORWARD = 101;
const int MOVE_BACKWARD = 102;
const int TURN_LEFT = 103;
const int TURN_RIGHT = 104;
const int MOVE_FORWARD_TIME = 105;
const int MOVE_BACKWARD_TIME = 106;
const int TURN_LEFT_90 = 107;
const int TURN_RIGHT_90 = 108;

int serialFunction;
const int SERIAL_ARRAY_SIZE = 255;
int serialVals[255];
int serialIndex = 0;
int maxValue = 0;

//sensors
const int FRONT_BUMPER = A4;
const int REAR_BUMPER = A5;
const int EYE = A2;
boolean sensorTriggered = false;

void setup() {
  Serial.begin(BAUD_RATE);
  pinMode(LF_PIN, OUTPUT);
  pinMode(LB_PIN, OUTPUT);
  pinMode(RF_PIN, OUTPUT);
  pinMode(RB_PIN, OUTPUT);
  
  pinMode(FRONT_BUMPER, INPUT);
  pinMode(REAR_BUMPER, INPUT);
  pinMode(EYE, INPUT);
  pinMode(SEND_PIN, INPUT);
}


void loop() {
  
}

void serialEvent() {
  while(Serial.available() == 0);
  delay(300); // Takes a second to recieve all data from serial stream
  
  while(Serial.available() > 0) {
    serialVals[serialIndex] = Serial.read();
    maxValue = max(serialVals[serialIndex], maxValue);
    serialIndex++;
  }
  serialIndex = 0;
    
  while(Serial.available() == 0 && maxValue != 0) {
    if(analogRead(SEND_PIN) < 10) {
      delay(1000);
      doCommands();
    }
  }
}


void doCommands() {
  serialIndex = 0;

  while(serialVals[serialIndex] != 0 && sensorTriggered == false) {
    switch(serialVals[serialIndex++]) {
    case MOVE_FORWARD:
      moveForward(serialVals[serialIndex++], serialVals[serialIndex++]);
      break;
    case MOVE_BACKWARD:
      moveBackward(serialVals[serialIndex++], serialVals[serialIndex++]);
      break;
    case TURN_LEFT:
      turnLeft(serialVals[serialIndex++], serialVals[serialIndex++]);
      break;
    case TURN_RIGHT:
      turnRight(serialVals[serialIndex++], serialVals[serialIndex++]);
      break;
    case MOVE_FORWARD_TIME:
      moveForwardTime(serialVals[serialIndex++]);
      break;
    case MOVE_BACKWARD_TIME:
      moveBackwardTime(serialVals[serialIndex++]);
      break;
    case TURN_LEFT_90:
      turnLeft90();
      break;
    case TURN_RIGHT_90:
      turnRight90();
      break;
    default:
      break;
    }
  }

  serialIndex = 0;
  sensorTriggered = false;
}
