import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_products_model/domain/domain.dart';

abstract class CreateEquitiesUsecase {
  Future<Either<DomainError, List<ProductDetailEntity>>> createEquities(
    int quantity,
    ProductModelEntity product,
  );
}
