class TextInput {
  int m_xPos;
  int m_yPos;
  int m_width = 490;
  int m_height = 30;
  String m_promptText = "";
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
  
  void prompt(String promptText) {
    m_promptText = promptText;
  }
  
  void addChar(char pChar) {
    m_text += pChar;
  }
  
  void removeChar() {
    if(m_text.length() > 0)
      m_text = m_text.substring(0, m_text.length() -1);
  }
  
  String getText() {
    return m_text;
  }
  
  void clear() {
    m_promptText = "";
    m_text = "";
  }
  
  void clearText() {
    m_text = "";
  }
  
  boolean isMouseOver() {
    if(mouseX >= m_xPos && mouseX <= (m_xPos + m_width) && mouseY >= m_yPos && mouseY <= (m_yPos + m_height)) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isActive() {
    return m_isActive;
  }
  
  void isActive(boolean isActive) {
   m_isActive = isActive;
  }
  
  void focus() {
    m_isActive = true;
  }
    
  void display() {    
    fill(m_color);
    stroke(m_strokeColor);
    strokeWeight(1);
    rect(m_xPos, m_yPos, m_width, m_height);
    
    fill(m_textColor);
    textAlign(LEFT,BOTTOM);
    textSize(m_textSize);
    text(m_promptText, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset - m_textSize);
    text(m_text, m_xPos + m_textXOffset, m_yPos + m_height - m_textYOffset);
    
    if(this.isActive()) {
      rect(m_xPos + 1, m_yPos + 1, 3, m_height - 1);
    }
  }
}
