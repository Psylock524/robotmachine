const int BAUD_RATE = 4800;

const int LF_PIN = 11;
const int LB_PIN = 10;
const int RF_PIN = 6;
const int RB_PIN = 5;

int inInts[3];

void setup() {
  Serial.begin(BAUD_RATE);
  pinMode(LF_PIN, OUTPUT);
  pinMode(LB_PIN, OUTPUT);
  pinMode(RF_PIN, OUTPUT);
  pinMode(RB_PIN, OUTPUT);

  digitalWrite(LF_PIN, LOW);
  digitalWrite(LB_PIN, LOW);
  digitalWrite(RF_PIN, LOW);
  digitalWrite(RB_PIN, LOW);
}

void loop() {
  
  switch(inInts[0]) {
  case 0:
    digitalWrite(LF_PIN, LOW);
    digitalWrite(LB_PIN, LOW);
    digitalWrite(RF_PIN, LOW);
    digitalWrite(RB_PIN, LOW);
    break;
  case 1:
    analogWrite(LF_PIN, 255);
    digitalWrite(LB_PIN, LOW);
    digitalWrite(RF_PIN, LOW);
    digitalWrite(RB_PIN, LOW);
    break;
  case 2:
    digitalWrite(LF_PIN, LOW);
    analogWrite(LB_PIN, 255);
    digitalWrite(RF_PIN, LOW);
    digitalWrite(RB_PIN, LOW);
    break;
  case 3:
    digitalWrite(LF_PIN, LOW);
    digitalWrite(LB_PIN, LOW);
    analogWrite(RF_PIN, 255);
    digitalWrite(RB_PIN, LOW);
    break;
  case 4:
    digitalWrite(LF_PIN, LOW);
    digitalWrite(LB_PIN, LOW);
    digitalWrite(RF_PIN, LOW);
    analogWrite(RB_PIN, 255);
    break;
  }
}

void serialEvent() {
  delay(200);
  if(Serial.available() > 0) {
    for(int i = 0; i < sizeof(inInts)-sizeof(int)-1; i++) {
      inInts[i] = Serial.read();
      Serial.print(inInts[i] - '0');
    } Serial.println();
    Serial.print("Array Size: "); Serial.println(sizeof(inInts)-sizeof(int));
  }
}

