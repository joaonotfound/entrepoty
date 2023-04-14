import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_products/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockLoadProductModels extends Mock implements LoadProductModelsUsecase {
  When mockLoadCall() => when(() => loadModels());
  void mockLoad(Either<DomainError, List<ProductModelEntity>> response) =>
      mockLoadCall().thenAnswer((invocation) async => response);
}
