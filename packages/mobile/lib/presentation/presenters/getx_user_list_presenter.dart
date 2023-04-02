import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';

class GetxUserListPresenter extends GetxController
    with GetxUiErrorManager, GetxLoadingManager
    implements CustomerListPresenter {
  final LoadUsersUsecase loadUsersUsecase;
  final users = Rx<List<UserEntity>>([]);

  GetxUserListPresenter({
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
