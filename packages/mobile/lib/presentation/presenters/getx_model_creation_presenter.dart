import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/misc/helpers/from_domain_error.dart';
import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:get/get.dart';

class GetxModelCreationPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxUiErrorManager,
        GetxNavigatorManager,
        GetxFormManager
    implements ModelCreationPresenter {
  Validation validation;
  CreateProductModelUsecase usecase;
  GetxModelCreationPresenter({
    required this.validation,
    required this.usecase,
  });

  String _name = "";
  final _nameError = RxString('');
  Stream<String?> get nameErrorStream => _nameError.stream;

  @override
  void validateName(String name) {
    _name = name;
    _nameError.value =
        validation.validate(field: "model-name", value: name) ?? "";
    _validateForm();
  }

  void _validateForm() {
    isFormValid = _name != '' && _nameError.value == "";
  }

  Future<void> deletePhoto() async {}

  Future<void> pickImage() async {}

  @override
  Future<void> createModel() async {
    isLoading = true;
    final response = await usecase.createModel(
      ProductModelEntity(name: _name),
    );
    response.fold((error) {
      mainError = fromDomain(error);
    }, (model) {
      Get.back();
    });

    isLoading = false;
  }
}
