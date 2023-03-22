import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:entrepoty/domain/entities/entities.dart';

abstract class RegisterItemPresenter implements Listenable {
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  Stream<String?> get qtdErrorStream;
  Stream<String?> get modelErrorStream;

  Stream<String?> get navigateToStream;
  Stream<UiError?> get mainErrorStream;

  Stream<List<CreateStockItemEntity>> get itemsStreams;

  void validateQtd(int value);
  void validateModel(String value);

  Future<void> saveItem();

  Future<void> dispose();
}
