import 'package:get/get.dart';

abstract class ThemePresenter {
  RxBool get isDark;
  void setIsDark(bool value);
}
