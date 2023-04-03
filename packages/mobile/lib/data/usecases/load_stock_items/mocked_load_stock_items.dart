import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/domain/entities/product_entity.dart';
import 'package:entrepoty/domain/usecases/usecases.dart';

class MockedLoadStockItems implements LoadStockItemsUsecase {
  final List<String> _items = [
    "Teclado H5SLM",
    "Mouse 2345234",
    "Headset a2f1e"
  ];
  @override
  Future<List<ProductEntity>> loadAllItems() async {
    return _items
        .map((e) => ProductEntity(
              model: ProductModelEntity.fromJson({}),
              receiptUrl: "nota fiscal",
              quantity: 0,
            ))
        .toList();
  }
}
