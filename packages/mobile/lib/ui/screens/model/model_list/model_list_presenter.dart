import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../ui.dart';

abstract class ModelListPresenter implements Listenable {
  Stream<List<ProductModelEntity>?> get modelsEntity;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Future<void> loadModels();
}
