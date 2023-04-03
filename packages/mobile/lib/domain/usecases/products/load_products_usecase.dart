import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoadProductsUsecase {
  Future<Either<DomainError, List<ProductEntity>>> loadProducts();
}
