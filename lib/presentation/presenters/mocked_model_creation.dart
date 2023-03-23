import 'package:entrepoty/ui/ui.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MockedModelCreationPresenter implements ModelCreationPresenter {
  @override
  String? imageUrl;

  @override
  Rx<String?> nameErrorStream = Rx<String?>(null);

  @override
  Future<void> deletePhoto() async {}

  @override
  Future<void> pickImage() async {}
}
