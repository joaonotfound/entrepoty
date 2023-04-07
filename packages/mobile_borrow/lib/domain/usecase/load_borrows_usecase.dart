import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class LoadBorrowUsecase {
  Future<Either<DomainError, List<BorrowEntity>>> loadAll();
}
