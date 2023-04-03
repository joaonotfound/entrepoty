import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/screens/model/model_creation/components/components.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelCreationScreen extends StatelessWidget
    with LoadingManager, NavigationManager, UiErrorManager {
  ModelCreationPresenter presenter;
  ModelCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => presenter,
      child: Builder(
        builder: (context) {
          handleLoginManager(context, presenter.isLoadingStream);
          handleNavigation(context, presenter.navigateToStream);
          handleUiError(context, presenter.mainErrorStream);

          return FormLayout(
            content: Form(
              child: ListView(children: [
                Text('The models'),
                ModelCreationNameField(),
              ]),
            ),
            action: ModelCreationSubmit(),
            title: "Create Product Model",
          );
        },
      ),
    );
  }
}
