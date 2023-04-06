import 'package:entrepoty/ui/layout/layout.dart';

import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';

class CustomerCreationScreen extends StatelessWidget
    with LoadingManager, NavigationManager, UiErrorManager {
  CustomerCreationPresenter presenter;
  CustomerCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => presenter,
      child: Builder(builder: (context) {
        handleLoading(context, presenter.isLoadingStream);
        handleNavigation(context, presenter.navigateToStream);
        handleUiError(context, presenter.mainErrorStream);

        return FormLayout(
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
        );
      }),
    );
  }
}
