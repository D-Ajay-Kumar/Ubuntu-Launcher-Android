import 'package:flutter/material.dart';

import '../icons/appsIcon.dart';
import '../icons/folderIcon.dart';
import '../icons/chromeIcon.dart';
import '../icons/terminalIcon.dart';

class SideDrawer extends StatelessWidget {
  final Function toggleShowApps;

  SideDrawer({@required this.toggleShowApps});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: Colors.black.withOpacity(
            0.3), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Container(
        height: double.infinity,
        width: 75,
        child: Drawer(
          elevation: 0.0,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppsIcon(onPressed: toggleShowApps),
                  SizedBox(
                    height: 20,
                  ),
                  TerminalIcon(),
                  SizedBox(
                    height: 20,
                  ),
                  ChromeIcon(),
                  SizedBox(
                    height: 20,
                  ),
                  FolderIcon(
                    folderName: 'Computer',
                    assetName: 'assets/computer.png',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FolderIcon(
                    folderName: 'Recycle Bin',
                    assetName: 'assets/bin.png',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FolderIcon(
                    folderName: 'Movies',
                    assetName: 'assets/folder.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
