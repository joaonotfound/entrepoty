abstract class LoginPresenter {
  Stream get idErrorStream;
  Stream get passwordErrorStream;

  void validateId(String id);
  void validatePassword(String password);
}
