import 'package:get/get.dart';
import 'package:service_desk_2/domain/domain.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class GetxUsersPresenter extends GetxController
    implements UsersScreenPresenter {
  final LoadUsersUsecase loadUsersUsecase;
  final users = Rx<List<UserEntity>>([]);

  GetxUsersPresenter({
    required this.loadUsersUsecase,
  });

  @override
  Future<void> loadUsers() async {
    final fetchedUsers = await loadUsersUsecase.loadUsers();
    users.value = fetchedUsers;
  }

  @override
  Stream<List<UserEntity>?> get usersStream => users.stream;
}
