import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/ui/ui.dart';

SplashScreen makeSplashScreen() {
  return SplashScreen(presenter: makeGetxSplashPresenter());
}
