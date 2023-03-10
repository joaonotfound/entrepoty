import 'package:service_desk_2/domain/domain.dart';

// only to be used while there's no backend creayed yet.
class LocalAuthentication implements AuthenticationUsecase {
  @override
  Future<Account> authenticate({
    required String id,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    if (id == "ja12345" && password == "123456") {
      return Account(
        token: "random-token",
        id: id,
        name: "João",
        profilePictureUrl: "https://google.com",
      );
    }
    throw DomainError.invalidCredentials;
  }
}
