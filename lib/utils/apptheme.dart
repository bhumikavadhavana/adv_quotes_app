import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
      secondary: Colors.deepPurple,
    ),
  );

  static ThemeData Darktheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
      secondary: Colors.red,
    ),
  );
}
