import 'package:flutter/material.dart';
import 'package:service_desk_2/domain/entities/entities.dart';

abstract class RegisterItemPresenter implements Listenable {
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  Stream<String?> get qtdErrorStream;
  Stream<String?> get modelErrorStream;

  Stream<String?> get navigateToStream;
  Stream<String?> get mainErrorStream;

  Stream<List<CreateStockItemEntity>> get itemsStreams;

  void validateQtd(int value);
  void validateModel(String value);

  Future<void> saveItem();

  Future<void> dispose();
}
