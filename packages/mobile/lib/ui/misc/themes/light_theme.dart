import 'package:flutter/material.dart';

import 'app_color_scheme.dart';
import 'base_theme.dart';

ThemeData makeLightTheme() {
  return makeBaseTheme(
    AppColorScheme(
      backgroundColor: Color(0xfff2f4f3),
      onBackground: Color(0xff0d1b2a),
      //
      primaryColor: Color(0xff274c77),
      onPrimaryColor: Colors.white,
      //
      secondaryColor: Color(0xFFA3CEF1),
      onSecondaryColor: Colors.white,

      textColor: Colors.black87,
      brightness: Brightness.light,
      //
      surfaceColor: Color(0xffe6e8e6),
      onSurfaceColor: Colors.black54,
    ),
  );
}
