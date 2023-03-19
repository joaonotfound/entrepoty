import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';

GetxUsersPresenter makeGetxUsersPresenter() {
  return GetxUsersPresenter(loadUsersUsecase: makeMockedLoadUsers());
}
