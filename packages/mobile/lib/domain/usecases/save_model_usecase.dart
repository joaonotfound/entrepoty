import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class SaveModelUsecase {
  Future<Either<DomainError, ProductModelEntity>> saveModel(
    String name,
    String imagePath,
  );
}
