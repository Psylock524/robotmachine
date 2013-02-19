class TextInput {
  int m_xPos;
  int m_yPos;
  int m_width = 490;
  int m_height = 50;
  String m_text = "";
  int m_textSize = 11;
  boolean m_isActive = false;
  color m_color = 0;
  color m_strokeColor = 127;
  color m_textColor = 255;
  int m_textXOffset = 5;
  int m_textYOffset = 0;
  
  TextInput(int xPos, int yPos) {
    m_xPos = xPos;
    m_yPos = yPos;
  }
    
  TextInput(int xPos, int yPos, int pWidth, int pHeight) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
  }
    
  TextInput(int xPos, int yPos, int pWidth, int pHeight, color pColor, color textColor) {
    m_xPos = xPos;
    m_yPos = yPos;
    m_width = pWidth;
    m_height = pHeight;
    m_color = pColor;
    m_textColor = textColor;
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
    textAlign(LEFT,BOTTOM);
    textSize(m_textSize);
    text(m_text, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset);
  }
    
  void display(color pColor, color textColor) {
    fill(pColor);
    stroke(m_strokeColor);
    strokeWeight(1);
    rect(m_xPos, m_yPos, m_width, m_height);
    
    fill(m_textColor);
    textAlign(LEFT,BOTTOM);
    textSize(m_textSize);
    text(m_text, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset);
  }
}
