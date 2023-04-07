import 'package:mobile_products_model/mobile_products_model.dart';

import '../../../presentation/presentation.dart';
import '../usecase/usecase.dart';

GetxStockItemCreationPresenter makeGetxStockItemCreationPresenter() {
  return GetxStockItemCreationPresenter(
    loadModelsUsecase: makeRemoteLoadProductModels(),
    createProduct: makeRemoteCreateProduct(),
  );
}
