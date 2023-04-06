import 'package:entrepoty/presentation/mixins/getx_loading_manager.dart';
import 'package:entrepoty/presentation/mixins/gext_ui_error_manager.dart';
import 'package:entrepoty/ui/mixins/mixins.dart';
import 'package:entrepoty/ui/screens/borrow/borrow_creation/borrow_creation_presenter.dart';

import 'components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../layout/layout.dart';

class BorrowCreationScreen extends StatelessWidget
    with UiErrorManager, LoadingManager {
  BorrowCreationPresenter presenter;
  BorrowCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        handleUiError(context, presenter.mainErrorStream);
        handleLoading(context, presenter.isLoadingStream);

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
      },
    );
  }
}
