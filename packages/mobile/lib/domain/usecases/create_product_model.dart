import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class CreateProductModelUsecase {
  Future<Either<DomainError, ProductModelEntity>> createModel(
    ProductModelEntity model,
  );
}
