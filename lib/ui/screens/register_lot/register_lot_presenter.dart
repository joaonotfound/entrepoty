import 'package:service_desk_2/domain/entities/entities.dart';

abstract class RegisterLotPresenter {
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  Stream<String?> get qtdErrorStream;
  Stream<String?> get modelErrorStream;

  Stream<String?> get navigateToStream;
  Stream<String?> get mainErrorStream;

  Stream<List<CreateStockItemEntity>> get itemsStreams;

  void validateForm();
  void validateQtd(int value);
  void validateModel(String value);

  Future<void> saveItem();
  Future<void> saveAll();

  Future<void> dispose();
}
