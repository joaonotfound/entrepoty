import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color(0xFF3a5a40);
  const secondaryColor = Color(0xFF84a98c);
  const backgroundColor = Colors.white;
  // const foregroundColor = ;
  return ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
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
    outlinedButtonTheme: getOutlinedButtonTheme(primaryColor),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
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
    headlineMedium: TextStyle(
      color: Colors.black87,
      fontSize: 30,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w400,
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
    labelStyle: TextStyle(color: Colors.black54),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: primaryColor),
    ),
    alignLabelWithHint: true,
  );
}

OutlinedButtonThemeData getOutlinedButtonTheme(Color primaryColor) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      side: BorderSide(
        color: primaryColor.withAlpha(150),
        width: 1,
      ),
    ),
  );
}

ElevatedButtonThemeData getElevatedButtonTheme(Color primaryColor) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      minimumSize: const Size(double.infinity, 50),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      disabledBackgroundColor: primaryColor.withAlpha(100),
      disabledForegroundColor: Colors.white70,
    ),
  );
}
