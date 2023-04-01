import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';

import '../mixins/mixins.dart';

class GetxSignupPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxFormManager,
        GetxUiErrorManager,
        GetxNavigatorManager
    implements SignupPresenter {
  Validation validation;
  GetxSignupPresenter({
    required this.validation,
  });
  @override
  // TODO: implement nameErrorStream
  Stream<String?> get nameErrorStream => throw UnimplementedError();

  @override
  // TODO: implement passwordErrorStream
  Stream<String?> get passwordErrorStream => throw UnimplementedError();

  @override
  Future<void> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  // TODO: implement usernameErrorStream
  Stream<String?> get usernameErrorStream => throw UnimplementedError();

  @override
  void validateName(String name) {
    validation.validate(field: "name", value: name);
  }

  @override
  void validatePassword(String password) {
    // TODO: implement validatePassword
  }

  @override
  void validateUsername(String username) {
    // TODO: implement validateUsername
  }
}
