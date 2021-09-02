import 'package:flutter/material.dart';
import 'dart:async';

import 'package:glass_kit/glass_kit.dart';
import 'package:intl/intl.dart';
import 'package:flutter_glow/flutter_glow.dart';

class TimeWidget extends StatefulWidget {
  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  String _timeString;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 170,
      width: 170,
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.30),
          Colors.white.withOpacity(0.10)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderColor: Colors.transparent,
      blur: 15.0,
      shape: BoxShape.circle,
      elevation: 10.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlowText(
            DateFormat.yMMMMd().format(DateTime.now()),
            blurRadius: 5,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          GlowText(
            _timeString.toString(),
            blurRadius: 5,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
