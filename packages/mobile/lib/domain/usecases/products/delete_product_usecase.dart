import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class DeleteProductUsecase {
  Future<Either<DomainError, ProductEntity>> deleteProduct(int id);
}
