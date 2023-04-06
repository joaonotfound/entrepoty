import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoadUniqueBorrowUsecase {
  Future<Either<DomainError, BorrowEntity>> loadBorrowById(int id);
}
