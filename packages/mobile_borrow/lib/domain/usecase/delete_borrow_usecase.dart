import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class DeleteBorrowUsecase {
  Future<Either<DomainError, BorrowEntity>> deleteBorrow({
    required int id,
  });
}
