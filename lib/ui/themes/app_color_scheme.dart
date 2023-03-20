import 'package:flutter/material.dart';

class AppColorScheme {
  Color primaryColor;
  Color onPrimaryColor;

  Color secondaryColor;
  Color onSecondaryColor;

  Color backgroundColor;
  Color onBackground;

  Color textColor;

  Color surfaceColor;
  Color onSurfaceColor;

  Brightness brightness;

  AppColorScheme({
    required this.backgroundColor,
    required this.onBackground,
    required this.brightness,
    required this.primaryColor,
    required this.onPrimaryColor,
    required this.secondaryColor,
    required this.onSecondaryColor,
    required this.textColor,
    required this.surfaceColor,
    required this.onSurfaceColor,
  });
}
