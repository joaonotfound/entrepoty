import 'package:flutter/material.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class CustomerListPresenter implements Listenable {
  Stream<List<CustomerEntity>?> get customersStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Future<void> loadCustomers();
  Future<void> deleteCustomer(String enrollment);
}
