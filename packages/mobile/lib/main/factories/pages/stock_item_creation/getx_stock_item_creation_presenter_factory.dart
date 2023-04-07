import 'package:entrepoty/main/factories/usecases/create_product_factory.dart';
import 'package:entrepoty/presentation/presenters/getx_stock_item_creation_presenter.dart';
import 'package:mobile_products_model/mobile_products_model.dart';

GetxStockItemCreationPresenter makeGetxStockItemCreationPresenter() {
  return GetxStockItemCreationPresenter(
    loadModelsUsecase: makeRemoteLoadProductModels(),
    createProduct: makeRemoteCreateProduct(),
  );
}
