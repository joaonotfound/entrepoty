import 'package:flutter/material.dart';

import '../app_color_scheme.dart';

ChipThemeData getChipTheme(AppColorScheme scheme) {
  return ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    labelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      color: scheme.onSurfaceColor,
    ),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    backgroundColor: scheme.surfaceColor,
  );
}
