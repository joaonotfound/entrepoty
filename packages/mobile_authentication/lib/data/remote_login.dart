import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteLogin implements LoginUsecase {
  final String url;
  final FunctionalHttpClientUsecase httpClient;

  const RemoteLogin({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<Account> authenticate({
    required String username,
    required String password,
  }) async {
    var eitherResponse = await httpClient.post(
      url: url,
      body: {"username": username, "password": password},
      timeout: const Duration(seconds: 2),
    );
    return eitherResponse.fold(
      (error) => throw DomainError,
      (response) => Account.fromJson(response.body),
    );
  }
}
