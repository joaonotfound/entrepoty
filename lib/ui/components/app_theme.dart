import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color(0xFF414BB2);
  return ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primaryColor),
    iconTheme: getIconThemeData(primaryColor),
    elevatedButtonTheme: getElevatedButtonTheme(primaryColor),
    inputDecorationTheme: getInputDecorationTheme(primaryColor),
    textTheme: getTextTheme(primaryColor),
  );
}

IconThemeData getIconThemeData(Color primaryColor) {
  return IconThemeData(
    color: primaryColor,
  );
}

TextTheme getTextTheme(Color primaryColor) {
  return TextTheme(
    headline1: TextStyle(
      color: primaryColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

InputDecorationTheme getInputDecorationTheme(Color primaryColor) {
  return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      focusColor: primaryColor,
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      alignLabelWithHint: true);
}

ElevatedButtonThemeData getElevatedButtonTheme(Color primaryColor) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      minimumSize: const Size(double.infinity, 50),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}
