import 'dart:ui';

import 'package:entrepoty/ui/ui.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MockedModelCreationPresenter implements ModelCreationPresenter {
  @override
  String? imageUrl;

  @override
  Stream<String?> nameErrorStream = Rx<String?>(null).stream;

  @override
  Future<void> deletePhoto() async {}

  @override
  Future<void> pickImage() async {}

  @override
  void validateName(String name) {}

  @override
  // TODO: implement isFormValidStream
  Stream<bool> get isFormValidStream => throw UnimplementedError();

  @override
  // TODO: implement isLoadingStream
  Stream<bool> get isLoadingStream => throw UnimplementedError();

  @override
  // TODO: implement mainErrorStream
  Stream<UiError?> get mainErrorStream => throw UnimplementedError();

  @override
  // TODO: implement navigateToStream
  Stream<String?> get navigateToStream => throw UnimplementedError();

  @override
  Future<void> createModel() {
    // TODO: implement createModel
    throw UnimplementedError();
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
