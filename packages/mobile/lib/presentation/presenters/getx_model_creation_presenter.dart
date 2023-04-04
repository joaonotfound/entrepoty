import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/misc/helpers/from_domain_error.dart';
import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

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

  String _name = "";
  final _nameError = RxString('');

  Stream<String?> get nameErrorStream => _nameError.stream;

  String _image = "";
  final _hasImage = RxBool(false);

  Stream<bool> get hasImageStream => _hasImage.stream;

  @override
  void validateName(String name) {
    _name = name;
    _nameError.value =
        validation.validate(field: "model-name", value: name) ?? "";
    _validateForm();
  }

  void _validateForm() {
    isFormValid = _name != '' && _nameError.value == "" && _image != '';
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
      ProductModelEntity(name: _name),
    );
    response.fold((error) {
      debugPrint("error: " + error.toString());
      mainError = fromDomain(error);
    }, (model) {
      Get.back();
    });

    isLoading = false;
  }
}
