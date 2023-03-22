import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/ui/screens/screens.dart';

UserListScreen makeUsersScreen() {
  return UserListScreen(
    presenter: makeGetxUsersPresenter(),
  );
}
