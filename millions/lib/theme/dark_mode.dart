import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.brown.shade900,
    primary: Colors.brown.shade800,
    secondary: Colors.orangeAccent[200]!,
    inversePrimary: Colors.orangeAccent[100]!,
    background: Colors.brown[800]!,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.orangeAccent.shade200,
    displayColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.brown[800]!,
    foregroundColor: Colors.orangeAccent[200]!,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.brown[800]!,
      foregroundColor: Colors.orangeAccent[200]!,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    ),
  ),

);