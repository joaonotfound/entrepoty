abstract class LoginPresenter {
  Stream<String?> get idErrorStream;
  Stream<String?> get passwordErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<String?> get mainErrorStream;

  void validateId(String id);
  void validatePassword(String password);
  Future<void> authenticate();
  void dispose();
}
