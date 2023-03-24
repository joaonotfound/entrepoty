import 'package:flutter/material.dart';

import '../app_color_scheme.dart';

IconThemeData getIconThemeData(AppColorScheme scheme) {
  return IconThemeData(
    color: scheme.primaryColor,
  );
}
