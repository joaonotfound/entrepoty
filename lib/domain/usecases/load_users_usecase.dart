import 'package:entrepoty/domain/domain.dart';

abstract class LoadUsersUsecase {
  Future<List<UserEntity>> loadUsers();
}
