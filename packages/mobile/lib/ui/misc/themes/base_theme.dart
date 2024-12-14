import 'package:entrepoty/ui/misc/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

import 'base/base.dart';

ThemeData makeBaseTheme(AppColorScheme scheme) {
  return ThemeData(
    primaryColor: scheme.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: scheme.primaryColor,
      onPrimary: scheme.onPrimaryColor,
      //
      secondary: scheme.secondaryColor,
      onSecondary: scheme.onSecondaryColor,
      //
      surface: scheme.surfaceColor,
      onSurface: scheme.onSurfaceColor,
      //
      brightness: scheme.brightness,
      // onSecondaryContainer: Colors.red,
    ),
    hintColor: scheme.onBackground.withAlpha(100),
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.backgroundColor,
      foregroundColor: scheme.textColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 2,
      backgroundColor: scheme.primaryColor,
      foregroundColor: scheme.onPrimaryColor,
    ),

    elevatedButtonTheme: getElevatedButtonTheme(scheme),
    inputDecorationTheme: getInputDecorationTheme(scheme),
    scaffoldBackgroundColor: scheme.backgroundColor,
    chipTheme: getChipTheme(scheme),
    outlinedButtonTheme: getOutlinedButtonTheme(scheme),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: scheme.primaryColor),
    bottomNavigationBarTheme: getBottomNavigationTheme(scheme),
    textTheme: getTextTheme(scheme),
  );
}
