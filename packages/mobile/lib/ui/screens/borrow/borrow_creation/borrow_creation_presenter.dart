import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';

abstract class BorrowCreationPresenter implements Listenable {
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;

  Stream<List<CustomerEntity>> get customersStream;
  Stream<List<ProductEntity>> get productsStream;

  void validateProduct(ProductEntity product);
  void validateCustomer(CustomerEntity customer);
  void validateDate(DateTime date);

  Future<void> loadCustomers();
  Future<void> loadProducts();

  Future<void> create();
}
