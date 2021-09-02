import 'package:flutter/material.dart';
import 'package:ubuntu_app/utils/constants.dart';

import '../screens/folder.dart';

class FolderIcon extends StatelessWidget {
  final String folderName;
  final String assetName;

  final double totalSpace = double.parse(
      (storageSpace.total / (1024 * 1024 * 1024)).toStringAsFixed(2));
  final double freeSpace = double.parse(
      (storageSpace.free / (1024 * 1024 * 1024)).toStringAsFixed(2));

  FolderIcon({this.folderName, this.assetName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Folder(
                folderName: folderName,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(
            assetName,
            height: 50,
            width: 50,
          ),
          Text(folderName),
          Container(
            height: 10,
            width: 60,
            color: Colors.white,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 10,
                width: 60 - (freeSpace * 60) / totalSpace,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
