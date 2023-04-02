import 'package:flutter/foundation.dart';

import '../../data.dart';
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
      if (response.statuscode == 403) {
        throw DomainError.invalidCredentials;
      }
      if (response.body != null && response.statuscode == 200) {
        return Account.fromJson(response.body);
      }
      throw DomainError.unexpected;
    } on HttpError catch (error) {
      throw error == HttpError.badRequest
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}
