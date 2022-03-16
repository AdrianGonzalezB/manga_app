import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currenTheme;
  // current Theme
  ThemeProvider({required bool isDarkMode})
      : currenTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  // Set current Theme to light mode
  setLightMode() {
    currenTheme = ThemeData.light();
    notifyListeners();
  }

  // Set current Theme to dark mode
  setDarkMode() {
    currenTheme = ThemeData.dark();
    notifyListeners();
  }
}
