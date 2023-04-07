import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

class MockedSaveModel extends SaveModelUsecase {
  @override
  Future<Either<DomainError, ProductModelEntity>> saveModel(
      String name, String imagePath) async {
    return Right(ProductModelEntity(name: "one model", category: "category"));
  }
}
