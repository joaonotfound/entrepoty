import 'dart:async';

import 'package:service_desk_2/ui/screens/screens.dart';
import 'package:service_desk_2/validation/validator.dart';

class StreamLoginPresenter extends LoginPresenter {
  final Validation validator;

  StreamLoginPresenter({
    required this.validator,
  });

  final _idErrorController = StreamController<String>.broadcast();
  final _passwordErrorController = StreamController<String>.broadcast();
  final _isFormValidController = StreamController<bool>.broadcast();
  final _isLoadingController = StreamController<bool>.broadcast();
  final _mainErrorController = StreamController<String>.broadcast();

  @override
  Stream<String> get idErrorStream => _idErrorController.stream;

  @override
  Stream<String> get passwordErrorStream => _passwordErrorController.stream;

  @override
  Stream<bool> get isFormValidStream => _isFormValidController.stream;

  @override
  Stream<bool> get isLoadingStream => _isLoadingController.stream;
  @override
  Stream<String> get mainErrorStream => _mainErrorController.stream;

  @override
  void validateId(String id) {
    final response = validator.validate(field: 'id', value: id);
  }

  @override
  void validatePassword(String password) {}

  @override
  void authenticate() {
    _isLoadingController.add(true);
  }

  @override
  void dispose() {}
}
