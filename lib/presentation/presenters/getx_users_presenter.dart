import 'package:get/get.dart';
import 'package:service_desk_2/domain/entities/user_entity.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class GetxUsersPresenter extends GetxController
    implements UsersScreenPresenter {
  @override
  Future<void> loadUsers() {
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>?> get usersStream => throw UnimplementedError();
}
