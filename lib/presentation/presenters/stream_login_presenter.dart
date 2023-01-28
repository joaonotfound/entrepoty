import 'dart:async';

import 'package:service_desk_2/ui/screens/screens.dart';
import 'package:service_desk_2/validation/validator.dart';

class LoginState {
  String? emailState;
  String? passwordState;
  String? mainErrorState;
}

class StreamLoginPresenter implements LoginPresenter {
  final Validation validator;

  StreamLoginPresenter({
    required this.validator,
  });

  final _loginState = LoginState();
  final _controller = StreamController<LoginState>();

  final _isFormValidController = StreamController<bool>.broadcast();
  final _isLoadingController = StreamController<bool>.broadcast();

  @override
  Stream<String?> get idErrorStream =>
      _controller.stream.map((state) => state.emailState);

  @override
  Stream<String?> get passwordErrorStream =>
      _controller.stream.map((state) => state.passwordState);

  @override
  Stream<bool> get isFormValidStream => _isFormValidController.stream;

  @override
  Stream<bool> get isLoadingStream => _isLoadingController.stream;
  @override
  Stream<String?> get mainErrorStream =>
      _controller.stream.map((state) => state.mainErrorState);

  @override
  void validateId(String id) {
    _loginState.emailState = validator.validate(field: 'id', value: id);
    _controller.add(_loginState);
  }

  @override
  void validatePassword(String password) {
    _loginState.passwordState =
        validator.validate(field: 'password', value: password);
    _controller.add(_loginState);
  }

  @override
  void authenticate() {
    _isLoadingController.add(true);
  }

  @override
  void dispose() {}
}
