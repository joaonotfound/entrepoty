import 'package:mocktail/mocktail.dart';
import 'package:entrepoty/domain/entities/product_entity.dart';
import 'package:entrepoty/domain/usecases/usecases.dart';

class MockLoadStockItems extends Mock implements LoadStockItemsUsecase {
  When _mockLoadAllItemsCall() => when(() => loadAllItems());
  void mockLoadAllItems(List<ProductEntity> data) =>
      _mockLoadAllItemsCall().thenAnswer((_) async => data);
  void mockLoadAllItemsError(dynamic error) =>
      _mockLoadAllItemsCall().thenThrow(error);
}
