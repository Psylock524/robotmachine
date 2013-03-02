const int BAUD_RATE = 4800;

const int LF_PIN = 10;
const int LB_PIN = 9;
const int RF_PIN = 3;
const int RB_PIN = 11;
const int SEND_PIN = A0;

const int MOVE_FORWARD = 1;
const int MOVE_BACKWARD = 2;
const int TURN_LEFT = 3;
const int TURN_RIGHT = 4;

int serialFunction;
const int SERIAL_ARRAY_SIZE = 255;
int serialVals[255];
int serialIndex = 0;


void setup() {
  Serial.begin(BAUD_RATE);
  pinMode(LF_PIN, OUTPUT);
  pinMode(LB_PIN, OUTPUT);
  pinMode(RF_PIN, OUTPUT);
  pinMode(RB_PIN, OUTPUT);

  pinMode(SEND_PIN, INPUT);
}

void loop() {
}

void serialEvent() {
  while(Serial.available() == 0);
  delay(600); // Takes a second to recieve all data from serial stream

  while(Serial.available() > 0) {
    serialVals[serialIndex] = Serial.read();
    serialIndex++;
  }
  serialIndex = 0;
  
  while(Serial.available() == 0) {
    if(analogRead(SEND_PIN) > 10)
      doCommands();
  }
}


void doCommands() {
  serialIndex = 0;

  while(serialVals[serialIndex] != 0) {
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
    default:
      break;
    }
  }

  serialIndex = 0;
}

