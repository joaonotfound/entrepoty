import 'package:fpdart/fpdart.dart';

import '../domain.dart';

abstract class SaveCurrentAccountUsecase {
  Future<Either<DomainError, dynamic>> saveAccount({
    required Account account,
  });
}
