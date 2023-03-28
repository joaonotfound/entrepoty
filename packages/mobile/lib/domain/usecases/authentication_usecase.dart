import '../domain.dart';

abstract class AuthenticationUsecase {
  Future<Account> authenticate({
    required String username,
    required String password,
  });
}
