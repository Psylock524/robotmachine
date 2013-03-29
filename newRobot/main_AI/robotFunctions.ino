const int BASE_POWER = 127;
const int COMMAND_DELAY = 750;

void moveForward(int magnitude, int duration) {
  stopMoving();
  
  if(magnitude >= 0 && magnitude <= 255) {
    analogWrite(LF_PIN, magnitude);
    digitalWrite(LB_PIN, LOW);
    analogWrite(RF_PIN, magnitude);
    digitalWrite(RB_PIN, LOW);
    checkSensors(duration);
  }
  
  stopMoving();
  delay(COMMAND_DELAY);
}

void moveBackward(int magnitude, int duration) {
  stopMoving();
  
  if(magnitude >= 0 && magnitude <= 255) {
    digitalWrite(LF_PIN, LOW);
    analogWrite(LB_PIN, magnitude);
    digitalWrite(RF_PIN, LOW);
    analogWrite(RB_PIN, magnitude);
    checkSensors(duration);
  }
  
  stopMoving();
  delay(COMMAND_DELAY);
}

void turnLeft(int magnitude, int duration) {
  stopMoving();
  
  
  if(magnitude >= 0 && magnitude <= 255) {
    digitalWrite(LF_PIN, LOW);
    analogWrite(LB_PIN, magnitude);
    analogWrite(RF_PIN, magnitude);
    digitalWrite(RB_PIN, LOW);
    checkSensors(duration);
  }
  
  stopMoving();
  delay(COMMAND_DELAY);
}

void turnRight(int magnitude, int duration) {
  stopMoving();
  
  if(magnitude >= 0 && magnitude <= 255) {
    analogWrite(LF_PIN, magnitude);
    digitalWrite(LB_PIN, LOW);
    digitalWrite(RF_PIN, LOW);
    analogWrite(RB_PIN, magnitude);
    checkSensors(duration);
  }
  
  stopMoving();
  delay(COMMAND_DELAY);
}

void moveForwardTime(int duration) {
  stopMoving();
  
  analogWrite(LF_PIN, BASE_POWER);
  digitalWrite(LB_PIN, LOW);
  analogWrite(RF_PIN, BASE_POWER);
  digitalWrite(RB_PIN, LOW);
  checkSensors(duration);
  
  stopMoving();
  delay(COMMAND_DELAY);  
}

void moveBackwardTime(int duration) {
  stopMoving();
  
  digitalWrite(LF_PIN, LOW);
  analogWrite(LB_PIN, BASE_POWER);
  digitalWrite(RF_PIN, LOW);
  analogWrite(RB_PIN, BASE_POWER);
  checkSensors(duration);
  
  stopMoving();
  delay(COMMAND_DELAY);
}

void turnLeft90() {
  stopMoving();
  
  analogWrite(LB_PIN, BASE_POWER);
  digitalWrite(LF_PIN, LOW);
  analogWrite(RF_PIN, BASE_POWER);
  digitalWrite(RB_PIN, LOW);
  checkSensors(1.2);
  
  stopMoving();
  delay(COMMAND_DELAY);
}

void turnRight90() {
  stopMoving();
  
  digitalWrite(LB_PIN, LOW);
  analogWrite(LF_PIN, BASE_POWER);
  digitalWrite(RF_PIN, LOW);
  analogWrite(RB_PIN, BASE_POWER);
  checkSensors(1.2);
  
  stopMoving();
  delay(COMMAND_DELAY);
}

void stopMoving() {
  digitalWrite(LF_PIN, LOW);
  digitalWrite(LB_PIN, LOW);
  digitalWrite(RF_PIN, LOW);
  digitalWrite(RB_PIN, LOW);
}


void checkSensors(double dur) {
  for(int j = 0; j < (dur* 100); j++) {
    if(analogRead(EYE) <= 300) {
      sensorTriggered = true;
      break;
    }
    else if(analogRead(REAR_BUMPER) <= 10) {
      sensorTriggered = true;
      break;
    }
    else if(analogRead(FRONT_BUMPER) <= 10) {
      sensorTriggered = true;
      break;
    }
    
    delay(10);
  }
}
