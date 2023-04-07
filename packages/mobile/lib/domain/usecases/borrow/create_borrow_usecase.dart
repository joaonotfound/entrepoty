import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class CreateBorrowUsecase {
  Future<Either<DomainError, BorrowEntity>> create({
    required int product,
    required int customer,
    required DateTime date,
  });
}
