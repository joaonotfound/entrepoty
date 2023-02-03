import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

UsersScreen makeUsersScreen() {
  return UsersScreen(
    presenter: makeGetxUsersPresenter(),
  );
}
