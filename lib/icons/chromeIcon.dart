import 'package:flutter/material.dart';

import '../screens/chrome.dart';

class ChromeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ChromeWebView();
            },
          ),
        );
      },
      child: Image.asset(
        'assets/chrome.png',
        height: 50,
        width: 50,
      ),
    );
  }
}
