import 'package:get/get.dart';

mixin GetxUiErrorManager on GetxController {
  final _mainError = RxString('');
  Stream<String?> get mainErrorStream => _mainError.stream;
  set mainError(String value) => _mainError.value = value;
}
