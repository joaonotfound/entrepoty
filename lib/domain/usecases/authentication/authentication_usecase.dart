import '../../../domain/domain.dart';

abstract class AuthenticationUsecase {
  Future<Account> authenticate({
    required String id,
    required String password,
  });
}
