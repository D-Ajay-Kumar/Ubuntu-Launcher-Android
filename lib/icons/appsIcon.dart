import 'package:flutter/material.dart';

class AppsIcon extends StatelessWidget {
  final Function onPressed;

  AppsIcon({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
        Navigator.of(context).pop();
      },
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            height: 50,
            width: 50,
          ),
          Text('Apps'),
        ],
      ),
    );
  }
}
