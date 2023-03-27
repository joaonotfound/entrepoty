import 'dart:async';

import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';
import 'package:entrepoty/domain/entities/create_stock_item_entity.dart';
import 'package:entrepoty/presentation/presentation.dart';

class GetxStockItemCreationPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxFormManager,
        GetxUiErrorManager,
        GetxNavigatorManager
    implements StockItemCreationPresenter {
  final qtdError = RxString('');
  final modelError = RxString('');
  final descriptionError = RxString('');
  final items = Rx<List<CreateStockItemEntity>>([]);

  int _qtd = 0;
  String _model = '';
  List<CreateStockItemEntity> _items = [];

  @override
  Stream<String?> get modelErrorStream => modelError.stream;

  @override
  Stream<String?> get qtdErrorStream => qtdError.stream;

  @override
  Stream<List<CreateStockItemEntity>> get itemsStreams => items.stream;

  @override
  Future<void> saveItem() async {
    _items.add(CreateStockItemEntity(
        description: '', quantity: _qtd, modelo: _model, notes: ""));
    items.subject.add(_items);
    _qtd = 0;
    _model = '';

    navigateTo = Routes.stock;
  }

  void validateForm() {
    isFormValid = qtdError.value == "" &&
        _model.length != 0 &&
        modelError.value == "" &&
        _qtd != 0;
  }

  @override
  void validateModel(String value) {
    modelError.value = value.length == 0 ? "This field is mandatory." : "";
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
}
