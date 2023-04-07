import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class CreateProductModelUsecase {
  Future<Either<DomainError, ProductModelEntity>> createModel(
    ProductModelEntity model,
    String image,
  );
}
