import 'package:flutter/material.dart';

import 'package:device_apps/device_apps.dart';

import '../utils/constants.dart';

class AppsScreen extends StatefulWidget {
  @override
  _AppsScreenState createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 15,
          right: 15,
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 1.1,
          ),
          children: List.generate(
            appsList.length,
            (i) {
              Application app = appsList[i];
              return app is ApplicationWithIcon
                  ? GestureDetector(
                      onTap: () {
                        app.openApp();
                      },
                      child: Column(
                        children: [
                          Image.memory(
                            app.icon,
                            height: 50,
                            width: 50,
                          ),
                          Text(
                            app.appName,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ),
    );
  }
}
