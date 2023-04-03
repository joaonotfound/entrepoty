import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class GetxModelCreationPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxUiErrorManager,
        GetxNavigatorManager,
        GetxFormManager
    implements ModelCreationPresenter {
  Validation validation;
  GetxModelCreationPresenter({
    required this.validation,
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
  Future<void> createModel() {
    // TODO: implement createModel
    throw UnimplementedError();
  }
}
