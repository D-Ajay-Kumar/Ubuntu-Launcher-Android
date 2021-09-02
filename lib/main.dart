import 'package:flutter/material.dart';

import 'package:device_apps/device_apps.dart';
import 'package:device_info/device_info.dart';
import 'package:storage_space/storage_space.dart';

import './screens/appsScreen.dart';
import './widgets/timeWidget.dart';
import './utils/constants.dart';
import './widgets/sideDrawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appsList = await DeviceApps.getInstalledApplications(
    includeAppIcons: true,
    includeSystemApps: true,
    onlyAppsWithLaunchIntent: true,
  );
  var info = await DeviceInfoPlugin().androidInfo;
  deviceModel = info.model.replaceAll(' ', '');
  storageSpace = await getStorageSpace(
    lowOnSpaceThreshold: 2 * 1024 * 1024 * 1024, // 2GB
    fractionDigits: 2,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showMenu = false;

  void toggleShowApps() {
    setState(() {
      showMenu = !showMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: SideDrawer(toggleShowApps: toggleShowApps),
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
            showMenu = false;
          });
          return false;
        },
        child: Stack(
          children: [
            Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TimeWidget(),
                  ],
                ),
              ),
            ),
            !showMenu ? Container() : AppsScreen(),
          ],
        ),
      ),
    );
  }
}
