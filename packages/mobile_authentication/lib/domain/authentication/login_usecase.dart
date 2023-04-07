import 'package:mobile_core/domain/domain.dart';

abstract class LoginUsecase {
  Future<Account?> authenticate({
    required String username,
    required String password,
  });
}
