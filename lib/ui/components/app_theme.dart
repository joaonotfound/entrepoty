import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color(0xFF3a5a40);
  const secondaryColor = Color(0xFF84a98c);
  const backgroundColor = Colors.white;
  // const foregroundColor = ;
  return ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.grey[800],
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    iconTheme: getIconThemeData(primaryColor),
    elevatedButtonTheme: getElevatedButtonTheme(primaryColor),
    inputDecorationTheme: getInputDecorationTheme(primaryColor),
    scaffoldBackgroundColor: backgroundColor,
    chipTheme: ChipThemeData(
      checkmarkColor: Colors.white,
      selectedColor: primaryColor,
      backgroundColor: Colors.grey[400],
      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      elevation: 8,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey[600],
    ),
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
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
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
