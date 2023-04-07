import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'theme_presenter.dart';

class ThemeProvider extends ChangeNotifier {
  ThemePresenter presenter;
  RxBool get isDark => presenter.isDark; // = false.obs;

  ThemeProvider({required this.presenter});

  void setIsDark(bool value) => presenter.setIsDark(value);
}
