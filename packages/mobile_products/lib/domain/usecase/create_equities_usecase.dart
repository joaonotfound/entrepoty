import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';

import '../domain.dart';

abstract class CreateEquitiesUsecase {
  Future<Either<DomainError, List<ProductDetailEntity>>> createEquities(
    int quantity,
    ProductModelEntity product,
  );
}
