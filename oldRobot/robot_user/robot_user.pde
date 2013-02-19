/*      
    Interactive robotic control system written in Processing for
    Schoolcraft College Math and Physics Club robotics project
    
    main code
    
    12/28/2012
    
    by: Chad Schaffer (cmschaffer@gmail.com)
*/
import processing.serial.*;

int buttSize = 5;
int lineSize = 6;

int x = 0;
int y = 0;
Serial port;
int count = 0;
Timeline mainLine;
Timeline oldLine;
int nRun = 0;
int nButtChk = 0;
Button[] menu;
TextBox terminal;
String answer = "";
Command load;
int menuPoint = 0;
String question = "";

boolean[] textToggle = new boolean[6];


void setup(){

   size(1000, 600);
   background(0,0,159);
   
  println(Serial.list());
   
  //port = new Serial(this, Serial.list()[0], 4800);
        
  mainLine = new Timeline(lineSize);
  menu = new Button[buttSize];
 

  
  int[] pos = new int[] {600, 200};
  terminal = new TextBox(pos, 400, 200, 0, "Welcome, please select a command:\n");
  load = new Command();
  
  pos = new int[] {width/10 + 50, height/3};
  menu[0] = new Button("Send", 75, pos, 1);
  pos = new int[] {width/10, height/3 + 100};
  menu[1] = new Button("Forward", 75, pos, 51);
  pos = new int[] {width/10 + 100, height/3 + 100};
  menu[2] = new Button("Backward", 75, pos, 57);
  pos = new int[] {width/10, height/3 + 200};
  menu[3] = new Button("Left", 75, pos, 81);
  pos = new int[] {width/10 + 100, height/3 + 200};
  menu[4] = new Button("Right", 75, pos, 87);
}


void draw()
{

  mainLine.Visual();
  terminal.Visual();
  for(int j = 0; j < buttSize; j++)
  {
  menu[j].Visual();
  }
  
  if(textToggle[0] == true)
     {
       question = load.Complete(textToggle);
       textToggle[0] = false;
       textToggle[5] = true;
         if(question.equals("good"))
           {
             mainLine.Set(count, load);
             load = new Command();
             count++;
             //pritln(load.TellAction());
            // println(load.TellValue());
            // println(load.TellDur());
             textToggle[0] = false;
           }
        else
          {
            terminal.AddText(question);
          }
     }
 
     
 
}



void mousePressed()
{
  if(textToggle[0] == false)
  {
    for(int j = 0; j < buttSize; j++)
      {
         int[] corners = menu[j].TellPlace();
           if(mouseX >= corners[0] &&
              mouseX <= corners[2] &&
              mouseY >= corners[1] &&
              mouseY <= corners[3])
              {     
                 textToggle = menu[j].Pressed();
                 load.SetAction(menu[j].TellVal());
                 menuPoint = j; 
                 
                 if(menu[j].TellVal() == 1)
                 {
                   //send
                 }
                 
                 
                               
                }
          
       
      }
  }
      
  
    
}

void mouseReleased()
{
   for(int j = 0; j < buttSize; j++)
      {
         if(menu[j].TellLookFlag() == true)
                        menu[j].Released();
       
      }
 
}

void keyPressed()
{
 
  
     
   if(textToggle[5] == true)
 {  
 
   
     if(key != 10)
     {
       answer = answer + key;   
     }
     textToggle[5] = terminal.AddText(key);
     if(textToggle[5] == false)
        { 
         if(textToggle[1] == true)
           {  
              
             textToggle[1] = load.SetVal(answer);
         
             textToggle[0] = true;
             textToggle[5] = false;
             answer = "";
           }
         else if(textToggle[2] == true)
           {
             textToggle[2] = load.SetDur(answer);
             textToggle[0] = true;
             textToggle[5] = false;
              answer = "";             
           }     
       
     }
   
   
 }
  
}


boolean SendTimeline(Timeline out, Serial port)
{
  
  for(int j = 0; j < lineSize; j++)
  {
    
   port.write(out.aCom[j].TellAction());
   port.write(out.aCom[j].TellValue());
   if(out.aCom[j].TellDur() != 0)
     port.write(out.aCom[j].TellDur());
  }
  
  port.write(13);
  
  return true;
  
}
  

