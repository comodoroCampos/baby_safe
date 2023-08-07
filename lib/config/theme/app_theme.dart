import 'package:flutter/material.dart';

class AppTheme {
  static const Color _customColor = Color.fromARGB(255, 252, 3, 177);
  static const List<Color> customColor = [_customColor];

  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _customColor);
  }
}
