import 'dart:async';

import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';
import 'package:entrepoty/presentation/presentation.dart';

class GetxStockItemCreationPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxFormManager,
        GetxUiErrorManager,
        GetxNavigatorManager
    implements StockItemCreationPresenter {
  LoadProductModelsUsecase loadModelsUsecase;
  CreateProductUsecas createProduct;

  GetxStockItemCreationPresenter({
    required this.loadModelsUsecase,
    required this.createProduct,
  });

  final qtdError = RxString('');
  final modelError = RxString('');
  final descriptionError = RxString('');

  int _qtd = 0;
  int _model = 0;

  Rx<List<ProductModelEntity>> _models = Rx([]);
  Stream<List<ProductModelEntity>> get modelsStream => _models.stream;

  @override
  Stream<String?> get modelErrorStream => modelError.stream;

  @override
  Stream<String?> get qtdErrorStream => qtdError.stream;

  @override
  Future<void> saveItem() async {
    isLoading = true;
    final response = await createProduct.createProduct(
      model: _model,
      quantity: _qtd,
      receipt_path: "",
    );
    isLoading = false;
    response.fold((error) {
      mainError = fromDomain(error);
    }, (r) {
      Get.back();
    });
  }

  void validateForm() {
    isFormValid = qtdError.value == "" &&
        _model != 0 &&
        modelError.value == "" &&
        _qtd != 0;
  }

  @override
  void validateModel(int value) {
    modelError.value = value == 0 ? "This field is mandatory." : "";
    _model = value;
    validateForm();
  }

  @override
  void validateQtd(int value) {
    qtdError.value = value <= 0 ? "Invalid number." : "";
    _qtd = value;
    validateForm();
  }

  Future<void> dispose() async {
    super.dispose();
  }

  @override
  Future<void> loadModels() async {
    final response = await loadModelsUsecase.loadModels();
    response.fold((l) {
      print(l);
    }, (models) {
      print(models);
      _models.value = models;
    });
  }
}
