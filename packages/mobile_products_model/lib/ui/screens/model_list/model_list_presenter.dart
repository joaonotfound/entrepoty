import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../domain/domain.dart';

abstract class ModelListPresenter implements Listenable {
  Stream<List<ProductModelEntity>?> get modelsEntity;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Future<void> loadModels();
  Future<void> deleteModel(int id);
}
