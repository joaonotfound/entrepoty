import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class CreateBorrowUsecase {
  Future<Either<DomainError, BorrowEntity>> create({
    required String equity,
    required int customer,
    required DateTime date,
  });
}
