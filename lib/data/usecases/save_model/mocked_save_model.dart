import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

class MockedSaveModel extends SaveModelUsecase {
  @override
  Future<Either<DomainError, StockItemModelEntity>> saveModel(
      String name, String imagePath) async {
    return Right(StockItemModelEntity(name: "one model"));
  }
}
