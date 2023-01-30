abstract class RegisterLotPresenter {
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<String?> get qtdErrorStream;
  Stream<String?> get modelErrorStream;
  Stream<String?> get navigateToStream;
  Stream<String?> get mainErrorStream;

  Future<void> register();
  Future<void> dispose();
}
