import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/getx_stock_item_creation_presenter.dart';

GetxStockItemCreationPresenter makeGetxStockItemCreationPresenter() {
  return GetxStockItemCreationPresenter(
      loadModelsUsecase: makeRemoteLoadProductModels());
}
