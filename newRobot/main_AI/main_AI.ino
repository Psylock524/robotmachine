const int BAUD_RATE = 4800;

const int LF_PIN = 11;
const int LB_PIN = 10;
const int RF_PIN = 6;
const int RB_PIN = 5;

const int MOVE_FORWARD = 1;
const int MOVE_BACKWARD = 2;
const int TURN_LEFT = 3;
const int TURN_RIGHT = 4;

int serialFunction;
const int SERIAL_ARRAY_SIZE = 255;
int serialVals[255];

void setup() {
  Serial.begin(BAUD_RATE);
  pinMode(LF_PIN, OUTPUT);
  pinMode(LB_PIN, OUTPUT);
  pinMode(RF_PIN, OUTPUT);
  pinMode(RB_PIN, OUTPUT);
}

void loop() {
}

int serialIndex = 0;
void serialEvent() {
  while(Serial.available() == 0);
  delay(200);

  while(Serial.available() > 0) {
    serialVals[serialIndex] = Serial.read();
    serialIndex++;
  }
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
  for(int i = 0; i < SERIAL_ARRAY_SIZE; i++) {
    Serial.write(serialVals[i]);
    serialVals[i] = 0;
  }
  serialIndex = 0;
}



