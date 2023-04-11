import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';

import '../../mobile_products.dart';

abstract class LoadAllEquitiesUsecase {
  Future<Either<DomainError, List<ProductDetailWithProduct>>> load();
}
