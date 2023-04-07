import 'package:flutter/material.dart';

import '../app_color_scheme.dart';

ChipThemeData getChipTheme(AppColorScheme scheme) {
  return ChipThemeData(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    backgroundColor: scheme.surfaceColor
  );
}
