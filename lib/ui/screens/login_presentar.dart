abstract class LoginPresenter {
  Stream<String> get idErrorStream;
  Stream<String> get passwordErrorStream;

  void validateId(String id);
  void validatePassword(String password);
}
