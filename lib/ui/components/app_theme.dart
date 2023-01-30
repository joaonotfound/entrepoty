import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color(0xFF414BB2);
  return ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primaryColor),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
