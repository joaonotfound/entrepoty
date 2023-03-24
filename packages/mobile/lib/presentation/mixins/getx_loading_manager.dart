import 'package:get/get.dart';

mixin GetxLoadingManager on GetxController {
  final _isLoading = false.obs;
  Stream<bool> get isLoadingStream => _isLoading.stream;
  set isLoading(bool value) => _isLoading.value = value;
}
