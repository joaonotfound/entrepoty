import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class CreateProductUsecas {
  Future<Either<DomainError, StockItemEntity>> createProduct({
    required int model,
    required int quantity,
    required String receipt_path,
  });
}
