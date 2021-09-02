import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ChromeWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text('Google Chrome'),
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
      body: WebView(
        initialUrl: 'https://google.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
