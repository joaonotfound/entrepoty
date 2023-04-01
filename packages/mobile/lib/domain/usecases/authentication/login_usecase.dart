import '../../domain.dart';

abstract class LoginUsecase {
  Future<Account> authenticate({
    required String username,
    required String password,
  });
}
