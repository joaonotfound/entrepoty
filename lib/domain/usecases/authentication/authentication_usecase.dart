import 'package:service_desk_2/domain/domain.dart';

abstract class AuthenticationUsecase {
  Future<Account> authenticate({
    required String id,
    required String password,
  });
}
