import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoadBorrowUsecase {
  Future<Either<DomainError, List<BorrowEntity>>> loadAll();
}
