import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class LoadProductsUsecase {
  Future<Either<DomainError, List<ProductEntity>>> loadProducts();
}
