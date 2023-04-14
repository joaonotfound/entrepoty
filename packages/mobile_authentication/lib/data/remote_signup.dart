import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../domain/domain.dart';

class RemoteSignup implements SignupUsecase {
  FunctionalHttpClientUsecase http;
  final String url;

  RemoteSignup({
    required this.http,
    required this.url,
  });

  @override
  Future<Either<Account, DomainError>> register({
    required String name,
    required String username,
    required String password,
  }) async {
    final eitherResponse = await http.post(
      url: url,
      body: {
        "name": name,
        "username": username,
        "password": password,
      },
      timeout: const Duration(seconds: 2),
    );
    return eitherResponse.fold(
      (error) => error.asDomainErrorEitherOnRight(),
      (response) => Either.left(Account.fromJson(response.body)),
    );
    //return Left(Account.fromJson(account));
  }
}
