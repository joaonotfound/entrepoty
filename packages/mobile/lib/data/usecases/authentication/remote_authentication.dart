import '../../data.dart';
import '../../../domain/domain.dart';

class RemoteAuthentication implements AuthenticationUsecase {
  final String url;
  final HttpClient httpClient;
  const RemoteAuthentication({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<Account> authenticate({
    required String id,
    required String password,
  }) async {
    try {
      var response = await httpClient
          .post(url: url, body: {"id": id, "password": password});

      Map account = response.body?["account"];

      return Account(
        token: account["token"],
        id: account["id"],
        name: account["name"],
        profilePictureUrl: account["profile_url"],
      );
    } on HttpError catch (error) {
      throw error == HttpError.badRequest
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}
