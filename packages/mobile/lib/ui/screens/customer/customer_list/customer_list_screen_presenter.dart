import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:entrepoty/domain/domain.dart';

abstract class CustomerListPresenter implements Listenable {
  Stream<List<CustomerEntity>?> get customersStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Future<void> loadCustomers();
  Future<void> deleteCustomer(String enrollment);
}
