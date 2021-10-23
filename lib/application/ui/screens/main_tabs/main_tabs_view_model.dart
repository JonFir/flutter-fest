import 'package:flutter/material.dart';

class MainTabsViewModel extends ChangeNotifier {
  var _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;
  void setCurrentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }
}
