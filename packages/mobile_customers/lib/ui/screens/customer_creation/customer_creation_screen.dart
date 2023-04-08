import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import '../screens.dart';
import 'components/components.dart';

class CustomerCreationScreen extends StatefulWidget {
  final CustomerCreationPresenter presenter;

  CustomerCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<CustomerCreationScreen> createState() => _CustomerCreationScreenState();
}

class _CustomerCreationScreenState extends State<CustomerCreationScreen>
    with LoadingManager, NavigationManager, UiErrorManager {
  @override
  void initState() {
    handleLoading(context, widget.presenter.isLoadingStream);
    handleNavigation(context, widget.presenter.navigateToStream);
    handleUiError(context, widget.presenter.mainErrorStream);
    super.initState();
  }

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
