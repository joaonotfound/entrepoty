import 'dart:async';

import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';

mixin GetxUiErrorManager on GetxController {
  final _mainError = Rx<UiError?>(null);
  Stream<UiError?> get mainErrorStream => _mainError.stream;
  set mainError(UiError? value) => _mainError.subject.add(value);
}
