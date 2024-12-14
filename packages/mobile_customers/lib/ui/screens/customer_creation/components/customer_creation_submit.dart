import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../ui.dart';

class CustomerCreationSubmit extends StatelessWidget {
  const CustomerCreationSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<CustomerCreationPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true
                ? () => presenter.authenticate(context)
                : null,
            child: const Text('Create'),
          );
        },);
  }
}
