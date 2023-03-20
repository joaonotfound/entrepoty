import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ThemeProvider extends ChangeNotifier {
  RxBool isDark = false.obs;

  void setIsDark(bool value) {
    isDark.value = value;
  }
}
