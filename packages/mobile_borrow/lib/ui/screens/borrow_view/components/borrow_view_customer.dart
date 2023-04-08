import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import '../../../../domain/domain.dart';

class BorrowViewCustomer extends StatelessWidget {
  BorrowEntity borrow;

  BorrowViewCustomer({
    Key? key,
    required this.borrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customer = borrow.customer;

    return InkWell(
      onTap: () => Get.toNamed(Routes.getViewCustomer(borrow.customer.enrollment)),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person),),
        title: const Text("Customer"),
        subtitle: Text(customer.name),
      ),
    );
  }
}
