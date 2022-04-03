import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkMode = false;
  static List<String> _categories = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode {
    return _prefs.getBool('darkmode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('darkmode', value);
  }

  static List<String> get category {
    return _prefs.getStringList('category') ?? _categories;
  }

  static set category(List<String> value) {
    _categories = [...value];
    _prefs.setStringList('category', value);
  }
}
