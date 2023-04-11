import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_products_model/domain/domain.dart';

abstract class LoadAllEquitiesUsecase {
  Future<Either<DomainError, List<ProductDetailWithProduct>>> load();
}
