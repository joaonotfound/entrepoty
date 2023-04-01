import 'package:entrepoty/domain/domain.dart';

// only to be used while there's no backend creayed yet.
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
    throw DomainError.invalidCredentials;
  }
}
