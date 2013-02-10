

void TurnLeft(int value)
{
  analogWrite(leftBac, 127);
  analogWrite(rightFor, 127);
  
  value = value * 100;
  
  delay(value);
  
  digitalWrite(leftBac, LOW);
  digitalWrite(rightFor, LOW);
      
}


void TurnRight(int value)
{
  analogWrite(leftFor, 127);
  analogWrite(rightBac, 127);
  
  value = value * 100;
  
  delay(value);
  
  digitalWrite(leftFor, LOW);
  digitalWrite(rightBac, LOW);
}


void Forward(int Dur)
{
  digitalWrite(leftFor, HIGH);
  digitalWrite(rightFor, HIGH);
  
  dur = dur * 1000;
  
  delay(dur);
  
  digitalWrite(leftFor, LOW);
  digitalWrite(rightFor, LOW);
  
}


void Back()
{
  
  digitalWrite(leftBac, HIGH);
  digitalWrite(rightBac, HIGH);
  
  dur = dur * 1000;
  
  delay(dur);
  
  digitalWrite(leftBac, LOW);
  digitalWrite(RightBac, LOW);
  
  
}

void Forward(int value, int dur)
{
  int vSquare = pow(value, 2);
  float A = 1.046153846
  float B = 17.35384615;
  float C = 14.07692308;
  
  float anVal = (vSquare * A) + (value * B) + C;
  
  int val = (int)anVal;
  
  analogWrite(leftFor, val);
  analogWrite(rightFor, val);
  
  dur = dur * 1000;
  
  delay(dur);
  
  digitalWrite(leftFor, LOW);
  digitalWrite(rightFor, LOW);
  
}

void Back(int value, int dur)
{
  int vSquare = pow(value, 2);
  float A = 1.046153846
  float B = 17.35384615;
  float C = 14.07692308;
  
  float anVal = (vSquare * A) + (value * B) + C;
  
  int val = (int)anVal;
  
  analogWrite(leftBac, val);
  analogWrite(rightBac, val);
  
  dur = dur * 1000;
  
  delay(dur);
  
  digitalWrite(leftBac, LOW);
  digitalWrite(rightBac, LOW);
  
  
}
