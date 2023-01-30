import 'package:service_desk_2/data/usecases/usecases.dart';
import 'package:service_desk_2/domain/entities/entities.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class GetxStockPresenter implements StockPresenter {
  final LoadCategoriesUsecase loadCategories;
  const GetxStockPresenter({
    required this.loadCategories,
  });
  @override
  Stream<CategoryEntity> get categoriesStream => throw UnimplementedError();

  @override
  Stream<StockItemEntity> get itemsStream => throw UnimplementedError();

  @override
  Future<void> loadScreen() async {
    loadCategories.load();
  }
}
