/*

    Control system written in Arduino for Schoolcraft
    College Math and Physics Club robotics project
    
    12/28/2012
    
    by: Chad Schaffer (cmschaffer@gmail.com)
   
   NOTE: all of this is antiquated to the point that it is probably
   better to start over, it was my initial code for understanding the 
   problem, so it may be of interest to the team.
   
   "Functions" is good code.
   
*/
//pins
int leftFor = 11;
int leftBac = 10;
int rightFor = 9;
int rightBac = 3;

int ButPow = 2;
int butIn = A0;


int nComand;  // for serial data
int nDur;

int aAction[6];  //arrays to carry out comands
int aDuration[6];

int nFoo;  //array pointer

void setup()
{
  Serial.begin(4800); //opens communication
  
  pinMode(leftFor, OUTPUT);   //set pin mode for all pins
  pinMode(leftBac, OUTPUT);
  pinMode(rightFor, OUTPUT);
  pinMode(rightBac, OUTPUT);
  pinMode(ButPow, OUTPUT);
  
  pinMode(butIn, INPUT);
  
}

void loop()
{
  digitalWrite(ForPin, LOW);
  digitalWrite(BackPin, LOW);
  nComand = 1;
  nTime = 0;
  nFoo = 0;
  
  while(nComand !=49  && nFoo != 5)
  {
    nComand = 1;
    nTime = 0;
    
    Serial.print("Command?:");
    
    while(nComand != 51 && nComand != 57)
    {
      if(Serial.available())
      {
    nComand = Serial.read();
    
    Serial.print(nComand);
      }
    }
    Serial.print("\n");
    
    aAction[nFoo] = nComand - 48;
    
    
    Serial.print("For how long?:");
    
    while(nTime < 49 || nTime > 57)
    {
     if(Serial.available())
    { 
    nTime = Serial.read();
    Serial.print(nTime);
    }
    }
    
    Serial.print("\n");
    
    aDuration[nFoo] = (nTime - 48)*1000;
    
    nFoo++;
   
  }
  
  Serial.print("\n \n");
  Serial.print("Press Space to run program");
  int k = 0;
  while(k != 32)
  {
   if(Serial.available())
  {
   k = Serial.read(); 
  }
  }
  
  for(int x = 0; x < 5; x++)
  {
   
   digitalWrite(aAction[x], HIGH);
   delay(aDuration[x]);
   digitalWrite(aAction[x], LOW);   
    
  }
  
  Serial.print("\n \n");
  
  
  
  
}
