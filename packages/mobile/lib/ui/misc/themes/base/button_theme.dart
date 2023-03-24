import 'package:entrepoty/ui/misc/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

OutlinedButtonThemeData getOutlinedButtonTheme(AppColorScheme scheme) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      side: BorderSide(
        color: scheme.primaryColor.withAlpha(150),
        width: 1,
      ),
    ),
  );
}

ElevatedButtonThemeData getElevatedButtonTheme(AppColorScheme scheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: scheme.primaryColor,
      minimumSize: const Size(double.infinity, 50),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
      disabledBackgroundColor: scheme.primaryColor.withAlpha(100),
      disabledForegroundColor: Colors.white70,
    ),
  );
}
