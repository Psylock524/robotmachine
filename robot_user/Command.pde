/* 
    Interactive robotic control system written in Processing for
    Schoolcraft College Math and Physics Club robotics project
    
    command class
    
    12/30/2012
    
    by: Chad Schaffer (cmschaffer@gmail.com)
    
*/


class Command
{
  
  private int[] aPram;
  private String[] aQuestion;
  
  
  Command()
    {  
      aPram = new int[]{0,0,0};    //{action, magnitude, duration}
      aQuestion = new String[]{"none", "What Magnitude?: ", "For how Long?: "};
    }
  void Set(int Action, int Mag, int Dur)
      {
         aPram[0] = Action;
         aPram[1] = Mag;
         aPram[2] = Dur;
      }
  int TellAction()
      {
         return aPram[0]; 
      }
  int TellDur()
      {
         return aPram[2]; 
      }
  int TellValue()
      {
         return aPram[1]; 
      }
      
  void Visual(int x1,int y1,int x2,int y2,int x3,int y3,int x4,int y4)
      {
        String sVal = "None";
        
        if(aPram[0] == 51)
          sVal = "Forward";
        
        if(aPram[0] == 57)
          sVal = "Backward";
      
      int shad = 255;
      
      if(aPram[1] != 0)
      {
       shad = 255 - (aPram[1]*25);
      }
       fill(shad);
          
          quad(x1, y1,
               x2, y2,
               x3, y3,
               x4, y4);
              
          fill(255,0,0);
          text(sVal, x1, y1+10);
          text(aPram[1], x1, y1+25);
          if(aPram[2] != 0)
          {
            text(aPram[2], x1, y1+40);
            text("sec", x1 + 20, y1+40);
          } 
      }
      
      void SetAction(int act)
      {
       aPram[0] = act; 
      }
      
      boolean SetDur(String thing)
      {
        int dur = int(thing);
        println(dur);
        boolean valid = true;
        if(dur >= 1 && dur <= 9)
        {
       aPram[2] = dur;
       valid = false;
        }
        
        return valid;
      }
      
      boolean SetVal(String thing)
      {
        boolean valid = true;
        int val = int(thing);
       
        
        if(val >=1 && val <= 9)
        {
         aPram[1] = val;
          valid = false; 
        }
        
        return valid;
  
      }
      
      String Complete(boolean[] toggle)
     {
       String tell;
       
          if(toggle[1] == true)
            {
              tell = aQuestion[1];
            }
          else if(toggle[2] == true)
            {
              tell = aQuestion[2];
            }
          else
             tell = "good";
             
       
       return tell;      
             
     } 
  
  
  
  
  
}
