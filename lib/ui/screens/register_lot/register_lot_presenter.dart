abstract class RegisterLotPresenter {
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  Stream<String?> get qtdErrorStream;
  Stream<String?> get modelErrorStream;

  Stream<String?> get navigateToStream;
  Stream<String?> get mainErrorStream;

  void validateForm();
  void validateQtd(int value);
  void validateModel(String value);

  Future<void> register();
  Future<void> dispose();
}
