import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteLogin implements LoginUsecase {
  final String url;
  final HttpClient httpClient;
  const RemoteLogin({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<Account> authenticate({
    required String username,
    required String password,
  }) async {
    try {
      var response = await httpClient.post(
        url: url,
        body: {"username": username, "password": password},
        timeout: Duration(seconds: 2),
      );
      if (response.statuscode == 404 ||
          response.statuscode == 401 ||
          response.statuscode == 403) {
        throw DomainError.unauthorized;
      }
      if (response.body != null && response.statuscode == 200) {
        return Account.fromJson(response.body);
      }
      throw DomainError.unexpected;
    } on HttpError catch (error) {
      throw error == HttpErrorEnum.badRequest
          ? DomainError.unauthorized
          : DomainError.unexpected;
    }
  }
}
