import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class DeleteProductModelUsecase {
  Future<Either<DomainError, ProductModelEntity>> deleteModel(int id);
}
