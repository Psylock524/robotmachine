class Command {
  int m_commandNumber;
  int m_argument[];
  int m_index = 0;
  String m_title = "";
  String m_promptText[];
  boolean m_waiting = false;
  
  Command(String title, int number, int args, String promptText[]) {
    m_title = title;
    m_commandNumber = number;
    m_argument = new int[args];
    this.clearArgs();
    m_promptText = new String[args];
    for(int i = 0; i < m_promptText.length; i++) {
      m_promptText[i] = promptText[i];
    }
  }
  
  int getCommandNumber() {
    return m_commandNumber;
  }
  
  String getTitle() {
    return m_title;
  }
  
  String getPrompt(int index) {
    if(index >= 0 && index < m_promptText.length)
      return m_promptText[index];
    else
      return "You should not be reading this.";
  }
  
  void clearArgs() {
    for(int i = 0; i < m_argument.length; i++) {
      m_argument[i] = 0;
    }
    m_index = 0;
  }
  
  void setArg(int arg) {
    if(m_index >= 0 && m_index < m_argument.length) {
      m_argument[m_index] = arg;
      m_index++;
    }
  }
  
  int getArg(int index) {
    return m_argument[index];
  }
  
  int getArgNum() {
    return m_argument.length;
  }
  
  int getCurrentIndex() {
    return m_index;
  }
  
  void startWaiting() {
    m_waiting = true;
  }
  
  void stopWaiting() {
    m_waiting = false;
  }
  
  boolean isWaiting() {
    return m_waiting;
  }
}
