import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class LoadProductsMock extends Mock implements LoadProductsUsecase {
  When mockLoadCall() => when(() => loadProducts());
  void mockLoad(Either<DomainError, List<ProductEntity>> response) =>
      mockLoadCall().thenAnswer((invocation) async => response);
}
