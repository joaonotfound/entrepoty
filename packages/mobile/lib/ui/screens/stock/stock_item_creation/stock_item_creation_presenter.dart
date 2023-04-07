import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:entrepoty/domain/entities/entities.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class StockItemCreationPresenter implements Listenable {
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  Stream<String?> get qtdErrorStream;
  Stream<String?> get modelErrorStream;

  Stream<String?> get navigateToStream;
  Stream<UiError?> get mainErrorStream;

  Stream<List<ProductModelEntity>> get modelsStream;

  void validateQtd(int value);
  void validateModel(int value);
  void loadModels();

  Future<void> saveItem();

  Future<void> dispose();
}
