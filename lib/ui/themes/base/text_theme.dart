import 'package:flutter/material.dart';

import '../app_color_scheme.dart';

TextTheme getTextTheme(AppColorScheme scheme) {
  return TextTheme(
    headlineMedium: TextStyle(
      // color: Colors.black87,
      fontSize: 30,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      // color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}
