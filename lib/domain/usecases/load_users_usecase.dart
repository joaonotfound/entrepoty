import 'package:service_desk_2/domain/domain.dart';

abstract class LoadUsersUsecase {
  Future<List<UserEntity>> loadUsers();
}
