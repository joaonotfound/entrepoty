import 'package:flutter/material.dart';

import 'app_color_scheme.dart';
import 'base_theme.dart';

ThemeData makeDarkTheme() {
  final scheme = AppColorScheme(
    backgroundColor: const Color(0xff080808),
    //Color.fromARGB(255, 6, 12, 18),
    onBackground: Colors.white70,
    //
    primaryColor: const Color(0xff98c1d9),
    onPrimaryColor: Colors.white,
    //
    secondaryColor: const Color(0xffe0fbfc),
    onSecondaryColor: Colors.white70,

    textColor: Colors.white70,
    brightness: Brightness.dark,
    //
    surfaceColor: const Color(0xff080808),
    //Color.fromARGB(255, 7, 18, 29),
    onSurfaceColor: Colors.white70,
  );
  final baseTheme = makeBaseTheme(scheme);

  return ThemeData.from(
    colorScheme: const ColorScheme.dark().copyWith(
      surface: scheme.surfaceColor,
      onSurface: scheme.onSurfaceColor,

      //
      // brightness: Brightness.dark,
      primary: scheme.primaryColor,
      onPrimary: scheme.onPrimaryColor,
      //
      secondary: scheme.secondaryColor,
      onSecondary: scheme.onSecondaryColor,
      //
    ),
  ).copyWith(
    hintColor: Colors.white10,
    appBarTheme: baseTheme.appBarTheme,
    floatingActionButtonTheme: baseTheme.floatingActionButtonTheme,
    chipTheme: baseTheme.chipTheme,
    bottomNavigationBarTheme: baseTheme.bottomNavigationBarTheme,
    // scaffoldBackgroundColor: baseTheme.scaffoldBackgroundColor,
    inputDecorationTheme: baseTheme.inputDecorationTheme,
    elevatedButtonTheme: baseTheme.elevatedButtonTheme,
    textTheme: baseTheme.textTheme,
    outlinedButtonTheme: baseTheme.outlinedButtonTheme,
    iconTheme: IconThemeData(color: scheme.onBackground),
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
