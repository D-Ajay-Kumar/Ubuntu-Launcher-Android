import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

import 'package:device_apps/device_apps.dart';
import 'package:provider/provider.dart';

class AppsProvider extends ChangeNotifier {
  List<Application> _apps = [];

  List<Application> get getApps {
    return _apps;
  }

  set setApps(List<Application> apps) {
    _apps = apps;
    notifyListeners();
  }
}
