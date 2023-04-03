import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoadProductModelsUsecase {
  Future<Either<DomainError, List<ProductModelEntity>>> loadModels();
}
