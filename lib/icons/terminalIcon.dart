import 'package:flutter/material.dart';

import '../screens/terminalScreen.dart';

class TerminalIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return TerminalScreen();
            },
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(
            'assets/terminal.png',
            height: 50,
            width: 50,
          ),
          Text('Terminal'),
        ],
      ),
    );
  }
}
