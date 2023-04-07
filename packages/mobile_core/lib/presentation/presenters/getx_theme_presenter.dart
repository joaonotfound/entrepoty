import 'package:get/get.dart';

import '../../ui/ui.dart';
import '../presentation.dart';

class GetxThemePresenter implements ThemePresenter {
  RxBool isDark = false.obs;
  ThemeLoader theme;
  GetxThemePresenter({required this.theme}) {
    loadThemeFromStorage();
  }
  loadThemeFromStorage() async {
    isDark.value = await theme.loadIsDark();
  }

  void setIsDark(bool value) {
    isDark.value = value;
    theme.setIsDark(value);
  }
}
