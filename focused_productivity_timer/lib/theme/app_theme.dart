import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  bool _isDarkTheme = false;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      );

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
