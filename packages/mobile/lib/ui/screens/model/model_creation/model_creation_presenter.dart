import 'package:get/get.dart';

import '../../../misc/errors/ui_error.dart';

abstract class ModelCreationPresenter {
  Stream<String?> get nameErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;

  void validateName(String name);
  Future<void> createModel();

  Future<void> pickImage();
  Future<void> deletePhoto();
}
