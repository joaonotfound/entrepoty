import 'package:entrepoty/ui/themes/app_color_scheme.dart';
import 'package:entrepoty/ui/themes/base_theme.dart';
import 'package:flutter/material.dart';

ThemeData makeDarkTheme() {
  final scheme = AppColorScheme(
    backgroundColor: Color.fromARGB(255, 9, 19, 29),
    onBackground: Colors.white70,
    //
    primaryColor: Color(0xff274c77),
    onPrimaryColor: Colors.white70,
    //
    secondaryColor: Color(0xFFA3CEF1),
    onSecondaryColor: Colors.white70,

    textColor: Colors.white70,
    brightness: Brightness.dark,
    //
    surfaceColor: Color.fromARGB(255, 12, 30, 48),
    onSurfaceColor: Colors.white10,
  );
  final baseTheme = makeBaseTheme(scheme);

  return ThemeData.from(
    colorScheme: ColorScheme.dark().copyWith(
      background: scheme.backgroundColor,
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
    hintColor: Colors.white54,
    appBarTheme: baseTheme.appBarTheme,
    floatingActionButtonTheme: baseTheme.floatingActionButtonTheme,
    chipTheme: baseTheme.chipTheme,
    // scaffoldBackgroundColor: baseTheme.scaffoldBackgroundColor,
    inputDecorationTheme: baseTheme.inputDecorationTheme,
    elevatedButtonTheme: baseTheme.elevatedButtonTheme,
  );
}
