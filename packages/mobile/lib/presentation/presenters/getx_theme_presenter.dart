import 'package:entrepoty/data/cache/cache.dart';
import 'package:entrepoty/presentation/protocols/theme_loader.dart';
import 'package:entrepoty/ui/providers/theme_presenter.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
