import 'package:entrepoty/ui/misc/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

BottomNavigationBarThemeData getBottomNavigationTheme(AppColorScheme scheme) {
  return BottomNavigationBarThemeData(
    showUnselectedLabels: false,
    backgroundColor: scheme.backgroundColor,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: scheme.primaryColor,
    unselectedItemColor: scheme.onBackground.withAlpha(150),
  );
}
