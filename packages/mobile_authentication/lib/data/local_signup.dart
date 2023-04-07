import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain/domain.dart';

class LocalSignup implements SignupUsecase {
  @override
  Future<Either<Account, DomainError>> register({
    required String name,
    required String username,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    if (username == "ja12345") {
      return Right(DomainError.invalidCredentials);
    }
    return Left(
      Account(
        token: "random-token",
        username: username,
        name: "João",
        profilePictureUrl: "https://google.com",
      ),
    );
  }
}
