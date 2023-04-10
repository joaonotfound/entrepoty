import '../../../mobile_products.dart';

GetxStockViewProductPresenter makeGetxStockViewProductPresenter() {
  return GetxStockViewProductPresenter(
    loadUniqueProductUsecase: makeRemoteLoadUniqueProduct(),
  );
}
