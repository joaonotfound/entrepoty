import 'package:flutter/foundation.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class ModelCreationPresenter implements Listenable {
  Stream<bool> get hasImageStream;
  Stream<String?> get nameErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Stream<String?> get qtdErrorStream;


  void validateCategory(String category);
  void validateName(String name);
  void validateQtd(int value);

  Future<void> createModel();

  Future<void> pickImage();
  Future<void> deletePhoto();
}
