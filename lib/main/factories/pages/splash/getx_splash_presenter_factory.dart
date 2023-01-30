import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/presentation/presenters/presenters.dart';

GetxSplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(loadAccount: makeLocalLoadCurrentAccount());
}
