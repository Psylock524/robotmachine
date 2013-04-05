void buildCommand(Command command, String inputText) {
  if(command.isWaiting() == false) {
    eraseCommands();
    commandConsole.writeln(command.getTitle());
    
    if(command.getArgNum() > 0) {
      commandInput.prompt(command.getPrompt(command.getCurrentIndex()));
      commandInput.focus();
      command.startWaiting();
    }
    else {
      commandList.writeln(command.getTitle());
      commandsToSend[commandsIndex++] = command.getCommandNumber();
      commandInput.clear();
      command.stopWaiting();
    }
  } else {
    if(inputText != "") {
      if(command.getCurrentIndex() < command.getArgNum()) {
        commandConsole.writeln(command.getPrompt(command.getCurrentIndex()) + inputText);
        command.setArg(int(inputText));
      }
      
      if(command.getCurrentIndex() < command.getArgNum()) {
        commandInput.prompt(command.getPrompt(command.getCurrentIndex()));
      } else {
        commandsToSend[commandsIndex++] = command.getCommandNumber();
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
  cmdTurnLeft90.clearArgs();
  cmdTurnLeft90.stopWaiting();
}

void sendCommands() {
  int emptyCount = 0;  
  try {
    for(int i = 0; i < commandsToSend.length; i++) {
      if(emptyCount >= 10) break;
      
      if(i > 0 && commandsToSend[i-1] == 0 && commandsToSend[i] == 0)
        emptyCount++;
      else
        emptyCount = 0;
        
      println(commandsToSend[i]);
      serial.write(commandsToSend[i]);
    }
  } catch (Exception e) {
    println("PROBLEM");
    serialConnected = false;
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
