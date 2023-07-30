import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        colorSchemeSeed: Colors.blue.shade700,
      );
}
