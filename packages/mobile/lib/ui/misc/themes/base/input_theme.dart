import 'package:flutter/material.dart';

import '../app_color_scheme.dart';

InputDecorationTheme getInputDecorationTheme(AppColorScheme scheme) {
  double borderRadius = 5;
  return InputDecorationTheme(
    filled: true,
    fillColor: scheme.surfaceColor.withAlpha(100),
    iconColor: scheme.textColor,
    prefixIconColor: scheme.onBackground.withAlpha(180),
    suffixIconColor: scheme.onBackground.withAlpha(180),
    hoverColor: scheme.textColor,
    focusColor: scheme.primaryColor,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: scheme.onSurfaceColor.withAlpha(20),
      ),
    ),
    //contentPadding: EdgeInsets.symmetric(vertical: 20),
    // labelStyle: TextStyle(
    // color: scheme.textColor.withAlpha(200),
    // ),
    hintStyle: TextStyle(
      color: scheme.onBackground,
    ),
    labelStyle: TextStyle(
      color: scheme.onBackground,
    ),
    // labelStyle: ,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: scheme.primaryColor.withAlpha(20),
      ),
    ),
    alignLabelWithHint: true,
  );
}
