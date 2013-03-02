class Button {
  int m_xPos;
  int m_yPos;
  int m_width = 50;
  int m_height = 50;
  String m_text = "";
  boolean m_toggle = false;
  color m_color = 200;
  color m_textColor = 0;
  
  Button(int xPos, int yPos) {
    m_xPos = xPos;
    m_yPos = yPos;
  }
    
  Button(int xPos, int yPos, String text) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_text = text;
  }
    
  Button(int xPos, int yPos, int pWidth, int pHeight) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
  }
    
  Button(int xPos, int yPos, int pWidth, int pHeight, String text) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_text = text;
  }
    
  Button(int xPos, int yPos, int pWidth, int pHeight, color pColor, color textColor) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_color = pColor;
    m_textColor = textColor;
  }
    
  Button(int xPos, int yPos, int pWidth, int pHeight, String text, color pColor, color textColor) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_text = text;
    m_color = pColor;
    m_textColor = textColor;
  }
  
  boolean isMouseOver() {
    if(mouseX >= m_xPos && mouseX <= (m_xPos + m_width) && mouseY >= m_yPos && mouseY <= (m_yPos + m_height)) {
      return true;
    } else {
      return false;
    }
  }
    
  void display() {
    fill(m_color);
    strokeWeight(0);
    rect(m_xPos, m_yPos, m_width, m_height);
    fill(m_textColor);
    textAlign(CENTER,CENTER);
    text(m_text, m_xPos + (m_width/2), m_yPos + (m_height/2));
  }
    
  void display(color pColor, color textColor) {
    fill(pColor);
    strokeWeight(0);
    rect(m_xPos, m_yPos, m_width, m_height);
    fill(textColor);
    textAlign(CENTER, CENTER);
    text(m_text, m_xPos + (m_width/2), m_yPos + (m_height/2));
  }
    
  void display(String text) {
    fill(m_color);
    strokeWeight(0);
    rect(m_xPos, m_yPos, m_width, m_height);
    fill(m_textColor);
    textAlign(CENTER, CENTER);
    text(text, m_xPos + (m_width/2), m_yPos + (m_height/2));
  }
    
  void display(String text, color pColor, color textColor) {
    fill(pColor);
    strokeWeight(0);
    rect(m_xPos, m_yPos, m_width, m_height);
    fill(textColor);
    textAlign(CENTER, CENTER);
    text(text, m_xPos + (m_width/2), m_yPos + (m_height/2));
  }
}
