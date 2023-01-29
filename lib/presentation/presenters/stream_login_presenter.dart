import 'dart:async';

import '../../domain/domain.dart';
import '../../presentation/presentation.dart';
import '../../ui/ui.dart';

class LoginState {
  String? idState;
  String? passwordState;

  String id = '';
  String password = '';

  String? mainErrorState;
  bool get isFormValid => idState == null && passwordState == null;
}

class StreamLoginPresenter implements LoginPresenter {
  final Validation validator;
  final AuthenticationUsecase authentication;
  StreamLoginPresenter({
    required this.validator,
    required this.authentication,
  });

  final _loginState = LoginState();
  final _controller = StreamController<LoginState>.broadcast();

  final _isLoadingController = StreamController<bool>.broadcast();

  @override
  Stream<String?> get idErrorStream =>
      _controller.stream.map((state) => state.idState).distinct();

  @override
  Stream<String?> get passwordErrorStream =>
      _controller.stream.map((state) => state.passwordState).distinct();

  @override
  Stream<bool> get isFormValidStream =>
      _controller.stream.map((state) => state.isFormValid).distinct();

  @override
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  @override
  Stream<String?> get mainErrorStream =>
      _controller.stream.map((state) => state.mainErrorState).distinct();

  @override
  void validateId(String id) {
    _loginState.id = id;
    _loginState.idState = validator.validate(field: 'id', value: id);
    _controller.add(_loginState);
  }

  @override
  void validatePassword(String password) {
    _loginState.password = password;
    _loginState.passwordState =
        validator.validate(field: 'password', value: password);
    _controller.add(_loginState);
  }

  @override
  Future<void> authenticate() async {
    _isLoadingController.add(true);
    try {
      await authentication.authenticate(
          id: _loginState.id, password: _loginState.password);
    } on DomainError catch (error) {
      _loginState.mainErrorState = error.description;
      _controller.add(_loginState);
    }
    _isLoadingController.add(false);
  }

  @override
  void dispose() {
    _controller.close();
    _isLoadingController.close();
  }
}
