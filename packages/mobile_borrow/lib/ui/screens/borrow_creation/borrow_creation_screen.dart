import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import '../../ui.dart';
import 'components/components.dart';

class BorrowCreationScreen extends StatefulWidget
    with UiErrorManager, LoadingManager {
  final BorrowCreationPresenter presenter;
  BorrowCreationScreen({
    required this.presenter, super.key,
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
            const BorrowCreationProduct(),
            const SizedBox(height: 10),
            BorrowCreationUser(),
            const SizedBox(height: 10),
            const BorrowCreationDevolution(),
          ],),
        ),
        action: const BorrowCreationSubmit(),
        title: 'Create Borrow',
      ),
    );
  }
}
