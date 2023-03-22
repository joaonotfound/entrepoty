import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';

class GetxUsersPresenter extends GetxController
    with GetxUiErrorManager, GetxLoadingManager
    implements UserListPresenter {
  final LoadUsersUsecase loadUsersUsecase;
  final users = Rx<List<UserEntity>>([]);

  GetxUsersPresenter({
    required this.loadUsersUsecase,
  });

  @override
  Future<void> loadUsers() async {
    try {
      isLoading = true;
      final fetchedUsers = await loadUsersUsecase.loadUsers();
      users.value = fetchedUsers;
    } catch (_) {
      mainError = UiError.unexpected;
    }

    isLoading = false;
  }

  @override
  Stream<List<UserEntity>?> get usersStream => users.stream;
}
