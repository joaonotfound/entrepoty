import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:entrepoty/domain/domain.dart';

abstract class BorrowListPresenter implements Listenable {
  Stream<List<BorrowEntity>?> get borrowsStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Future<void> loadBorrows();
}
