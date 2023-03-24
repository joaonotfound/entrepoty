import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';

GetxUserListPresenter makeGetxUserListPresenter() {
  return GetxUserListPresenter(loadUsersUsecase: makeMockedLoadUsers());
}
