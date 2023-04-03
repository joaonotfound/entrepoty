import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class DeleteBorrowUsecase {
  Future<Either<DomainError, BorrowEntity>> deleteBorrow({
    required int id,
  });
}
