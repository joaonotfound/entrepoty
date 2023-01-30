import 'package:service_desk_2/domain/entities/stock_item_entity.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';

class MockedLoadStockItems implements LoadStockItemsUsecase {
  final List<String> _items = [
    "Teclado H5SLM",
    "Mouse 2345234",
    "Headset a2f1e"
  ];
  @override
  Future<List<StockItemEntity>> loadAllItems() async {
    return _items
        .map((e) => StockItemEntity(
              description: "random-description",
              model: "random-model",
              notes: "aqui vai alguma anotação opcional.",
              imageUrl:
                  "https://images.unsplash.com/photo-1674594145584-354a3e88e9b5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=150&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3NTA4Nzk1NA&ixlib=rb-4.0.3&q=80&w=150",
              receiptUrl: "nota fiscal",
            ))
        .toList();
  }
}
