import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/presenters.dart';

GetxSplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(loadAccount: makeLocalLoadCurrentAccount());
}
