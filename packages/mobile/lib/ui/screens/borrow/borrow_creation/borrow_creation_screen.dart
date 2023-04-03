import 'package:entrepoty/ui/screens/borrow/borrow_creation/borrow_creation_presenter.dart';

import 'components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../layout/layout.dart';

class BorrowCreationScreen extends StatelessWidget {
  BorrowCreationPresenter presenter;
  BorrowCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => presenter,
      child: FormLayout(
        content: Form(
          child: ListView(children: [
            BorrowCreationProduct(),
            SizedBox(height: 10),
            BorrowCreationUser(),
            SizedBox(height: 10),
            BorrowCreationDevolution()
          ]),
        ),
        action: BorrowCreationSubmit(),
        title: "Create Borrow",
      ),
    );
  }
}
