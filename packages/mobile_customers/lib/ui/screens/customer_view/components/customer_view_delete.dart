import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_customers/mobile_customers.dart';

class CustomerViewDelete extends StatelessWidget {
  CustomerEntity customer;

  CustomerViewDelete({
    required this.customer, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<CustomerViewPresenter>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () => presenter.deleteCustomer(customer.enrollment),
        child: const Text('Delete'),
      ),
    );
  }
}
