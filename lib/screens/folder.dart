import 'package:flutter/material.dart';

import '../icons/folderIcon.dart';

class Folder extends StatelessWidget {
  final String folderName;

  Folder({this.folderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900].withOpacity(0.5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(folderName),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white38,
            ),
            onPressed: Navigator.of(context).pop,
          ),
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
      body: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FolderIcon(
              folderName: 'Folder 1',
              assetName: 'assets/folder.png',
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: FolderIcon(
          //     folderName: 'Folder 2',
          //     assetName: 'assets/folder.png',
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: FolderIcon(
          //     folderName: 'Folder 3',
          //     assetName: 'assets/folder.png',
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: FolderIcon(
          //     folderName: 'Folder 4',
          //     assetName: 'assets/folder.png',
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: FolderIcon(
          //     folderName: 'Folder 5',
          //     assetName: 'assets/folder.png',
          //   ),
          // ),
        ],
      ),
    );
  }
}
