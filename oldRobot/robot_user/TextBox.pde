/*      
    Interactive robotic control system written in Processing for
    Schoolcraft College Math and Physics Club robotics project
    
    textbox class
    
    1/1/2013
    
    by: Chad Schaffer (cmschaffer@gmail.com)
*/


class TextBox
{
   int[] position;
   int size;
   int[] corners;
   int look;
   int fontLook;
   String content;
  
   TextBox(){}
   TextBox(int[] pos, int siz, int loo, int fontLoo)
    {
        position = pos;
        size = siz;
        look = loo;
        fontLook = fontLoo;
   
    }
    TextBox(int[] pos, int siz, int loo, int fontLoo, String con)
    {
        position = pos;
        size = siz;
        look = loo;
        fontLook = fontLoo;
        content = con;
   
    }
    
    boolean AddText(char add)
    {
      boolean toggle = true;
       if(add == 10)
       {
          println("enter");
          content = content + add;
          
          toggle = false;
       }
      else
      { 
         content = content + add;
      } 
    
      return toggle; 
    }
    
    void AddText(String add)
    {
    
         content = content + add;
    
    }
    
    String InputText()
    {
 
      return "Chad is a happy bunny";
    }
    
    void Visual()
    {
      fill(look);
      quad(position[0], position[1],
           position[0]+size, position[1],
           position[0]+size, position[1]+size,
           position[0], position[1]+size);
    
      fill(fontLook);
      text(content, position[0]+5, position[1]+20); 
    }
    
       
  
}

