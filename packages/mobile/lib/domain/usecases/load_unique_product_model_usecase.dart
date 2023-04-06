import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoadUniqueProductModelUsecase {
  Future<Either<DomainError, ProductModelEntity>> loadModelById(int id);
}
