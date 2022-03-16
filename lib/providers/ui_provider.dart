import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  // Selected BottomNavigationBar option
  int _selectedMenuOpt = 0;
  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int index) {
    _selectedMenuOpt = index;
    notifyListeners();
  }
}
