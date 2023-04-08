import 'package:mobile_core/mobile_core.dart';

import '../domain/domain.dart';


class LocalLogin implements LoginUsecase {
  @override
  Future<Account> authenticate({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    if (username == "ja12345" && password == "123456") {
      return Account(
        token: "random-token",
        username: username,
        name: "João",
        profilePictureUrl: "https://google.com",
      );
    }
    throw DomainError.unauthorized;
  }
}
