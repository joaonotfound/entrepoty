import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';

class BorrowViewCustomer extends StatelessWidget {
  BorrowEntity borrow;

  BorrowViewCustomer({
    Key? key,
    required this.borrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customer = borrow.customer;

    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.person),),
      title: Text("Customer"),
      subtitle: Text(customer.name),
    );
  }
}
