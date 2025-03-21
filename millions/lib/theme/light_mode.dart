import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.orange[200]!,
    primary: Colors.brown,
    secondary: Colors.orangeAccent[200]!,
    inversePrimary: Colors.brown[800]!,
    background: Colors.orange[100]!,

  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.brown.shade800,
    displayColor: Colors.brown[900],
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.brown,
    foregroundColor: Colors.orangeAccent[200],
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.brown,
      foregroundColor: Colors.orangeAccent[200],
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    ),
  ),
);