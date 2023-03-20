import 'package:flutter/material.dart';

import '../app_color_scheme.dart';

InputDecorationTheme getInputDecorationTheme(AppColorScheme scheme) {
  return InputDecorationTheme(
    filled: true,
    fillColor: scheme.surfaceColor.withAlpha(100),
    iconColor: scheme.textColor,
    prefixIconColor: scheme.textColor.withAlpha(180),
    suffixIconColor: scheme.textColor.withAlpha(180),
    hoverColor: scheme.textColor,
    focusColor: scheme.primaryColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    // labelStyle: TextStyle(
    // color: scheme.textColor.withAlpha(200),
    // ),
    // hintStyle: TextStyle(
    //   color: scheme.textColor.withAlpha(170),
    // ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    alignLabelWithHint: true,
  );
}
