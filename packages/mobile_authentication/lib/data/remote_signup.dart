import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../domain/domain.dart';

class RemoteSignup implements SignupUsecase {
  HttpClient http;
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
    try {
      final response = await http.post(
        url: url,
        body: {
          "name": name,
          "username": username,
          "password": password,
        },
        timeout: Duration(seconds: 2),
      );
      if (response.statuscode == 409) {
        return Right(DomainError.conflict);
      }
      if (response.statuscode != 200) {
        return Right(DomainError.unexpected);
      }
      final account = response.body ?? {};
      return Left(Account.fromJson(account));
    } on HttpError catch (e) {
      return Right(e == HttpErrorEnum.badRequest
          ? DomainError.unauthorized
          : DomainError.unexpected);
    } catch (e) {
      return Right(DomainError.unexpected);
    }
  }
}
