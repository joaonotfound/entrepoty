import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/ui/screens/screens.dart';

UsersScreen makeUsersScreen() {
  return UsersScreen(
    presenter: makeGetxUsersPresenter(),
  );
}
