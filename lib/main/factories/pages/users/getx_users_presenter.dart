import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/presentation/presentation.dart';

GetxUsersPresenter makeGetxUsersPresenter() {
  return GetxUsersPresenter(loadUsersUsecase: makeMockedLoadUsers());
}
