import 'package:get/get.dart';
import 'package:service_desk_2/domain/domain.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class GetxUsersPresenter extends GetxController
    with GetxUiErrorManager, GetxLoadingManager
    implements UsersScreenPresenter {
  final LoadUsersUsecase loadUsersUsecase;
  final users = Rx<List<UserEntity>>([]);

  GetxUsersPresenter({
    required this.loadUsersUsecase,
  });

  @override
  Future<void> loadUsers() async {
    isLoading = true;
    final fetchedUsers = await loadUsersUsecase.loadUsers();
    users.value = fetchedUsers;
    isLoading = false;
  }

  @override
  Stream<List<UserEntity>?> get usersStream => users.stream;
}
