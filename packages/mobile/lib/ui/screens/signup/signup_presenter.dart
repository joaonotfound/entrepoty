import '../../misc/misc.dart';

abstract class SignupPresenter {
  Stream<String?> get nameErrorStream;
  Stream<String?> get usernameErrorStream;
  Stream<String?> get passwordErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;

  void validateName(String name);
  void validateUsername(String username);
  void validatePassword(String password);

  Future<void> signup();

  void dispose();
}
