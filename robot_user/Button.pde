/*      
    Interactive robotic control system written in Processing for
    Schoolcraft College Math and Physics Club robotics project
    
    Button class
    
    1/1/2013
    
    by: Chad Schaffer (cmschaffer@gmail.com)
*/

class Button
{
  int size;
  int[] position;
  int value;
  String name;
  boolean[] toggle;
  int[] corners;
  int look;
  boolean lookFlag;
   
  
  Button()
  {
      position = new int[2];
      corners = new int[4];
      look = 200;
      toggle = new boolean[6];
  }
  Button(String nam,int siz, int[] pos, int val)
  {
      name = nam;
      size = siz;
      position = pos;
      value = val;
      corners = new int[4];
      corners[0] = position[0];
      corners[1] = position[1];
      corners[2] = position[0] + size;
      corners[3] = position[1] + size;
      toggle = new boolean[6];
    
    
  }
  void Set(String nam,int siz, int[] pos, int val)
  {
      name = nam;
      size = siz;
      position = pos;
      value = val;
      corners[0] = position[0];
      corners[1] = position[1];
      corners[2] = position[0] + size;
      corners[3] = position[1] + size;
      
  }
  boolean[] Pressed()
  {
    look = 0;
    toggle[0] = true;
    lookFlag = true;
    
    
    switch(value)
    {
        case 1: break;//send
        case 51: toggle[1] = true;
                 toggle[2] = true; 
                 break;
        case 57: toggle[1] = true;
                 toggle[2] = true;
                 break;
        case 81: toggle[1] = true;
                  break;
        case 87: toggle[1] = true;
                  break;
        default: break;//
    }
    
    return toggle;
    
  }
  void Released()
  {
     look = 200;
     lookFlag = false; 
  }
  boolean TellLookFlag()
  {
     return lookFlag; 
  }
  int[] TellPlace()
  {
   return corners; 
  }
  int TellVal()
  {
   return value; 
    
  }
  String AskDur()
  {
   return "For how long?: "; 
  }
  String AskVal()
  {
    return "What Magnitude (power, radians)?: ";
  }
  void Visual()
  {
    fill(look);
    quad(position[0], position[1],
         position[0]+size, position[1],
         position[0]+size, position[1]+size,
         position[0], position[1]+size);
    
    fill(255,0,0);
    text(name, position[0]+5, position[1]+20); 
  }
  
  
}
