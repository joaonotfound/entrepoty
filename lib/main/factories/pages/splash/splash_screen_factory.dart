import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/ui/ui.dart';

SplashScreen makeSplashScreen() {
  return SplashScreen(presenter: makeGetxSplashPresenter());
}
