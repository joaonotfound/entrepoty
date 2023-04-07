import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class LoadUniqueBorrowUsecase {
  Future<Either<DomainError, BorrowEntity>> loadBorrowById(int id);
}
