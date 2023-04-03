import 'package:entrepoty/ui/layout/layout.dart';

import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';

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
    return ListenableProvider(
      create: (context) => widget.presenter,
      child: FormLayout(
        content: Form(
          child: ListView(children: [
            CustomerCreationName(),
            SizedBox(height: 10),
            CustomerCreationEmailField(),
            SizedBox(height: 10),
            CustomerCreationEnrollmentField(),
            SizedBox(height: 10),
            CustomerCreationSectorField(),
          ]),
        ),
        action: CustomerCreationSubmit(),
        title: "Create Customer",
      ),
    );
  }
}
