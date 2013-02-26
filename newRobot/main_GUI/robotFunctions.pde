void buildCommand(Command command, String inputText) {
  if(command.isWaiting() == false) {
    eraseCommands();
    commandConsole.writeln(command.getTitle());
    commandInput.prompt(command.getPrompt(command.getCurrentIndex()));
    commandInput.focus();
    command.startWaiting();
  } else {
    if(inputText != "") {
      if(command.getCurrentIndex() < command.getArgNum()) {
        commandConsole.writeln(command.getPrompt(command.getCurrentIndex()) + inputText);
        command.setArg(int(inputText));
      }
      
      if(command.getCurrentIndex() < command.getArgNum()) {
        commandInput.prompt(command.getPrompt(command.getCurrentIndex()));
      } else {
        commandsToSend[commandsIndex++] = (command.getCommandNumber());
        println(byte(command.getCommandNumber()));
        commandList.write(command.getTitle() + ": ");
        for(int i = 0; i < command.getArgNum(); i++) {
          commandsToSend[commandsIndex++] = command.getArg(i);
          commandList.write(command.getArg(i) + " ");
        }
        commandList.writeln("");
        commandInput.clear();
        command.clearArgs();
        command.stopWaiting();
      }
    } else {
      commandInput.focus();
    }
  } 
}

void eraseCommands() {
  commandInput.clear();
  commandConsole.clear();
  
  cmdMoveForward.clearArgs();
  cmdMoveForward.stopWaiting();
  cmdMoveBackward.clearArgs();
  cmdMoveBackward.stopWaiting();
  cmdTurnLeft.clearArgs();
  cmdTurnLeft.stopWaiting();
  cmdTurnRight.clearArgs();
  cmdTurnRight.stopWaiting();
}

void sendCommands() {  
  for(int i = 0; i < commandsToSend.length; i++) {
    serial.write(commandsToSend[i]);
  }
}

void clearCommands() {
  commandList.clear();
  commandInput.clear();
  commandConsole.clear();
  
  commandsIndex = 0;
  for(int i = 0; i < commandsToSend.length; i++) {
    commandsToSend[i] = 0;
  }
}
