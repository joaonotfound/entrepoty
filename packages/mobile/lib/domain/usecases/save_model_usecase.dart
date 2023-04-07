import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class SaveModelUsecase {
  Future<Either<DomainError, ProductModelEntity>> saveModel(
    String name,
    String imagePath,
  );
}
