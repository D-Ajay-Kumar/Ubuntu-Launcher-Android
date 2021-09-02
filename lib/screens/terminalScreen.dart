import 'package:flutter/material.dart';

import 'package:xterm/flutter.dart';
import 'package:xterm/xterm.dart';

import '../utils/terminalCommands.dart';

class TerminalScreen extends StatefulWidget {
  @override
  _TerminalScreenState createState() => _TerminalScreenState();
}

class _TerminalScreenState extends State<TerminalScreen> {
  Terminal terminal;
  TerminalCommands terminalCommands;

  @override
  void initState() {
    super.initState();

    terminal = Terminal(onInput: onInput);

    terminalCommands = TerminalCommands();
    terminalCommands.initialiseTerminal(terminal);
  }

  void onInput(String input) {
    terminalCommands.handleCommand(terminal, input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff300924),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text('Terminal'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[900],
          actions: [
            GestureDetector(
              child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange[900],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 20,
                    ),
                  )),
              onTap: Navigator.of(context).pop,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TerminalView(terminal: terminal),
        ),
      ),
    );
  }
}
