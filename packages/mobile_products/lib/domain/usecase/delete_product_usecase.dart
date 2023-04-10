import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class DeleteProductUsecase {
  Future<Either<DomainError, ProductEntity>> deleteProduct(int id);
}
