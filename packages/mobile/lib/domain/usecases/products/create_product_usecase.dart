import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class CreateProductUsecas {
  Future<Either<DomainError, ProductEntity>> createProduct({
    required int model,
    required int quantity,
    required String receipt_path,
  });
}
