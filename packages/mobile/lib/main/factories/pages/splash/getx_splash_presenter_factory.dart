import 'package:entrepoty/presentation/presenters/presenters.dart';
import 'package:mobile_core/mobile_core.dart';

GetxSplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(loadAccount: makeLocalLoadCurrentAccount());
}
