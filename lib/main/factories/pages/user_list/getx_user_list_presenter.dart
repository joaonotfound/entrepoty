import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';

GetxUsersPresenter makeGetxUserListPresenter() {
  return GetxUsersPresenter(loadUsersUsecase: makeMockedLoadUsers());
}
