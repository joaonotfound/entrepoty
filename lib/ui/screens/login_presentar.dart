abstract class LoginPresenter {
  Stream<String> get idErrorStream;
  Stream<String> get passwordErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<String> get mainErrorStream;

  void validateId(String id);
  void validatePassword(String password);
  void authenticate();
}
