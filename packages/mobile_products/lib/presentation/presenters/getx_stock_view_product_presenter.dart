import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_products/mobile_products.dart';

class GetxStockViewProductPresenter extends GetxController
    with GetxLoadingManager, GetxUiErrorManager
    implements StockViewProductPresenter {
  LoadUniqueProductUsecase loadUniqueProductUsecase;

  GetxStockViewProductPresenter({
    required this.loadUniqueProductUsecase,
  });

  final _product = Rx<UniqueProductEntity?>(null);

  get productStream => _product.stream;

  Future<void> loadProduct(int id) async {
    isLoading = true;
    final response = await loadUniqueProductUsecase.loadUniqueProduct(id);
    response.fold((error) {
      print("an error ocurred while loading unique borrow" + error.toString());
    }, (_response) => _product.value = _response);
    isLoading = false;
  }
}
