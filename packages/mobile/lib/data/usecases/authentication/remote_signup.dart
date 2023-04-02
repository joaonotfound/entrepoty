import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/src/either.dart';

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
      if (response.statuscode != 200) {
        return Right(DomainError.unexpected);
      }
      final account = response.body ?? {};
      return Left(Account(
        token: account["token"] ?? "",
        username: account["username"] ?? "",
        name: account["name"] ?? "",
        profilePictureUrl: account["profile_url"] ?? "",
      ));
    } on HttpError catch (e) {
      return Right(e == HttpError.badRequest
          ? DomainError.invalidCredentials
          : DomainError.unexpected);
    } catch (e) {
      return Right(DomainError.unexpected);
    }
  }
}
