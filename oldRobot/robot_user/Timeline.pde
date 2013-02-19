/* 
    Interactive robotic control system written in Processing for
    Schoolcraft College Math and Physics Club robotics project
    
    timeline class
    
    12/28/2012
    
    by: Chad Schaffer (cmschaffer@gmail.com)
    
*/


class Timeline{
  
  private Command[] aCom;
  private int lineSize;
  //int[] aCom = new int[6];
  //int[] aDur = new int[6];
  
 
    Timeline(int size)
    {
    //Command load;
    
    //load = new Command();
      lineSize = size;
    aCom = new Command[size];
    
    for(int j = 0; j< size ; j++)
    {
     aCom[j] = new Command(); 
    }
    
    }
    
    void Set(int set, int Action, int Dur, int Value)
        {
            aCom[set].Set(Action,Dur,Value);
            //aCom[set] = Com;
            //aDur[set] = Dur + 48;
        }
    void Set(int point, Command load)
     {
        aCom[point] = load; 
     }
     
    int ReadComAct(int point)
        {
            return aCom[point].TellAction();
        }
    int ReadComDur(int point)
        {
            return aCom[point].TellDur(); 
        }
    int ReadComValue(int point)
       {
           return aCom[point].TellValue();
       } 
   
   void Visual()
       {
           fill(255);
           quad(50, height/5 - 50,
           width - 50, height/5 - 50,
           width - 50, height/5 + 50,
           50, height/5 + 50);
           
           int x1 = 55;
           int x2 = 105;
           int x3 = 105;
           int x4 = 55;
           
           int y1 = height/5 - 45;
           int y2 = height/5 + 45;
           
           
           for(int j = 0; j < lineSize; j++)
             {
                 int offset = j * 50;
                 aCom[j].Visual(x1+offset, y1, x2+offset, y1, x3+offset, y2, x4 +offset, y2); 
             }
     
       } 
}
    
    
