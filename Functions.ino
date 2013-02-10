/*

    Functions for Control system written in Arduino for Schoolcraft
    College Math and Physics Club robotics project
    
    12/28/2012
    
    by: Chad Schaffer (cmschaffer@gmail.com)
    
*/

void TurnLeft(int value)  // this will activate the correct pins to 
                          // turn the robot left, "value" is the time
                          // of the turn.
{
  analogWrite(leftBac, 127);  //sends a half power PWM signal
  analogWrite(rightFor, 127);
  
  value = value * 1000;   //converts seconds to milli seconds 
  
  delay(value);         //delays for specified value
  
  digitalWrite(leftBac, LOW);  // ends the PWM signal
  digitalWrite(rightFor, LOW); 
      
}


void TurnRight(int value)   // this will activate the correct pins to 
                          // turn the robot right, "value" is the time
                          // of the turn.
{
  analogWrite(leftFor, 127);
  analogWrite(rightBac, 127);  //sends a half power PWM signal
  
  value = value * 1000;   //converts seconds to milliseconds
  
  delay(value);          //delays while move is happening
  
  digitalWrite(leftFor, LOW);   //turns PWM signal off
  digitalWrite(rightBac, LOW);
}


void Forward(int Dur)    //activates the correct pins to cause the robot to 
                         // move forward, "Dur" is the specified time
{
  digitalWrite(leftFor, HIGH);
  digitalWrite(rightFor, HIGH);  //sends full power signal
  
  dur = dur * 1000;     /// converts seconds to milliseconds
  
  delay(dur);        // waits while move happens
  
  digitalWrite(leftFor, LOW);  //turns signal off
  digitalWrite(rightFor, LOW);
  
}


void Back(int dur)   // causes the robot to go backwards
                    // "dur" is the time of the move
{
  
  digitalWrite(leftBac, HIGH);  //sends full power signal
 digitalWrite(rightBac, HIGH);
  
  dur = dur * 1000;   //converts seconds to milli seconds
  
  delay(dur);       //delays the time of the move
  
  digitalWrite(leftBac, LOW);  //turns off signal
  digitalWrite(RightBac, LOW);
  
  
}

void Forward(int value, int dur)  // Overload of forward, "value" is 
                                   // the power of the move, a number between
                                   // 1 and 9, "dur" is time of move
{
  int vSquare = pow(value, 2);  //creates a squared term for the quadratic transform
  float A = 1.046153846;     //the coefficients for the quadratic transform
  float B = 17.35384615;
  float C = 14.07692308;
  
  float anVal = (vSquare * A) + (value * B) + C;  //quadractic transform
  
  int val = (int)anVal;     //rounds the result of the transform
  
  analogWrite(leftFor, val);  //sends a PWM signal for the move
  analogWrite(rightFor, val);
  
  dur = dur * 1000;   // converts seconds to milli seconds
  
  delay(dur);     /// delays for the move
  
  digitalWrite(leftFor, LOW);   //turns off PWM signal
  digitalWrite(rightFor, LOW);
  
}

void Back(int value, int dur)  //overload of back, "value" is the power
                               // of the move, a number between 1 and 9
                               //"dur" is time of the move
{
  int vSquare = pow(value, 2);  // squares the term for the quadratic transform
  float A = 1.046153846;
  float B = 17.35384615;    // coefficents for the quadradtic transform    
  float C = 14.07692308;
  
  float anVal = (vSquare * A) + (value * B) + C; // quadratic transform
  
  int val = (int)anVal;  //rounds the transformed value
  
  analogWrite(leftBac, val);  // sends PWM signal
  analogWrite(rightBac, val);
  
  dur = dur * 1000;  //converts seconds to milli seconds
  
  delay(dur);   //delays the time of the move
  
  digitalWrite(leftBac, LOW);
  digitalWrite(rightBac, LOW);  // turns off PWM signal
  
  
}
