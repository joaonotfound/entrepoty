import 'components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../layout/layout.dart';

class BorrowCreationScreen extends StatelessWidget {
  const BorrowCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormLayout(
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
    );
  }
}
