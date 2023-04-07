import 'package:flutter/material.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class BorrowListPresenter implements Listenable {
  Stream<List<BorrowEntity>?> get borrowsStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Future<void> loadBorrows();
}
