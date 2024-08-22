import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  _toggleTheme() {
    _isDark = !_isDark;
  }
}
