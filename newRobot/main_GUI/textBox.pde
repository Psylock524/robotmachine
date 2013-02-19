class TextBox {
  int m_xPos;
  int m_yPos;
  int m_width = 500;
  int m_height = 600;
  String m_title = "Text Box";
  int m_titleSize = 14;
  String m_text = "";
  int m_textSize = 11;
  boolean m_toggle = false;
  color m_color = 0;
  color m_strokeColor = 127;
  color m_textColor = 255;
  int m_textXOffset = 5;
  int m_textYOffset = 15;
  
  TextBox(int xPos, int yPos) {
    m_xPos = xPos;
    m_yPos = yPos;
  }
    
  TextBox(int xPos, int yPos, String title) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_title = title;
  }
  
  TextBox(int xPos, int yPos, String title, String text) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_title = title;
    m_text = text;
  }
    
  TextBox(int xPos, int yPos, int pWidth, int pHeight) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
  }
  
  TextBox(int xPos, int yPos, int pWidth, int pHeight, String title) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_title = title;
  }
    
  TextBox(int xPos, int yPos, int pWidth, int pHeight, String title, String text) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_title = title;
    m_text = text;
  }
    
  TextBox(int xPos, int yPos, int pWidth, int pHeight, color pColor, color textColor) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_color = pColor;
    m_textColor = textColor;
  }
    
  TextBox(int xPos, int yPos, int pWidth, int pHeight, String text, color pColor, color textColor) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_text = text;
    m_color = pColor;
    m_textColor = textColor;
  }
  
  void write(char Char) {
    println("char: " + str(Char));
    m_text += Char - '0';
  }
  
  void write(String text) {
    m_text += text;
  }
  
  void write(int number) {
    println("number: " + number);
    m_text += str(number);
  }
  
  void writeln(char Char) {
    println("char: " + str(Char));
    m_text += (Char + '\n');
  }
  
  void writeln(String text) {
    m_text += (text + '\n');
  }
  
  void writeln(int number) {
    m_text += (str(number) + '\n');
  }
  
  void clear() {
    m_text = "";
  }
    
  void display() {    
    fill(m_color);
    stroke(m_strokeColor);
    strokeWeight(1);
    rect(m_xPos, m_yPos, m_width, m_height);
    
    fill(m_textColor);
    textAlign(CENTER,TOP);
    textSize(m_titleSize);
    text(m_title, m_xPos + (m_width/2), m_yPos + 5);
    
    textAlign(LEFT,BOTTOM);
    textSize(m_textSize);
    text(m_text, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset);
  }
    
  void display(color pColor, color textColor) {
    fill(pColor);
    stroke(m_strokeColor);
    strokeWeight(1);
    rect(m_xPos, m_yPos, m_width, m_height);
    
    fill(textColor);
    textAlign(CENTER,TOP);
    textSize(m_titleSize);
    text(m_title, m_xPos + (m_width/2), m_yPos + 5);
    
    textAlign(LEFT,BOTTOM);
    textSize(m_textSize);
    text(m_text, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset);
  }
    
  void display(String text) {
    fill(m_color);
    stroke(m_strokeColor);
    strokeWeight(1);
    rect(m_xPos, m_yPos, m_width, m_height);
    
    fill(m_textColor);
    textAlign(CENTER,TOP);
    textSize(m_titleSize);
    text(m_title, m_xPos + (m_width/2), m_yPos + 5);
    
    textAlign(LEFT,BOTTOM);
    textSize(m_textSize);
    text(text, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset);
  }
    
  void display(String text, color pColor, color textColor) {
    fill(pColor);
    stroke(m_strokeColor);
    strokeWeight(1);
    rect(m_xPos, m_yPos, m_width, m_height);
    
    fill(textColor);
    textAlign(CENTER,TOP);
    textSize(m_titleSize);
    text(m_title, m_xPos + (m_width/2), m_yPos + 5);
    
    textAlign(LEFT,BOTTOM);
    textSize(m_textSize);
    text(text, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset);
  }
}
