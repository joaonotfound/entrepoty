import 'package:flutter/material.dart';

import '../app_color_scheme.dart';

ChipThemeData getChipTheme(AppColorScheme scheme) {
  return ChipThemeData(
    checkmarkColor: scheme.onPrimaryColor,
    selectedColor: scheme.primaryColor,
    backgroundColor: Colors.black26,
    labelStyle: TextStyle(
      color: scheme.onSecondaryColor,
      fontWeight: FontWeight.w500,
    ),
  );
}
