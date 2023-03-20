import 'package:entrepoty/ui/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

getBottomNavigationTheme(AppColorScheme scheme) {
  return BottomNavigationBarThemeData(
    backgroundColor: scheme.backgroundColor,
    elevation: 8,
    selectedItemColor: scheme.primaryColor,
    unselectedItemColor: scheme.onBackground.withAlpha(200),
  );
}
