void moveForward(int magnitude, int duration) {
  stopMoving();
  
  Serial.println(magnitude);
  Serial.println(duration);
  
  if(magnitude >= 0 && magnitude <= 255) {
    analogWrite(LF_PIN, magnitude);
    analogWrite(RF_PIN, magnitude);
    delay(duration*1000);
  }
  
  stopMoving();
}

void moveBackward(int magnitude, int duration) {
  stopMoving();
  
  if(magnitude >= 0 && magnitude <= 255) {
    analogWrite(LB_PIN, magnitude);
    analogWrite(RB_PIN, magnitude);
    delay(duration*1000);
  }
  
  stopMoving();
}

void turnLeft(int magnitude, int duration) {
  stopMoving();
  
  if(magnitude >= 0 && magnitude <= 255) {
    analogWrite(LB_PIN, magnitude);
    analogWrite(RF_PIN, magnitude);
    delay(duration*1000);
  }
  
  stopMoving();
}

void turnRight(int magnitude, int duration) {
  stopMoving();
  
  if(magnitude >= 0 && magnitude <= 255) {
    analogWrite(LF_PIN, magnitude);
    analogWrite(RB_PIN, magnitude);
    delay(duration*1000);
  }
  
  stopMoving();
}

void stopMoving() {
  digitalWrite(LF_PIN, LOW);
  digitalWrite(LB_PIN, LOW);
  digitalWrite(RF_PIN, LOW);
  digitalWrite(RB_PIN, LOW);
}
