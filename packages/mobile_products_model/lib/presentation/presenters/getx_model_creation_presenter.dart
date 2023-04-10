import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';
import '../../ui/ui.dart';

class GetxModelCreationPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxUiErrorManager,
        GetxNavigatorManager,
        GetxFormManager
    implements ModelCreationPresenter {
  Validation validation;
  TakeImageUsecase takeImage;
  CreateProductModelUsecase usecase;

  GetxModelCreationPresenter({
    required this.validation,
    required this.usecase,
    required this.takeImage,
  });


  String _category = "";

  String _name = "";
  final _nameError = RxString('');
  Stream<String?> get nameErrorStream => _nameError.stream;

  String _image = "";
  final _hasImage = RxBool(false);

  Stream<bool> get hasImageStream => _hasImage.stream;

  int _qtd = 0;
  final qtdError = RxString('');

  @override
  Stream<String?> get qtdErrorStream => qtdError.stream;

  @override
  void validateName(String name) {
    _name = name;
    _nameError.value =
        validation.validate(field: "model-name", value: name) ?? "";
    _validateForm();
  }
  
  void _validateForm() {
    isFormValid = _name != '' && _nameError.value == "" && _image != '' && _category != "" && _qtd != 0 && qtdError == "";
  }

  @override
  void validateQtd(int value) {
    qtdError.value = value <= 0 ? "Invalid number." : "";
    _qtd = value;
    _validateForm();
  }

  Future<void> deletePhoto() async {
    _image = '';
    _hasImage.value = false;
    _validateForm();
  }

  Future<void> pickImage() async {
    final response = await takeImage.takeImage();
    response.fold((l) {}, (path) {
      _hasImage.value = true;
      _image = path;
      _validateForm();
    });
  }

  @override
  Future<void> createModel() async {
    isLoading = true;
    final response = await usecase.createModel(
      ProductModelEntity(name: _name, category: _category),
      _qtd,
      _image
    );
    response.fold((error) {
      debugPrint("error: " + error.toString());
      mainError = fromDomain(error);
    }, (model) {
      Get.back();
    });

    isLoading = false;
  }


  void validateCategory(String category) {
    _category = category;
    _validateForm();
  }
}
