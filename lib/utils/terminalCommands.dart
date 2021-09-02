import 'package:device_apps/device_apps.dart';
import 'package:xterm/xterm.dart';

import './constants.dart';

class TerminalCommands {
  String command = '';
  int length = 0;

  void initialiseTerminal(Terminal terminal) {
    terminal.write('\r\n');
    terminal.write(deviceModel + '\$ ');
  }

  void handleCommand(Terminal terminal, String input) {
    if (input == '\r') {
      // cd command
      if (command.startsWith('cd')) {
        this.changeDirectory(command);
      }

      command = '';
      terminal.write('\r\n');
      terminal.write(deviceModel + '\$ ');
    }

    // backspace
    else if (input.codeUnitAt(0) == 127) {
      if (length > 0) {
        length -= 1;
        print(length);
        terminal.buffer.eraseCharacters(1);
        terminal.buffer.backspace();
        terminal.refresh();
      }
    } else {
      command += input;
      length += 1;
      terminal.write(input);
    }
  }

  // to open apps
  void changeDirectory(String command) {
    String appName = command.substring(3).toLowerCase();

    for (int i = 0; i < appsList.length; i++) {
      Application app = appsList[i];
      if (app.appName.toLowerCase() == appName.trim()) {
        app.openApp();
        break;
      }
    }
  }
}
