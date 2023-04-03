import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/screens/customer/customer_creation/components/components.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomerCreationScreen extends StatefulWidget {
  CustomerCreationPresenter presenter;
  CustomerCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<CustomerCreationScreen> createState() => _CustomerCreationScreenState();
}

class _CustomerCreationScreenState extends State<CustomerCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return FormLayout(
      content: Form(
        child: ListView(children: [
          UserNameField(),
          SizedBox(height: 10),
          UserEmailField(),
          SizedBox(height: 10),
          CustomerEnrollmentField(),
          SizedBox(height: 10),
          CustomerSectorField(),
        ]),
      ),
      action: ElevatedButton(
        child: Text("Create"),
        onPressed: () {},
      ),
      title: "Create Customer",
    );
  }
}
