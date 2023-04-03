import 'package:entrepoty/ui/screens/borrow/borrow_creation/borrow_creation_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BorrowCreationSubmit extends StatelessWidget {
  const BorrowCreationSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<BorrowCreationPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? () => presenter.create() : null,
            child: const Text("Create"),
          );
        });
  }
}
