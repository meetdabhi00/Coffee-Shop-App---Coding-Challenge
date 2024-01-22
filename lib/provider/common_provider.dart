import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void bottomNavigationIndexChange({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
