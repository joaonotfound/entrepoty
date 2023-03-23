import 'package:get/get.dart';

abstract class ModelCreationPresenter {
  String? imageUrl;
  late Rx<String?> nameErrorStream;
  Future<void> pickImage();
  Future<void> deletePhoto();
}
