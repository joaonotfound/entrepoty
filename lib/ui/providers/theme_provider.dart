import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;
  void setIsDark(bool value) {
    isDark = value;
  }
}
