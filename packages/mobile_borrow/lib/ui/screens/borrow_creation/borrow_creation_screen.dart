import 'package:mobile_core/mobile_core.dart';

import '../../ui.dart';
import 'components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BorrowCreationScreen extends StatefulWidget
    with UiErrorManager, LoadingManager {
  final BorrowCreationPresenter presenter;
  BorrowCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<BorrowCreationScreen> createState() => _BorrowCreationScreenState();
}

class _BorrowCreationScreenState extends State<BorrowCreationScreen> {
  @override
  void initState() {
    widget.handleUiError(context, widget.presenter.mainErrorStream);
    widget.handleLoading(context, widget.presenter.isLoadingStream);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => widget.presenter,
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
